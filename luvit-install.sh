#!/bin/bash
# Auto install `luvit` and `discordia` 

FILE_CONTENT = "
local discordia = require('discordia')
local client = discordia.Client()

client:on('ready', function()
	print('Logged in as '..client.user.username)
end)

client:on('messageCreate', function(message)
	if message.content == '!ping' then
		message.channel:send('Pong!')
	end
end)

client:run('Bot TOKEN') # 'Bot' needs to stay here
"

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
TITLE="Luvit and Discord Install"
MENU="Choose one of the following options:"

OPTIONS=(1 "Luvit"
         2 "Discordia"
         3 "Remove luvit")

CHOICE=$(dialog --clear \
        --title "$TITLE" \
        --menu "$MENU" \
        $HEIGHT $WIDTH $CHOICE_HEIGHT \
        "${OPTIONS[@]}" \
        2>&1 >/dev/tty)

clear
case $CHOICE in
    1)
		clear

		# Installing
		mkdir luvit
		cd luvit
        curl -L https://github.com/luvit/lit/raw/master/get-lit.sh | sh # Install luvit

        # Coping lit and luvit files to /bin
        sudo cp lit luvit /bin/
        ;;
    2)
		mkdir myDiscordiaBot
		cd myDiscordiaBot

		clear
        lit install SinisterRectus/discordia # Installing dicordia
		echo "
local discordia = require('discordia')
local client = discordia.Client()

client:on('ready', function()
	print('Logged in as '..client.user.username)
end)

client:on('messageCreate', function(message)
	if message.content == '!ping' then
		message.channel:send('Pong!')
	end
end)

client:run('Bot TOKEN') -- 'Bot' needs to stay here
		" > main.lua
		clear
		echo "To run 'main.lua' use the command 'luvit main.lua'
		The folder 'deps' need to stay at the same folder of 'main.lua'" > README.txt
		sleep 5
        ;;

    3)
		sudo rm -r /bin/lit /bin/luvit

		clear
		echo "To finish, remove 'luvit'"
		sleep 5
		;;
esac
