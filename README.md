# RetroPie Tool Suite

Some useful scripts here for the [RetroPie operating system](https://retropie.org.uk/) on the Raspberry Pi

By John Carlo Manuel & Emmanuel Flores

## Requirements

1. Raspberry Pi with RetroPie OS installed 
2. One or more game controller of your choice
3. A passion for retro games and hardware :)

## Preparations

Before following the instructions below, **please make sure your Raspberry Pi is powered on!**

### Bash Only
In `insert_roms.bash`, adjust the USERNAME, PASSWORD, and ADDR (IP address of your Raspberry Pi) accordingly.

```
...
USERNAME=your-pi-username
PASSWORD=your-pi-password
ADDR=your-pi-ip-address
...
```
---

Set up public / private RSA key pair:

```
ssh-keygen -t rsa  
ssh-copy-id -i ~/.ssh/[NAME OF YOUR KEY].pub your-pi-username@your-pi-ip-address
```

This would remove the password prompt when remotely accessing your Raspberry Pi.

From here, follow either Bash or Windows PowerShell down below.

## For Bash

Install [**rsync**](https://en.wikipedia.org/wiki/Rsync):

`$ sudo apt install rsync`

Next, run **create_sys_folders.bash**.

`$ bash create_sys_folders.bash`

Insert your ROMs into your respective system folder inside `roms`. Then, run `insert_roms.bash`

`$ bash insert_roms.bash`

After running, it should successfully transfer your ROMs to your respective system folder in the RetroPie file system.

### Developing & Testing the Bash Scripts

If you found these scripts useful and want to contribute more to them, there is an argument flag, `-t`, that you can add before running them. 

This would create the folders, `test_start` and `test_end`, which represent the source and destination folders respectively. Here, you can replicate the same functionality in a local environment without a Raspberry Pi.

## For Windows PowerShell (WIP)

