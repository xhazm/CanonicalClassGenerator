#!/bin/bash

INDICATOR="->"
#	Checks right number of args #
if [ $# -eq 0 ]
	then
		echo $'\n[bash] [CanonicalClassCreator.sh] [FOLDER TO CREATE AND WRITE CLASSES IN] [CLASS 1 TO CREATE] [CLASS N TO CREATE] [...]\n'
		exit 1;	
fi

#	Checks if folder where data should be saved in is there, if not it creates it	#
if [[ -d "$1" ]]
	then
		echo "$INDICATOR $1 folder already exists and was not created"
	else
		mkdir $1
		echo "$INDICATOR $1 folder created"

fi

FOLDER=$1
TEMPLATE_CLASS_NAME="ClassName"
TMP_HPP_FOLDER="./templates/hpp/tmp/"
TMP_CPP_FOLDER="./templates/cpp/tmp/"
TMP_MAKE_FOLDER="./templates/makefile/tmp/"
TEMPLATE_HPP="./templates/hpp/*.hpp"
TEMPLATE_CPP="./templates/cpp/*.cpp"
TEMPLATE_MAKE="./templates/makefile/Makefile"
argv=("$@")
argc=$#

#	Creates tmp header from template and renames it with given class name	#
function create_hpp_class_from_template()
{
	upperstr=$(echo $1 | tr '[:lower:]' '[:upper:]')
	cp	$TEMPLATE_HPP $TMP_HPP_FOLDER
	sed -i '' -e 's/ClassName/'$1'/g' $TMP_HPP_FOLDER$TEMPLATE_CLASS_NAME.hpp
	sed -i '' -e 's/CLASSNAME_HPP/'$upperstr'_HPP/g' $TMP_HPP_FOLDER$TEMPLATE_CLASS_NAME.hpp
	mv	$TMP_HPP_FOLDER$TEMPLATE_CLASS_NAME.hpp $TMP_HPP_FOLDER$1.hpp 
}

#	Creates tmp cpp-file from template and renames it with given class name	#
function create_cpp_class_from_template()
{
	cp	$TEMPLATE_CPP $TMP_CPP_FOLDER
	sed -i '' -e 's/ClassName/'$1'/g' $TMP_CPP_FOLDER$TEMPLATE_CLASS_NAME.cpp
	mv	$TMP_CPP_FOLDER$TEMPLATE_CLASS_NAME.cpp $TMP_CPP_FOLDER$1.cpp 
}

#	Loops through input arguments, beginning with 1, creates Header and Cpp files from argv	#
for ((i=1; i<argc; i++));
do
	src_names+=${argv[i]}.cpp' '   #saves src-names for makefile
	create_hpp_class_from_template ${argv[i]}
	create_cpp_class_from_template ${argv[i]}
	echo "$INDICATOR ${argv[i]}.cpp & ${argv[i]}.hpp created in folder: $FOLDER'src' & $FOLDER'inc'"
done

#	Creates tmp Makefile and sets SRC of makefile to src_names	#
cp $TEMPLATE_MAKE $TMP_MAKE_FOLDER
sed -i '' -e "s/ClassName/$src_names/g" $TMP_MAKE_FOLDER*
echo "$INDICATOR Makefile created in folder: $FOLDER"

mkdir $FOLDER/src
mkdir $FOLDER/inc
mv $TMP_CPP_FOLDER* $FOLDER/src/
mv $TMP_HPP_FOLDER* $FOLDER/inc/
mv $TMP_MAKE_FOLDER* $FOLDER
