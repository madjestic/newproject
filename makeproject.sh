#!/bin/sh

#   Creates a project directory structure (copies a template from the install location)
#   example:
# $ project foobar CPP simple
# > ./foobar/

# newproject application installation dir
SOURCE_DIR=/home/madjestic/Projects/newproject

makeproject() {
    if [ "$2" = "CPP" ]
		then
			  if [ "$3" = "simple" ]
        then
            mkdir $1
            cp -R $SOURCE_DIR/CPP/* `pwd`/$1/
        else
            echo "TEMPLATE ERROR"
	      fi
    elif [ "$2" = "haskell" ]
		then
        if [ "$3" = "simple" ]
        then
            echo "simple project tamplate does not exist yet"
        elif [ "$3" = "opengl" ]
        then
            if [ "$4" = "glfw" ]
            then
                mkdir $1
                cp -R $SOURCE_DIR/haskell/opengl/glfw/*           `pwd`/$1/
                cp -R $SOURCE_DIR/haskell/opengl/glfw/.gitignore  `pwd`/$1/
                cp -R $SOURCE_DIR/haskell/opengl/glfw/.stack-work `pwd`/$1/
                cd `pwd`/$1/
                sed -i 's/#ETALPMET#/'$1'/g' README.md
                sed -i 's/#ETALPMET#/'$1'/g' ETALPMET.cabal
                sed -i 's/#ETALPMET#/'$1'/g' run.sh
                mv ETALPMET.cabal $1.cabal
            else
                echo "ERROR: no template version specified or found"
	          fi
        else
            echo "ERROR: no template specified or found."
	      fi
    else
        echo "makeproject LANGUAGE TEMPLATE NAME"
        echo "CPP"
        echo "    simple"
        echo ""
        echo "haskell"
        echo "        simple"
        echo "        opengl glfw"
        echo "               sdl2"
        echo "example:"
        echo "   $ project foobar CPP simple"
        echo "   > creates a ./foobar CPP project"
    fi
}

makeproject $1 $2 $3 $4
