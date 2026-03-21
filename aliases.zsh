# This is just a copy of the .bash_aliases but converted to work in ZSH. Simple stuff, really, but some of this has given me headaches.

# Aliases for terminal.
alias path="echo -e ${PATH//:/\\n}"
alias home="cd ~"
alias desktop="cd ~/Desktop"
alias docs="cd ~/Documents"
alias music="cd ~/Music"
alias pictures="cd ~/Pictures"
alias videos="cd ~/Videos"
alias downloads="cd ~/Downloads"
alias sauce="source ~/.zshrc"
alias sd="sudo shutdown -H -P now"
alias updates="sudo apt update && sudo apt list --upgradable && sudo apt upgrade -y && sudo apt autoremove"
alias restart="sudo shutdown -r now"
alias ddoscheck="sudo netstat -antp | awk '{print$5}' | cut -d':' -f1 | uniq -c | sort -r"
alias rr='if [ -f /var/run/reboot-required ]; then echo "Reboot required; please reboot at your earliest convenience."; else echo "No reboot needed at this time."; fi'

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
#haste() { a=$(cat); curl -X POST -s -d "$a" https://paste.ituralde.com/documents | awk -F '"' '{print "https://paste.ituralde.com/"$4}'; }
alias dog='echo "Did you mean dig?"; dig'
