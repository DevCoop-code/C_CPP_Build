#!/bin/bash
rootBuildPath=$1
export objectFileSet
export sourceFileExtension

echo "=====Build C/C++ using gcc compiler====="

if [ -f output ]; then
	echo "output directory already exists"
else
	$(mkdir output)
fi


# Delete all of old output data
$(rm -rf output/*)

if [ -f temp ]; then
	echo "temp directory already exists"
	
	$(rm -rf temp/)
	$(mkdir temp)	
else
	$(mkdir temp)
fi

# Compile the files
sourceFileSet=$(ls ${rootBuildPath}/sources/*.cpp)

for sourceFile in ${sourceFileSet[@]}; do
	objectFileName=$(basename ${sourceFile})
	objectNameWithoutExtension="${objectFileName%.*}"
	sourceFileExtension="${objectFileName##*.}"

	if [ ${sourceFileExtension} == "cpp" ]; then
		g++ -c ${sourceFile} -I ${rootBuildPath}/headers/
	else
		gcc -c ${sourceFile} -I ${rootBuildPath}/headers/
	fi
	mv ${objectNameWithoutExtension}.o temp/

	objectFileSet=${objectFileSet}temp/${objectNameWithoutExtension}.o
done

if [ ${sourceFileExtension} == 'cpp' ]; then
	g++ $objectFileSet -o output/main
else
	gcc $objectFileSet -o output/main
fi

$(rm -rf temp/)

./output/main

