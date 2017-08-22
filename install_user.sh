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
	python3 get-pip.py --user; 
fi 

# install psutil 
pip3 install psutil --user 

chmod +x submit watcher watcher.py 
mkdir $HOME/.taskSubmitter

cp submit $HOME/.taskSubmitter/
cp utilEmail.py $HOME/.taskSubmitter/
cp watcher $HOME/.taskSubmitter/
cp watcher.py $HOME/.taskSubmitter/

# add to user shell profile, this is not complete, seeking a better way 
for p in $HOME/.bashrc $HOME/.bash_profile $HOME/.profile $HOME/.zshrc; do 
	if [ -e $p ]; then 
		# echo $p; 
		echo export PATH='$PATH:'$HOME/.taskSubmitter/ >> $p; 
	fi 
done 

# begin initialization, create config file 
echo "################## Installation finished, begin setting #######################"
echo -n "Your email to receive notification: "
read receiver 
echo [info] > $HOME/.taskSubmitter_config 
echo "receiver=$receiver" >> $HOME/.taskSubmitter_config 
echo -n "Email for sending notification (better to use a dedicated email for security reason, hit enter to use default): "
read sender
if [ ! -z $sender ]; then 
	echo -n "Password for the email: "
	read -s sender_pass 
	if [ ! -z $sender_pass ]; then 
		echo "sender=$sender" >> $HOME/.taskSubmitter_config 
		echo "sender_pass=$sender_pass" >> $HOME/.taskSubmitter_config 
	fi 
fi 
echo "################## Setting finished, you need to re-login to use it #######################"
source ~/.bash_profile 2>/dev/null 

