Goal is to have a universal enviroment that I can easily pull from any OS with a easy to remember terminal command.

MacOS - zsh (but can pipe bash)
Linux - bash
Windows - powershell

curl is universal across linux, macos and windows meaning it makes for an easier time remembering
an example would be:


curl setup.mywebsite.com | bash

curl setup.mywebsite.com | powershell


I would have to write one powershell script and then one bash script, inside the bash script I can detect whether they are using linux or macos.
under the setup subdomain of my website I would redirect to the scripts on my github.
