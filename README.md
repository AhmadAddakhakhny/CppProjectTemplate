# CppProjectTemplate

This is a template for modern C++ projects. What you get is:
* Application, third party libraries and test code separated in distinct folders.
* Use of modern CMake for building and compiling
* External libraries installed and managed by
  * CPM package manager
* Unit testing using gtest
* General purpose libraries: JSON
* Code documentation with Doxygen
* Tooling: Clang-Format, Clang-format-diff, Cmake-format, Clang-tidy, Sanitizers


## Structures
```
project/
├── app/                   # Main program code
├── build/                 # Out build files into out directore
│   └── scripts/           # Scripts for setting project environment variables
├── cmake/                 # User defined cmake includes
├── configured/            # lookup of header file/s to be generated during compilation time.
├── docs/                  # Support Doxygen Documentation
├── external/              # Third party libs. source code
├── lib/                   # Utility lib. for reusable modules that can be used across different parts of your project (i.e. string manipulation, math, file I/O)
├── src/                   # Utility lib. for reusable modules that can be used across different parts of your project focused on how your application behaves (UDS, CAN)
├── tests/                 # Unit test
├── tools/                 # Development tools for development process i.e. linters, and formaters (i.e. LLVM clang flavours)
├── .clang-format          # Clang-format config file
├── .clang-tidy            # Clang-tidy config file
├── .cmake-format.yaml     # cmake-format config file
├── .gitignore             # Execlude dir/files  from beaing tracked
├── CMakeLists.txt         # Central project CMakeLists.txt file
├── LICENSE                # Project LICENSE
├── Makefile               # Build prject using Make rules
```

## Software Requirements
* CMake 3.21+
* GNU Makefile
* Doxygen
* CPM
* G++9 (or higher), Clang++9 (or higher)
* Code Coverage (only on GNU|Clang): gcovr
* Makefile, Doxygen

## Software Requirements
### Clone
```
# tbd
```

#### App Executable
```
# tbd
```

### Unit testing
```
# tbd
```

### Documentation
```
# tbd
```

### Code Coverage (Unix only)
```
# tbd
```
