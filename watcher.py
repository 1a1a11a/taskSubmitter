#!/usr/bin/env python3 

"""
this is a python module monitoring single process and notify user 
when the process disappear (either finished or crashed) 

it loads config information from $HOME/.task_sumitter 
"""


import os 
import sys 
import time 
import socket 
import configparser 

try:
	import psutil
except:
	print("unable to start monitoring service, please install psutil using pip3", file=sys.stderr)
	sys.exit(1)


sys.path.append(os.getcwd())
sys.path.append("./")

from utilEmail import configEmailClient 




def watch(pid, name="no name", check_interval=1): 
	""" check the given process has finished or not 
		if it finishes, then send out email notification 
    :param pid: the pid of monitoring process 
    :param name: the name of process, this is optional, only used for notification 
    :param check_interval: how long the monitoring process should wait before next check 
    :return: None 

	"""
	msg = 'task  &ldquo; {} ({}) &rdquo; on _{}_ just began executing! &#9996;'.format(name, pid, socket.gethostname())
	configEmailClient().send_email(message=msg, topic="Task Submitted") 

	while psutil.pid_exists(pid):
		time.sleep(check_interval)

	msg = 'task &ldquo; {} ({}) &rdquo; on _{}_ finished executing &#9995;'.format(name, pid, socket.gethostname())
	configEmailClient().send_email(message=msg, topic="Task Finished") 



if __name__ == "__main__":
	if len(sys.argv) < 2:
		print("usage: python3 {} pid name(optional)".format(sys.argv[0]))
	else:
		name=" ".join(sys.argv[2:]) if len(sys.argv)>2 else "no name" 
		watch(int(sys.argv[1]), name)