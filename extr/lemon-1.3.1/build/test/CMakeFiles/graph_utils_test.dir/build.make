# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/antala/prog/lemon-1.3.1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/antala/prog/lemon-1.3.1/build

# Include any dependencies generated for this target.
include test/CMakeFiles/graph_utils_test.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/graph_utils_test.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/graph_utils_test.dir/flags.make

test/CMakeFiles/graph_utils_test.dir/graph_utils_test.cc.o: test/CMakeFiles/graph_utils_test.dir/flags.make
test/CMakeFiles/graph_utils_test.dir/graph_utils_test.cc.o: ../test/graph_utils_test.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/antala/prog/lemon-1.3.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/graph_utils_test.dir/graph_utils_test.cc.o"
	cd /home/antala/prog/lemon-1.3.1/build/test && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/graph_utils_test.dir/graph_utils_test.cc.o -c /home/antala/prog/lemon-1.3.1/test/graph_utils_test.cc

test/CMakeFiles/graph_utils_test.dir/graph_utils_test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/graph_utils_test.dir/graph_utils_test.cc.i"
	cd /home/antala/prog/lemon-1.3.1/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/antala/prog/lemon-1.3.1/test/graph_utils_test.cc > CMakeFiles/graph_utils_test.dir/graph_utils_test.cc.i

test/CMakeFiles/graph_utils_test.dir/graph_utils_test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/graph_utils_test.dir/graph_utils_test.cc.s"
	cd /home/antala/prog/lemon-1.3.1/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/antala/prog/lemon-1.3.1/test/graph_utils_test.cc -o CMakeFiles/graph_utils_test.dir/graph_utils_test.cc.s

test/CMakeFiles/graph_utils_test.dir/graph_utils_test.cc.o.requires:

.PHONY : test/CMakeFiles/graph_utils_test.dir/graph_utils_test.cc.o.requires

test/CMakeFiles/graph_utils_test.dir/graph_utils_test.cc.o.provides: test/CMakeFiles/graph_utils_test.dir/graph_utils_test.cc.o.requires
	$(MAKE) -f test/CMakeFiles/graph_utils_test.dir/build.make test/CMakeFiles/graph_utils_test.dir/graph_utils_test.cc.o.provides.build
.PHONY : test/CMakeFiles/graph_utils_test.dir/graph_utils_test.cc.o.provides

test/CMakeFiles/graph_utils_test.dir/graph_utils_test.cc.o.provides.build: test/CMakeFiles/graph_utils_test.dir/graph_utils_test.cc.o


# Object files for target graph_utils_test
graph_utils_test_OBJECTS = \
"CMakeFiles/graph_utils_test.dir/graph_utils_test.cc.o"

# External object files for target graph_utils_test
graph_utils_test_EXTERNAL_OBJECTS =

test/graph_utils_test: test/CMakeFiles/graph_utils_test.dir/graph_utils_test.cc.o
test/graph_utils_test: test/CMakeFiles/graph_utils_test.dir/build.make
test/graph_utils_test: lemon/libemon.a
test/graph_utils_test: /usr/local/lib/libglpk.so
test/graph_utils_test: test/CMakeFiles/graph_utils_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/antala/prog/lemon-1.3.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable graph_utils_test"
	cd /home/antala/prog/lemon-1.3.1/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/graph_utils_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/graph_utils_test.dir/build: test/graph_utils_test

.PHONY : test/CMakeFiles/graph_utils_test.dir/build

test/CMakeFiles/graph_utils_test.dir/requires: test/CMakeFiles/graph_utils_test.dir/graph_utils_test.cc.o.requires

.PHONY : test/CMakeFiles/graph_utils_test.dir/requires

test/CMakeFiles/graph_utils_test.dir/clean:
	cd /home/antala/prog/lemon-1.3.1/build/test && $(CMAKE_COMMAND) -P CMakeFiles/graph_utils_test.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/graph_utils_test.dir/clean

test/CMakeFiles/graph_utils_test.dir/depend:
	cd /home/antala/prog/lemon-1.3.1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/antala/prog/lemon-1.3.1 /home/antala/prog/lemon-1.3.1/test /home/antala/prog/lemon-1.3.1/build /home/antala/prog/lemon-1.3.1/build/test /home/antala/prog/lemon-1.3.1/build/test/CMakeFiles/graph_utils_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/graph_utils_test.dir/depend
