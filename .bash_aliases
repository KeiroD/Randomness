# Aliases for terminal.
alias path='echo -e ${PATH//:/\\n}'
alias home='cd ~'
alias desktop='cd ~/Desktop'
alias docs='cd ~/Documents'
alias music='cd ~/Music'
alias pictures='cd ~/Pictures'
alias videos='cd ~/Videos'
alias downloads='cd ~/Downloads'
alias sauce='source ~/.bashrc'
alias sd='sudo shutdown -H -P now'
alias updates='sudo apt update && sudo apt list --upgradable && sudo apt upgrade -y && sudo apt autoremove'
alias restart='sudo shutdown -r now'
alias ddoscheck='sudo netstat -antp | awk '{print$5}' | cut -d':' -f1 | uniq -c | sort -r'
alias emberberry='ssh emberberry.heimkoma.com'

# Alias for SSH
alias lysharia='ssh lysharia.com -l lysharia'
