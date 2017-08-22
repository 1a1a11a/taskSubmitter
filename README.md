taskSubmitter
==============

A tool for submitting jobs for background running and get notifications when it finishes.

Currently only email notification is support, tool supports linux and macOS, dependency: python3, python3-pip.

 

Installation
------------

If you don’t have python3, please install python3 and python3-dev first

After that,

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
git clone https://github.com/1a1a11a/taskSubmitter.git
cd taskSubmitter 
sudo ./install.sh
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you want to install to a local directory, instead of `sudo ./install.sh`, run
`./install_user.sh`

\* I have setup a default email account with the tool, but it is better to apply for an email which is dedicated to sending
notifications. 

 

Usage
-----

`jason@myMachine:~$ submit job`

#### Example1

`jason@myMachine:~$ submit sleep 20`

after executing this, you are free to logout of system without worrying about
disruption of the task. You will get an email when it begins to execute, and
another email notification when it finishes. All the output to stdout and stderr
will be redirected to a file under current directory.

#### Example2

`jason@myMachine:~$ submit ./thisIsLongTimeJob param1 param2`

 
