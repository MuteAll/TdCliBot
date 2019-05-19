#!/bin/bash
	while(true) do
	echo "Bot has been actived"
	clear
	./tdbot -p agent -s /root/td-bot/bot.lua | grep -v "{"
	sleep 3
	done

