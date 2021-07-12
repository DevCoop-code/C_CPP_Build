#!/bin/bash
buildPath=$1
libraryName=$2

export objectFileSet
export sourceFileExtension

echo "Make Static Library"

if [ -d output ]; then
	echo "output directory already exists"
else
	$(mkdir output)
fi

# Remove All of Old Static library
$(rm -rf output/*)

if [ -d temp ]; then
	echo "Temp Directory already exists, Remove all of older temp files"

	$(rm -rf temp/)
else
	$(mkdir temp)
fi

# Compile the C or C++ Files
sourceFileSet=$(ls ${buildPath}/sources/*)

for sourceFile in ${sourceFileSet[@]}; do
	objectFileName=$(basename ${sourceFile})
	objectFileNameWithoutExtension="${objectFileName%.*}"

	sourceFileExtension="${objectFileName##*.}"

	if [ ${sourceFileExtension} == "cpp" ]; then
		if [ -d ${buildPath}/headers ]; then
			g++ -c ${sourceFile} -I ${buildPath}/headers
		else
			g++ -c ${sourceFile}
		fi
	else
		if [ -d ${buildPath}/headers ]; then
			gcc -c ${sourceFile} -I ${buildPath}/headers
		else
			gcc -c ${sourceFile}
		fi
	fi

	mv ${objectFileNameWithoutExtension}.o temp/

	objectFileSet="${objectFileSet} temp/${objectFileNameWithoutExtension}.o"
done

ar rs ${buildPath}/output/lib${libraryName}.a ${objectFileSet}

echo "Done"

$(rm -rf temp/)