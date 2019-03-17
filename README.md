# mkvm

Files for quick creation of CentOS vm's with KVM and Kickstart for Lab purposes

Requirements:

- Folder with contents of CentOS7 ISO DVD
- FTP Server with CentOS repo
- Web server that serves ks.cfg
- Optionally, Chef server to automatically add the vm's to Chef. 
  You need to replace the validation key in the ks.cfg if you want to use this.
