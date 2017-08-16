echo "################## Thank you for trying task_submitter #######################" 
pip3 install psutil 
chmod +x submit watcher watcher.py 
cp submit /usr/bin/
cp utilEmail.py /usr/bin/
cp watcher /usr/bin/
cp watcher.py /usr/bin/


# begin initialization, create config file 
echo "################## Installation finished, begin setting #######################"
echo -n "Your email to receive notification: "
read receiver 
echo [info] > /.task_submitter_config 
echo "receiver=$receiver" >> /.task_submitter_config 
echo -n "Email for sending notification (better to use a dedicated email for security reason, hit enter to use default): "
read sender
if [ ! -z $sender ]; then 
	echo -n "Password for the email: "
	read -s sender_pass 
	if [ ! -z $sender_pass ]; then 
		echo "sender=$sender" >> /.task_submitter_config 
		echo "sender_pass=$sender_pass" >> /.task_submitter_config 
	fi 
fi 
echo "################## Setting finished, use submit job to run jobs #######################"

