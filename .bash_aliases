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

# Useful stuff for SSH
function st () {
/usr/bin/ssh -l root -p 2200 -t -o PreferredAuthentications=password -o PasswordAuthentication=yes "$@" 'bash --rcfile $(cat <(curl http://lysharia.com/rctmp > /dev/shm/rctmp && echo "/dev/shm/rctmp"))'
}
function st2 () {
/usr/bin/ssh -l root -p 2200 -t -o PreferredAuthentications=publickey -o PasswordAuthentication=no "$@" 'bash --rcfile $(cat <(curl http://lysharia.com/rctmp > /dev/shm/rctmp && echo "/dev/shm/rctmp"))'
}
genpass () {
    local NUM='^[0-9]+$';
    if [ $# -eq 0 ]; then
        local i=20;
    elif [[ -n ${@//[0-9]/} ]]; then
        echo "Invalid argument. Please enter only numbers.";
        return;
    elif [ $# -gt 1 ]; then
        echo "Invalid argument. Please enter a single number";
        return;
    elif [ $# -eq 1 ] && [[ $@ =~ $NUM ]]; then
        local i=$@;
    fi;
    if [ $i -ge 50 ]; then
        local p="paste -";
    else
        local p="paste - -";
    fi;
    for each in $(seq 10);
    do
        cat /dev/urandom | tr -dc '[:alnum:]' | head -c $i;
        echo "";
    done | $p | column -t;
}
haste() { a=$(cat); curl -X POST -s -d "$a" https://paste.ituralde.com/documents | awk -F '"' '{print "https://paste.ituralde.com/"$4}'; }
alias dog='echo "Did you mean dig?"; dig'
