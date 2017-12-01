#!/bin/bash 

echo "################## Thank you for trying taskSubmitter #######################" 

# check python3 exists or not 
haspy3=$(python3 -V >/dev/null 2>&1; echo $?);
if [ ! "$haspy3" -eq 0 ]; then 
	echo "you do not have python3 installed, please install python3 first";
	exit 1;
fi 

# check pip3 exists or not 
haspip3=$(pip3 >/dev/null 2>&1; echo $?);

# if not installed, then install pip3 
if [ ! "$haspip3" -eq 0 ]; then 
	echo "################## install python3-pip #######################" 
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py;
	sudo python3 get-pip.py; 
fi 

# install psutil 
pip3 install psutil 

chmod +x submit watcher watcher.py 
cp submit /usr/bin/
cp utilEmail.py /usr/bin/
cp watcher /usr/bin/
cp watcher.py /usr/bin/


# begin initialization, create config file 
echo "################## Installation finished, begin setting #######################"
echo -n "Select your notification service: gmail / telegram (type service name, or just press Enter for gmail): "
read email_service
echo [info] > /.taskSubmitter_config  
if [ -z $email_service ] || [[ "$email_service" == "gmail" ]] ; then
	echo -n "Your email to receive notification: "
	read receiver 
	echo "receiver=$receiver" >> /.taskSubmitter_config 
	echo -n "Email for sending notification (better to use a dedicated email for security reason, hit enter to use default): "
	read sender
	if [ ! -z $sender ]; then 
		echo -n "Password for the email: "
		read -s sender_pass 
		if [ ! -z $sender_pass ]; then 
			echo "sender=$sender" >> /.taskSubmitter_config 
			echo "sender_pass=$sender_pass" >> /.taskSubmitter_config 
		fi 
	fi 
	echo "email_service=gmail" >> /.taskSubmitter_config 
elif [[ "$email_service" == "telegram" ]] ; then
	echo "email_service=telegram" >> /.taskSubmitter_config 
	echo "Go to this bot and obtain the webhook https://telegram.me/bullhorn_bot?start "
	echo -n "Enter the webhook URL: "
	read telegram_api_address 
	echo "telegram_api_address=$telegram_api_address" >> /.taskSubmitter_config 
fi
echo "################## We're all set! use submit job to run jobs #######################"

