# Auto install for raylib

if [ -f /etc/redhat-release ]; then # Redhat system
	sudo dnf install SFML-devel
fi

if [ -f /etc/lsb-release ]; then # Ubuntu/Debian system
	sudo apt-get install libsfml-dev
fi


clear
echo "if [ $1 -eq 0 ]; then
	echo Error: No file name entered
	exit
fi

g++ $1 -lsfml-graphics -lsfml-window -lsfml-system
./a.out # Run
rm a.out

" > sfml-run
