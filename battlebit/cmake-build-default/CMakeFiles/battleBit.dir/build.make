# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

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
CMAKE_COMMAND = /snap/clion/129/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/129/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/timothyb/Documents/csci-366-fall2020-private/battlebit

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/timothyb/Documents/csci-366-fall2020-private/battlebit/cmake-build-default

# Include any dependencies generated for this target.
include CMakeFiles/battleBit.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/battleBit.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/battleBit.dir/flags.make

CMakeFiles/battleBit.dir/src/main.c.o: CMakeFiles/battleBit.dir/flags.make
CMakeFiles/battleBit.dir/src/main.c.o: ../src/main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/timothyb/Documents/csci-366-fall2020-private/battlebit/cmake-build-default/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/battleBit.dir/src/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/battleBit.dir/src/main.c.o   -c /home/timothyb/Documents/csci-366-fall2020-private/battlebit/src/main.c

CMakeFiles/battleBit.dir/src/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/battleBit.dir/src/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/timothyb/Documents/csci-366-fall2020-private/battlebit/src/main.c > CMakeFiles/battleBit.dir/src/main.c.i

CMakeFiles/battleBit.dir/src/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/battleBit.dir/src/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/timothyb/Documents/csci-366-fall2020-private/battlebit/src/main.c -o CMakeFiles/battleBit.dir/src/main.c.s

CMakeFiles/battleBit.dir/src/server.c.o: CMakeFiles/battleBit.dir/flags.make
CMakeFiles/battleBit.dir/src/server.c.o: ../src/server.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/timothyb/Documents/csci-366-fall2020-private/battlebit/cmake-build-default/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/battleBit.dir/src/server.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/battleBit.dir/src/server.c.o   -c /home/timothyb/Documents/csci-366-fall2020-private/battlebit/src/server.c

CMakeFiles/battleBit.dir/src/server.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/battleBit.dir/src/server.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/timothyb/Documents/csci-366-fall2020-private/battlebit/src/server.c > CMakeFiles/battleBit.dir/src/server.c.i

CMakeFiles/battleBit.dir/src/server.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/battleBit.dir/src/server.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/timothyb/Documents/csci-366-fall2020-private/battlebit/src/server.c -o CMakeFiles/battleBit.dir/src/server.c.s

CMakeFiles/battleBit.dir/src/repl.c.o: CMakeFiles/battleBit.dir/flags.make
CMakeFiles/battleBit.dir/src/repl.c.o: ../src/repl.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/timothyb/Documents/csci-366-fall2020-private/battlebit/cmake-build-default/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/battleBit.dir/src/repl.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/battleBit.dir/src/repl.c.o   -c /home/timothyb/Documents/csci-366-fall2020-private/battlebit/src/repl.c

CMakeFiles/battleBit.dir/src/repl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/battleBit.dir/src/repl.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/timothyb/Documents/csci-366-fall2020-private/battlebit/src/repl.c > CMakeFiles/battleBit.dir/src/repl.c.i

CMakeFiles/battleBit.dir/src/repl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/battleBit.dir/src/repl.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/timothyb/Documents/csci-366-fall2020-private/battlebit/src/repl.c -o CMakeFiles/battleBit.dir/src/repl.c.s

CMakeFiles/battleBit.dir/src/game.c.o: CMakeFiles/battleBit.dir/flags.make
CMakeFiles/battleBit.dir/src/game.c.o: ../src/game.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/timothyb/Documents/csci-366-fall2020-private/battlebit/cmake-build-default/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/battleBit.dir/src/game.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/battleBit.dir/src/game.c.o   -c /home/timothyb/Documents/csci-366-fall2020-private/battlebit/src/game.c

CMakeFiles/battleBit.dir/src/game.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/battleBit.dir/src/game.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/timothyb/Documents/csci-366-fall2020-private/battlebit/src/game.c > CMakeFiles/battleBit.dir/src/game.c.i

CMakeFiles/battleBit.dir/src/game.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/battleBit.dir/src/game.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/timothyb/Documents/csci-366-fall2020-private/battlebit/src/game.c -o CMakeFiles/battleBit.dir/src/game.c.s

CMakeFiles/battleBit.dir/src/char_buff.c.o: CMakeFiles/battleBit.dir/flags.make
CMakeFiles/battleBit.dir/src/char_buff.c.o: ../src/char_buff.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/timothyb/Documents/csci-366-fall2020-private/battlebit/cmake-build-default/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/battleBit.dir/src/char_buff.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/battleBit.dir/src/char_buff.c.o   -c /home/timothyb/Documents/csci-366-fall2020-private/battlebit/src/char_buff.c

