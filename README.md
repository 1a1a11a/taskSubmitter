task_submitter
==============

A tool for submitting jobs to background and get notifications when it finishes.

Currently support linux and macOS, dependency: python3, python3-pip.

 

Installation
------------

If you don’t have pip3, on Ubuntu, you can install using `sudo apt-get install
python3-pip `

After that,

```
git clone https://github.com/1a1a11a/task_submitter.git
cd task_submitter 
sudo ./install.sh
```

If you want to install to a local directory, instead of `sudo ./install.sh`, run
`./install_user.sh`

\* It is better to apply for an email which is dedicated to sending
notifications.

 

Usage 
------

`jason@myMachine:~$ submit job`

#### Example1 

`jason@myMachine:~$ submit sleep 20`

after executing this, you are free to logout of system without worrying about
disruption of the task. You will get an email when it begins to execute, and
another email notification when it finishes. All the output to stdout and stderr
will be redirected to a file under current directory.

#### Example2 

`jason@myMachine:~$ submit ./thisIsLongTimeJob param1 param2 `

 
