# How to build
- Make New Project
```
$sh buildTools/build_prepare.sh [Directory path which you make]
```

- Go to Directory which you make
```
$cd [Directory path which you make]
```

- Make File Setting
  - Change the Variable Value in the Makefile
    - LIBNAME : Name of Static Library
    - MAINNAME : Name of Main Projectt

- Make File Command
  - Only Build Project without any other external library
    ```
    make build
    ```
  - Only Build Static Library
    ```
    make static-lib
    ```
  - Build Project after Build External Library
    ```
    make all
    ```

## Directory Structure
- [Directory path which you make]
    - [Lib]
      - build_staticLib.sh
      - [headers]
      - [output]
      - [sources]
    - [Main]
      - build.sh
      - [headers]
      - [libs]
      - [output]
      - [sources]
    - Makefile
    - pre_build.sh