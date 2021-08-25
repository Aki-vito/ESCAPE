#!/bin/bash
while true
do
	echo "Press CTRL+C to stop the script execution"
	git add .
	git commit -m "auto"
	git push -u origin master 
	git pull origin master
done
