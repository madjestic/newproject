#!/bin/sh

#   Creates a project directory structure (copies a template from the install location)
#   example:
# $ newproject foobar

# newproject application installation dir
NPDIR=/home/madjestic/Projects/newproject

makeproject() {
    mkdir $1
    cp -R $NPDIR/CPP/* `pwd`/$1/
}

makeproject $1
