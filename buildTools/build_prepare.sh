#!/bin/bash
rootBuildPath=$1

if [ -d ${rootBuildPath} ]; then
	echo "${rootBuildPath} directory already exists"
else
	$(mkdir ${rootBuildPath})
	cp $(pwd)/buildTools/Makefile ${rootBuildPath}/Makefile
	
	$(mkdir ${rootBuildPath}/Main)
	$(mkdir ${rootBuildPath}/Lib)
	cp $(pwd)/buildTools/pre_build.sh ${rootBuildPath}/pre_build.sh
	
	$(mkdir ${rootBuildPath}/Main/headers)
	$(mkdir ${rootBuildPath}/Main/libs)
	$(mkdir ${rootBuildPath}/Main/output)
	$(mkdir ${rootBuildPath}/Main/sources)
	cp $(pwd)/buildTools/build.sh ${rootBuildPath}/Main/build.sh

	$(mkdir ${rootBuildPath}/Lib/headers)
	$(mkdir ${rootBuildPath}/Lib/output)
	$(mkdir ${rootBuildPath}/Lib/sources)
	cp $(pwd)/buildTools/build_staticLib.sh ${rootBuildPath}/Lib/build_staticLib.sh
fi
