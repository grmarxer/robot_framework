## Robot Build Notes  

Use Centos8 Stream DVD  
Be sure to make the robot user and admin in the install GUI  

<br/>  

#####  Disable Firewall      
sudo systemctl stop firewalld  
sudo systemctl disable firewalld  
  
systemctl status firewalld  

<br/>  

##### Enable NTP  
sudo systemctl enable chronyd  
sudo systemctl start chronyd  

chronyc sources  

<br/>  

#####  Disable SElinux 
sudo vi /etc/selinux/config  

SELINUX=disabled  

sestatus  

<br/>  
 
#####  Enable RDP 
sudo yum install epel-release -y  
sudo yum install xrdp -y   

sudo systemctl enable xrdp  
sudo systemctl start xrdp  

systemctl status xrdp   

be sure to set encryption to RDP for Windows RDP to work  
vi /etc/xrdp/xrdp.ini  
```
; security layer can be 'tls', 'rdp' or 'negotiate'
; for client compatible layer
#security_layer=negotiate
security_layer=rdp
```


netstat -a -n -p  | grep 3389  

<br/>  

#####  Install GIT and download F5 Library  
mkdir /home/robot/git  
sudo yum install git -y  
cd /home/robot/git  
git clone https://github.com/grf5/robotframework-f5networks  

<br/>  

#####  Update Centos8 Stream  
sudo yum upgrade -y  
sudo yum update -y  


<br/>  

#####  Install latest version Python3  
First remove old versions of python3   
sudo dnf remove python3 -y  

#install latest Python3  
https://linuxstans.com/how-to-install-python-centos/  

wget https://www.python.org/ftp/python/3.11.4/Python-3.11.4.tgz  
tar -xzf Python-3.11.4.tgz  
  
export PATH="$/usr/local/bin:$PATH"  

<br/>  

#####  Update PIP3 to latest version 
pip3 install --upgrade pip  

<br/>  

#####  Install robot framework  
pip3 install robotframework  

robot --version  

robotframework in /home/robot/.local/lib/python3.11/site-packages  

<br/>  

#####  Install Robot Libraries  
pip3 install robotframework-SSHLibrary  
pip3 install robotframework-SnmpLibrary  
pip3 install robotframework-requests  
pip3 install --upgrade robotframework-seleniumlibrary  
pip3 install robotframework-browser  
pip3 install robotframework-debuglibrary  
pip3 install -U robotframework-difflibrary

<br/>  

##### Make the following directories
mkdir /home/robot/robot_stuff  
mkdir /home/robot/robot_stuff/test_suites

<br/>  

## Using Robot

#####  to run a test 
robot robot-stuff/test-suites/tmos_connectivity_tests.robot  
<br/>  

#####  Load an env variable file 
If you want to load a file with all variables, write it in bash file then run it as a script -- ex is Greg R requirements.txt under samples  
<br/>  

#####  which command will tell you where something is 
[robot@centos8 test-suites]$ which robot  
~/.local/bin/robot  


##### Run a test changing name of logs files and using time stamps  

```
robot --log mylog.html --report myreport.html --output myoutput.xml --timestampoutputs  vz_example_gm.robot
```