CMakeFiles/battleBit.dir/src/char_buff.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/battleBit.dir/src/char_buff.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/timothyb/Documents/csci-366-fall2020-private/battlebit/src/char_buff.c > CMakeFiles/battleBit.dir/src/char_buff.c.i

CMakeFiles/battleBit.dir/src/char_buff.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/battleBit.dir/src/char_buff.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/timothyb/Documents/csci-366-fall2020-private/battlebit/src/char_buff.c -o CMakeFiles/battleBit.dir/src/char_buff.c.s

CMakeFiles/battleBit.dir/src/helper.c.o: CMakeFiles/battleBit.dir/flags.make
CMakeFiles/battleBit.dir/src/helper.c.o: ../src/helper.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/timothyb/Documents/csci-366-fall2020-private/battlebit/cmake-build-default/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/battleBit.dir/src/helper.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/battleBit.dir/src/helper.c.o   -c /home/timothyb/Documents/csci-366-fall2020-private/battlebit/src/helper.c

CMakeFiles/battleBit.dir/src/helper.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/battleBit.dir/src/helper.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/timothyb/Documents/csci-366-fall2020-private/battlebit/src/helper.c > CMakeFiles/battleBit.dir/src/helper.c.i

CMakeFiles/battleBit.dir/src/helper.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/battleBit.dir/src/helper.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/timothyb/Documents/csci-366-fall2020-private/battlebit/src/helper.c -o CMakeFiles/battleBit.dir/src/helper.c.s

CMakeFiles/battleBit.dir/src/assembly_demo.asm.o: CMakeFiles/battleBit.dir/flags.make
CMakeFiles/battleBit.dir/src/assembly_demo.asm.o: ../src/assembly_demo.asm
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/timothyb/Documents/csci-366-fall2020-private/battlebit/cmake-build-default/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building ASM_NASM object CMakeFiles/battleBit.dir/src/assembly_demo.asm.o"
	/usr/bin/nasm $(ASM_NASM_INCLUDES) $(ASM_NASM_FLAGS) -f elf64 -o CMakeFiles/battleBit.dir/src/assembly_demo.asm.o /home/timothyb/Documents/csci-366-fall2020-private/battlebit/src/assembly_demo.asm

# Object files for target battleBit
battleBit_OBJECTS = \
"CMakeFiles/battleBit.dir/src/main.c.o" \
"CMakeFiles/battleBit.dir/src/server.c.o" \
"CMakeFiles/battleBit.dir/src/repl.c.o" \
"CMakeFiles/battleBit.dir/src/game.c.o" \
"CMakeFiles/battleBit.dir/src/char_buff.c.o" \
"CMakeFiles/battleBit.dir/src/helper.c.o" \
"CMakeFiles/battleBit.dir/src/assembly_demo.asm.o"

# External object files for target battleBit
battleBit_EXTERNAL_OBJECTS =

battleBit: CMakeFiles/battleBit.dir/src/main.c.o
battleBit: CMakeFiles/battleBit.dir/src/server.c.o
battleBit: CMakeFiles/battleBit.dir/src/repl.c.o
battleBit: CMakeFiles/battleBit.dir/src/game.c.o
battleBit: CMakeFiles/battleBit.dir/src/char_buff.c.o
battleBit: CMakeFiles/battleBit.dir/src/helper.c.o
battleBit: CMakeFiles/battleBit.dir/src/assembly_demo.asm.o
battleBit: CMakeFiles/battleBit.dir/build.make
battleBit: CMakeFiles/battleBit.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/timothyb/Documents/csci-366-fall2020-private/battlebit/cmake-build-default/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking C executable battleBit"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/battleBit.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/battleBit.dir/build: battleBit

.PHONY : CMakeFiles/battleBit.dir/build

CMakeFiles/battleBit.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/battleBit.dir/cmake_clean.cmake
.PHONY : CMakeFiles/battleBit.dir/clean

CMakeFiles/battleBit.dir/depend:
	cd /home/timothyb/Documents/csci-366-fall2020-private/battlebit/cmake-build-default && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/timothyb/Documents/csci-366-fall2020-private/battlebit /home/timothyb/Documents/csci-366-fall2020-private/battlebit /home/timothyb/Documents/csci-366-fall2020-private/battlebit/cmake-build-default /home/timothyb/Documents/csci-366-fall2020-private/battlebit/cmake-build-default /home/timothyb/Documents/csci-366-fall2020-private/battlebit/cmake-build-default/CMakeFiles/battleBit.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/battleBit.dir/depend

