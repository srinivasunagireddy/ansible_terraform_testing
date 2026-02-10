#Ansible Topics 0. Enable call backs in ansible.cfg [defaults] callbacks_enabled = timer, profile_tasks, profile_roles #The above provided playbook and task execution time which can allow us to identiy slow running playbooks. Enable Ansible Log in export ANSIBLE_LOG_PATH=~/ansible.log export ANSIBLE_DEBUG=True

Adhoc commands * ansible -i invfile pvt -m ping ansible -i invfile pvt -m shell -a "df -h" ansible -i invfile pvt -m shell -a "df -h | grep -i /dev/root" -vvvv ansible -i invfile server01:server02 -m shell -a "df -h | grep -i /dev/root" ansible -i invfile 'all:!server01' -m shell -a "df -h | grep -i /dev/root" ansible -i invfile 'all:&megastar' -m shell -a "df -h | grep -i /dev/root" ansible -i invfile2 'all:&megastar' -m shell -a "df -h | grep -i /dev/root" ansible -i invfile pvt -m user -a "name=superstar state=present" --become ansible -i invfile pvt -m shell -a "cat /etc/passwd | grep -i superstar" ansible -i invfile pvt -m setup #Prints ansible_facts for clients

with_items for running iterations. *

when condition *

Register output & return code using rc *

Ansible facts using Redis & Notify & Handlers & get_url & unarchive modules in redis playbook.

ansible -i /root/ansiblecode/invfile all -m setup If you are unable to connect to clients, then redis is also be a issue. Disable redis config and try again.
Copy, File, No_Log, Debug *
Verbosity using -vvvv
ignore_errors: true *
block, rescue & always
Vault Encrypt String and File for aws_creds *
shell & command modules *
become_user *
serial option select how many machine can run at a time. serial 1 will run
on one machine only. *
lineinfile *
Docker Swarm Configuration *
Set-fact *
--extra-vars ansible_user='ubuntu'
fetch
tags *
Jinja Templates *
Pre & Post Tasks *
Roles and Ansible Galaxy *
Dynamic Inventory
AWX
