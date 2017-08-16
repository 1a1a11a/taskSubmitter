echo "################## Thank you for trying task_submitter #######################" 
pip3 install psutil --user 
mkdir $HOME/.task_submitter
cp submit $HOME/.task_submitter/
cp utilEmail.py $HOME/.task_submitter/
cp watcher $HOME/.task_submitter/
cp watcher.py $HOME/.task_submitter/

# add to user shell profile, this is not complete, seeking a better way 
for p in $HOME/.bashrc $HOME/.bash_profile $HOME/.profile $HOME/.zshrc; do 
	if [ -e $p ]; then 
		# echo $p; 
		echo export PATH='$PATH:'$HOME/.task_submitter/ >> $p; 
	fi 
done 

# begin initialization, create config file 
echo "################## Installation finished, begin setting #######################"
echo -n "Your email to receive notification: "
read receiver 
echo [info] > $HOME/.task_submitter_config 
echo "receiver=$receiver" >> $HOME/.task_submitter_config 
echo -n "Email for sending notification (better to use a dedicated email for security reason, hit enter to use default): "
read sender
if [ ! -z $sender ]; then 
	echo -n "Password for the email: "
	read -s sender_pass 
	if [ ! -z $sender_pass ]; then 
		echo "sender=$sender" >> $HOME/.task_submitter_config 
		echo "sender_pass=$sender_pass" >> $HOME/.task_submitter_config 
	fi 
fi 
echo "################## Setting finished, you need to re-login to use it #######################"
source ~/.bash_profile 2>/dev/null 

