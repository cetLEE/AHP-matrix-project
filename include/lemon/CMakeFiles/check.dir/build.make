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
CMAKE_SOURCE_DIR = /home/adam/AHP-matrix-project

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/adam/AHP-matrix-project

# Utility rule file for check.

# Include the progress variables for this target.
include include/lemon/CMakeFiles/check.dir/progress.make

include/lemon/CMakeFiles/check:
	cd /home/adam/AHP-matrix-project/include/lemon && /usr/bin/ctest

check: include/lemon/CMakeFiles/check
check: include/lemon/CMakeFiles/check.dir/build.make

.PHONY : check

# Rule to build all files generated by this target.
include/lemon/CMakeFiles/check.dir/build: check

.PHONY : include/lemon/CMakeFiles/check.dir/build

include/lemon/CMakeFiles/check.dir/clean:
	cd /home/adam/AHP-matrix-project/include/lemon && $(CMAKE_COMMAND) -P CMakeFiles/check.dir/cmake_clean.cmake
.PHONY : include/lemon/CMakeFiles/check.dir/clean

include/lemon/CMakeFiles/check.dir/depend:
	cd /home/adam/AHP-matrix-project && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/adam/AHP-matrix-project /home/adam/AHP-matrix-project/include/lemon /home/adam/AHP-matrix-project /home/adam/AHP-matrix-project/include/lemon /home/adam/AHP-matrix-project/include/lemon/CMakeFiles/check.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : include/lemon/CMakeFiles/check.dir/depend

