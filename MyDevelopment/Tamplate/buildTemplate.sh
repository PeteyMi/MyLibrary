#!/bin/sh
# Copyright (C) Pierre d'Herbemont, 2010
# Copyright (C) Felix Paul Kühne, 2012-2013

EXECUTION_FOLDER="$(dirname $0)"
TEMPLATE_BASE="My Base Application.xctemplate"
TEMPLATE_NAME="My Library.xctemplate"
MY_LIBRARY="MyLibrary"
TEMPLATE_FOLDER="$HOME/Library/Developer/Xcode/Templates/Project Templates/iOS/Application/"
PLIST_FILE="$TEMPLATE_NAME/TemplateInfo.plist"

echo $TEMPLATE_FOLDER

cd `dirname $0`
CurrentDirectory=`pwd`
echo $CurrentDirectory

function findNodes()
{
    for file in `ls $1`
    do
        if [ -d $1"/"$file ]
        then
            findNodes $1"/"$file
        else
            filePath=$1"/"$file
            echo "<string>"${filePath#*./}"</string>"
        fi
    done
}

function createDefinitions()
{
    for file in `ls $1`
    do
    if [ -d $1"/"$file ]
    then
        createDefinitions $1"/"$file
    else
        filePath=$1"/"$file
        filePath=${filePath#*./}
        echo "<key>"${filePath}"</key>"
        echo "<dict>"
        echo "<key>Group</key>"
        echo "<array>"
        array=($(echo $filePath | tr '/' ' ' | tr -s ' '))
        length=${#array[@]}

        for ((i=0; i<$length - 1; i++))
        do
        echo "<string>"${array[$i]}"</string>"
        done
        echo "</array>"
        echo "<key>Path</key>"
        echo "<string>"${filePath}"</string>"
        echo "<key>TargetIndices</key>"
        echo "<array/>"
        echo "</dict>"
    fi
    done
}

copy_files()
{
    if [[ ! -d "$2" ]]; then
        mkdir -p "$2"
    fi
    SOURCE_DIR="${EXECUTION_FOLDER}/${1}"
    rsync -r --exclude=".*" "$SOURCE_DIR" "$2"
}

check_status()
{
    if [[ "$?" != "0" ]]; then
        log_error 99
    fi
}

install_templates()
{
    echo -n "Installing Xcode Templates"

    copy_files "$TEMPLATE_BASE" "$TEMPLATE_FOLDER"
    copy_files "$TEMPLATE_NAME" "$TEMPLATE_FOLDER"
    copy_files "$MY_LIBRARY" "$TEMPLATE_FOLDER/$TEMPLATE_NAME"
}

echo "" > $PLIST_FILE

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" | cat >> $PLIST_FILE
echo "<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">" | cat >> $PLIST_FILE
echo "<plist version=""1.0"">" | cat >> $PLIST_FILE
echo "<dict>" | cat >> $PLIST_FILE

echo "<key>Description</key>" | cat >> $PLIST_FILE
echo "<string>This is a template description.</string>" | cat >> $PLIST_FILE
echo "<key>Identifier</key>"    | cat >> $PLIST_FILE
echo "<string>"$1"</string>" | cat >> $PLIST_FILE
echo "<key>Kind</key>"  | cat >> $PLIST_FILE
echo "<string>Xcode.Xcode3.ProjectTemplateUnitKind</string>"    | cat >> $PLIST_FILE

echo "<key>Nodes</key>" | cat >> $PLIST_FILE
echo "<array>"  | cat >> $PLIST_FILE
findNodes "./MyLibrary" | cat >> $PLIST_FILE
echo "</array>" | cat >> $PLIST_FILE

echo "<key>Definitions</key>" | cat >> $PLIST_FILE
echo "<dict>" | cat >> $PLIST_FILE
createDefinitions "./MyLibrary" cat >> $PLIST_FILE
echo "</dict>" | cat >> $PLIST_FILE

echo "</dict>"  | cat >> $PLIST_FILE
echo "</plist>" | cat >> $PLIST_FILE

echo -n "Deleting Libraries"
rm -rf "$TEMPLATE_FOLDER"

install_templates
