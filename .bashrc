# ALIASES
####################

alias ps='ps auxf'
alias pg='ps aux | grep'

# LIST DIRECTORIES
alias lsd='ls -l | grep --color=never "^d" | awk '\''{
   split($0,a," ");
   for(i=8; i<=length(a); ++i)
   {
      printf "%s",a[i];
      if(i<length(a)) printf " ";
   }
   printf "\n"
   }'\'' | column'

# LIST ALL DIRECTORIES
alias lsda='ls -lA | grep --color=never "^d" | awk '\''{
   split($0,a," ");
   for(i=8; i<=length(a); ++i)
   {
      printf "%s",a[i];
      if(i<length(a)) printf " ";
   }
   printf "\n"
   }'\'' | column'

# LIST FILES
alias lsf='ls -l | grep --color=never -v "^d" | awk '\''{
   split($0,a," ");
   for(i=8; i<=length(a); ++i)
   {
      printf "%s",a[i];
      if(i<length(a)) printf " ";
   }
   printf "\n"
   }'\'' | column'

# LIST ALL FILES
alias lsfa='ls -lA | grep --color=never -v "^d" | awk '\''{
   split($0,a," ");
   for(i=8; i<=length(a); ++i)
   {
      printf "%s",a[i];
      if(i<length(a)) printf " ";
   }
   printf "\n"
   }'\'' | column'

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
alias restart='sudo shutdown -r now'
alias eidolos='~/bin/eidolos/eidolos.sh'
alias ddoscheck='sudo netstat -antp | awk '{print$5}' | cut -d':' -f1 | uniq -c | sort -r'
# Alias for SSH

#alias starlight='ssh starlight.eidolonhost.com -l root'
#alias helmsgate='ssh helmsgate.eidolonhost.com -l root'
alias irc='ssh wolf.furryavalon.net -l wolf'
alias eidolon='ssh eidolonhost.com -l eidolon'
alias lysharia='ssh lysharia.com -l lysharia'
alias eh='ssh eidolonhost.com -l root'

# COLOR DEFINES
####################

red='\e[0;31m'
RED='\e[1;31m'
green='\e[0;32m'
GREEN='\e[1;32m'
yellow='\e[0;33m'
YELLOW='\e[1;33m'
blue='\e[0;34m'
BLUE='\e[1;34m'
purple='\e[0;35m'
PURPLE='\e[1;35m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
white='\e[0;37m'
WHITE='\e[1;37m'
black='\e[0;30m'
BLACK='\e[1;30m'
NC='\e[0m'              # No Color

# PR = Primary Color. SC = Secondary Color.  Mmmm, Minty
PR=$YELLOW
SC=$GREEN


# WELCOME SCREEN
####################

echo -e ${SC}Hello, ${PR}$USER${SC}. Welcome to ${PR}`hostname`
echo -e ${SC}You are on ${PR}`cat /etc/issue.net`${SC}, with ${PR}`uname -a | awk /'201*/{print $12}'` ${SC}as your platform.
echo -e ${PR}`hostname`\'s IPv4${SC} IP address is: ${PR}`curl -s http://whatismyip.akamai.com/`
echo -e ${PR}`hostname`\'s IPv6${SC} IP address is: ${PR}`curl -s http://icanhazip.com/`
echo -e ${PR}`hostname`\'s${SC} uptime is: ${PR}`uptime | awk -F'( |,|:)+' '{print $6,$7",",$8,"hours,",$9,"minutes."}'` ${PR}`who|wc -l`${SC} users are currently logged into the server.
echo -e ${PR}$USER${SC}, your current load average is: ${PR}`uptime | awk /'average/{print $8}'`${SC} and ${PR}`uptime | awk /'average/{print $9}'` ${SC}over a 5 minutes period, with ${PR}`uptime | awk /'average/{print $10}'` ${SC}over a 15 minute period.
echo -e ${PR}$USER${SC}, you have ${PR}`top -n 1 | awk /'Tasks/{print $2}'` ${SC}tasks running.
echo
