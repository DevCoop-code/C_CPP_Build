LIBNAME=MathTest
MAINNAME=Main

all: static-lib
	@echo "=====Build All====="
	@sh pre_build.sh
	@sh Main/build.sh Main ${MAINNAME}

static-lib:
	@echo "=====Build Library====="
	@sh Lib/build_staticLib.sh Lib ${LIBNAME}
	
build:
	@echo "=====Build Main Project====="
	@sh Main/build.sh Main ${MAINNAME}