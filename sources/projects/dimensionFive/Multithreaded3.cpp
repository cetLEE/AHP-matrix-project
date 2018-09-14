// I/O streams
#include <iostream>
#include <fstream>

// Datastructures
#include <vector>
#include <list>

// Algorithm utilities
#include <algorithm>

// Multithreading support
#include <thread>
#include <mutex>

// Matrix permutation calculator utility class
//#include "Matrix.hpp"
#include "Eigen/Dense"
#include "Eigen/Eigenvalues"

#include "MatrixStr.h"
#include "DistributedFile.hpp"

// typedefs
typedef unsigned long long int Ulli;
typedef unsigned short Ush;

// forward declarations
class ThreadController;
void isConsistent(ThreadController* controller, Ulli index, std::vector<unsigned short> nextVector);

// constants
const Ulli ALL = 2015993900449;
const std::vector<double> elements = {1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,1.0/2,1.0/3,1.0/4,1.0/5,1.0/6,1.0/7,1.0/8,1.0/9};

template<size_t N>
std::vector<unsigned short> indexToVector (Ulli x) {
    std::vector<unsigned short> v;
    for (unsigned short i = 0; i < N * (N - 1) / 2; i++) {
        unsigned short tmp = x % elements.size();
        x /= elements.size();
        v.push_back(tmp);
    }
    std::reverse(v.begin(), v.end());
    if (v.size() != 10)
        throw "The size does not match in indexToVector function!\n";
    return v;
}

Ulli vectorToIndex (std::vector<unsigned short> v) {
    if (v.size() != 10)
        throw "The size does not match in vectorToIndex function!\n";
    Ulli ret = 0;
    for (Ush i = 0; i < v.size(); i++) {
        ret *= elements.size();
        ret += v.at(i);
    }
    return ret;
}

class ThreadController {
private:
    Ulli finished;
    Ulli next;
    std::vector<unsigned short> nextVector;

    unsigned int maxThreads;
    unsigned int threads;

    std::vector<MatrixStr<5>> perms;

    std::mutex fileMutex;
    std::ofstream* file;

private:
    std::vector<unsigned short> getNextVector() {
        for (auto rit = nextVector.rbegin(); rit != nextVector.rend(); rit++) {
            if (*rit == 17) {
                *rit = 0;
            } else {
                (*rit)++;
                break;
            }
        }
        return nextVector;
    }

    void startThread() {
        std::thread thread(isConsistent, this, next++, getNextVector());
        thread.detach();
        threads++;
    }

public:
    ThreadController():
        finished(0),
        next(0),
        maxThreads(10),
        threads(0)
    {
        std::cout << "ThreadController setting up.\n";
        {
            MatrixStr<5> ms;
            Ush perm[] = {0, 1, 2, 3, 4};
            do {
                MatrixStr<5> tmp = ms.permutateBy(perm);
                perms.push_back(tmp);
            } while (std::next_permutation (perm, perm + 5));
        }
        std::cout << "Permutations calculated.\n";

        for (unsigned short i = 0; i < 10; i++) {
            nextVector.push_back(0);
        }

        file = new std::ofstream("../results/consistent5x5.txt");
    }
    void start() {
        {
            for (unsigned int i = 0; i < maxThreads; i++) {
                std::lock_guard<std::mutex> localLock(fileMutex);
                startThread();
            }
        }

        std::vector<Ush> vec;
        for (Ush i = 0; i < 10; i++) {
            vec.push_back(0);
        }

        while (true) {
            std::this_thread::sleep_for(std::chrono::seconds(5));
            {
                std::lock_guard<std::mutex> localLock(fileMutex);
                std::cout << "The next index is" << next << std::endl;
                if (finished == ALL) {
                    break;
                }
            }
        }
    }
    void threadExitedWithResult(Ulli n, bool b) {
        std::lock_guard<std::mutex> localLock(fileMutex);
        if (b) {
            *file << n << "\n";
        }
        finished++;
        if (--threads >= maxThreads) {
            std::cout << "ERROR! More thread than allowed!\n";
            std::terminate();
        }
        if (next < ALL) {
            startThread();
        }
    }
};

inline bool isLeftLess(std::vector<unsigned short> left, std::vector<unsigned short> right) {
    for (unsigned short i = 0; i < left.size(); i++) {
        if (left < right)
            return true;
        else if (left > right)
            return false;
    }
    return false;
}

const std::vector<double> matrixElems = {1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,1.0/2,1.0/3,1.0/4,1.0/5,1.0/6,1.0/7,1.0/8,1.0/9};

Ush indexOfInverse(Ush i) {
	if (i == 0)
		return 0;
	if (i > 8)
		return i - 8;
	else
		return i + 8;
}

Ush indexOfElement(Ush i, Ush j, std::vector<Ush> v) {
	if (i == j)
		return 0;
	else if (i < j)
		return v[j - 1 + (2 * 5 - i - 3) * i / 2];
	else {
		return indexOfInverse(indexOfElement(j, i, v));
	}
}

Eigen::MatrixXd toEigenMatrix(std::vector<Ush> v) {
	Eigen::MatrixXd m;
	m = Eigen::MatrixXd(5,5);
	for (size_t i = 0; i < 5; i++) {
		for (size_t j = 0; j < 5; j++) {
			m(i,j) = matrixElems[indexOfElement(i,j, v)];
		}
	}
	return m;
}

void isConsistent(ThreadController* controller, Ulli index, std::vector<unsigned short> nextVector) {
    bool b;
	Eigen::MatrixXd m = toEigenMatrix(nextVector);

    Eigen::VectorXcd eigenvals = m.eigenvalues();
	double largestEigVal = eigenvals[0].real();
	for (int i = 1; i < eigenvals.rows(); i++) {
		if (largestEigVal < eigenvals[i].real()) {
			largestEigVal = eigenvals[i].real();
		}
	}
    double consistencyRatio = (largestEigVal-m.rows())/(9.435-m.rows());
    if (consistencyRatio <= 0.1)
        b = true;
    else
        b = false;

    controller->threadExitedWithResult(index, b);
}

int main() {
    std::cout << "The number of threads that can run concurrently is "
        << std::thread::hardware_concurrency() << std::endl;

    ThreadController controller;
    controller.start();
    std::cout << "Procedure successfully completed!\n";
    return 0;
}
