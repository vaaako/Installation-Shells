# Auto install for raylib

if [ -f /etc/redhat-release ]; then # Redhat system
	sudo dnf install make automake gcc gcc-c++ kernel-devel git -y # Required tools
	sudo dnf install alsa-lib-devel mesa-libGL-devel libX11-devel libXrandr-devel libXi-devel libXcursor-devel libXinerama-devel -y # Required libraries
fi

if [ -f /etc/lsb-release ]; then # Ubuntu/Debian system
	sudo apt install gcc make build-essential git cmake -y # Required tools
	sudo apt install libasound2-dev mesa-common-dev libx11-dev libxrandr-dev libxi-dev xorg-dev libgl1-mesa-dev libglu1-mesa-dev -y # Required libraries
fi



# Build raylib using make
git clone https://github.com/raysan5/raylib.git raylib
cd raylib/src/
make PLATFORM=PLATFORM_DESKTOP

# Install the library to the standard directories, usr/local/lib and /usr/local/include
# sudo make uninstall # Can also remove it
sudo make install

# Building Examples
cd ../examples/
make PLATFORM=PLATFORM_DESKTOP


# Make example
cd ../..
mkdir Raylib-Example

# main.cpp
echo '#include "raylib.h"

int main()
{
    InitWindow(800, 450, "raylib [core] example - basic window");

    while (!WindowShouldClose())
    {
        BeginDrawing();
            ClearBackground(RAYWHITE);
            DrawText("Congrats! You created your first window!", 190, 200, 20, LIGHTGRAY);
        EndDrawing();
    }

    CloseWindow();
}' > Raylib-Example/main.c

# run.sh
echo '# For OpenGL 2 
export MESA_GLSL_VERSION_OVERRIDE=330
export MESA_GL_VERSION_OVERRIDE=3.3

if [ $# -eq 0 ]; then
    echo "Error: No file name entered"
    exit
fi

cc $1 -lraylib -lGL -lm -lpthread -ldl -lrt -lX11 # Compile
./a.out # Run
rm a.out' > raylib-run
