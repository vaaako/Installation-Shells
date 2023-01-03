#!/bin/bash

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
TITLE="GLUT and GLFW3 Install"
MENU="Choose wich one you want to install:"

OPTIONS=(
	1 "glut",
	2 "glfw3 (Ubuntu/Debian only)"
)


# Auto install for glut
function glut() {
	if [ -f /etc/redhat-release ]; then # Redhat system
	sudo dnf install make automake gcc gcc-c++ kernel-devel
	sudo dnf install mesa-libGLU mesa-libGL-devel freeglut-devel
	fi

	if [ -f /etc/lsb-release ]; then # Ubuntu/Debian system
		sudo apt install gcc build-essential
		sudo apt install libglu1-mesa-dev freeglut3-dev mesa-common-dev
	fi


	clear
	echo "# For OpenGL 2 
	export MESA_GLSL_VERSION_OVERRIDE=330
	export MESA_GL_VERSION_OVERRIDE=3.3

	if [ \$# -eq 0 ]; then
		echo \"Error: No file name entered\"
	    exit
	fi

	g++ \$1 -lGL -lGLU -lglut -lm
	./a.out # Run
	rm a.out
	" > glut-run
}


function glfw() {
	# echo "Building glfw-3.3.8"
	# sleep 5

	# sudo apt install cmake -y # To build
	# sudo apt install build-essential doxygen xorg-dev libglu1-mesa-dev # Dependencies


	# wget https://github.com/glfw/glfw/releases/download/3.3.8/glfw-3.3.8.zip # Getting zip
	# unzip glfw-3.3.8.zip

	# cd glfw-3.3.8.zip
	# sudo cmake -G "Unix Makefiles"
	# sudo make
	# sudo make install


	if [ -f /etc/redhat-release ]; then # Redhat system
		sudo dnf install make automake gcc gcc-c++ kernel-devel
		sudo dnf install libglfw3-dev mesa-libGLU freeglut-devel # I don't tested this
	fi

	if [ -f /etc/lsb-release ]; then # Ubuntu/Debian system
		sudo apt install gcc build-essential
		sudo apt install libglfw3-dev libglu1-mesa-dev freeglut3-dev
	fi


	clear
	echo "# For OpenGL 2 
	export MESA_GLSL_VERSION_OVERRIDE=330
	export MESA_GL_VERSION_OVERRIDE=3.3

	if [ \$# -eq 0 ]; then
		echo \"Error: No file name entered\"
		exit
	fi

	g++ \$1 -lglfw -lGLU -lGL
	./a.out # Run
	rm a.out
	" > glfw-run
}




if ! command -v dialog;
	then echo "Dialog not found";
fi

CHOICE=$(dialog --clear \
		--title "$TITLE" \
		--menu "$MENU" \
		$HEIGHT $WIDTH $CHOICE_HEIGHT \
		"${OPTIONS[@]}" \
		2>&1 >/dev/tty)

clear
case $CHOICE in
	1)
		glut
		;;

	2)
		glfw
		;;
esac


echo "Done! :)"
