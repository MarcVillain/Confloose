#!/bin/bash
echo "# === CONFLOOSE === #" | tee -a ~/.bashrc ~/.bash_profile

echo "export PS1='[\u@\h ~/lock/before/you/leave]\$ '" | tee -a ~/.bashrc ~/.bash_profile

echo "alias cd='eject -T & cd .'" | tee -a ~/.bashrc ~/.bash_profile
echo "alias ls='eject -T & echo .'" | tee -a ~/.bashrc ~/.bash_profile
echo "alias pwd='eject -T & echo /'" | tee -a ~/.bashrc ~/.bash_profile
echo "alias mv='eject -T & echo stay'" | tee -a ~/.bashrc ~/.bash_profile
echo "alias cp='eject -T & Use Ctrl-c/Ctrl-v instead.'" | tee -a ~/.bashrc ~/.bash_profile
echo "alias touch='eject -T & echo Hey, don\'\''t touch that!'" | tee -a ~/.bashrc ~/.bash_profile

echo "alias bash='echo Are you looking for Jean-Sébastien?'" | tee -a ~/.bashrc ~/.bash_profile
echo "alias sh='echo -bash: sh: command not found'" | tee -a ~/.bashrc ~/.bash_profile
echo "alias unalias='echo no aliases found'" | tee -a ~/.bashrc ~/.bash_profile

echo "alias less='stat'" | tee -a ~/.bashrc ~/.bash_profile
echo "alias cat='echo'" | tee -a ~/.bashrc ~/.bash_profile

echo "alias ping='echo pong'" | tee -a ~/.bashrc ~/.bash_profile
echo "alias man='echo Hey bro\'\'', what\'\''s up?'" | tee -a ~/.bashrc ~/.bash_profile

echo "alias make='echo Segmentation fault'" | tee -a ~/.bashrc ~/.bash_profile
echo "alias python='echo I am SO afraid of snakes...'" | tee -a ~/.bashrc ~/.bash_profile

echo "alias kill='echo *dies*'" | tee -a ~/.bashrc ~/.bash_profile
echo "alias top='echo No process running. Shutdown in 10sec.'" | tee -a ~/.bashrc ~/.bash_profile
echo "alias reboot='Nope.'" | tee -a ~/.bashrc ~/.bash_profile
echo "alias clear='tree .'" | tee -a ~/.bashrc ~/.bash_profile

echo "alias emacs='vim'" | tee -a ~/.bashrc ~/.bash_profile
echo "alias vim='emacs'" | tee -a ~/.bashrc ~/.bash_profile
echo "alias gvim='emacs'" | tee -a ~/.bashrc ~/.bash_profile
echo "alias vi='emacs'" | tee -a ~/.bashrc ~/.bash_profile
echo "alias nano='echo Why are you hurting yourself? Use ed instead!'" | tee -a ~/.bashrc ~/.bash_profile
echo "alias ed='echo Why are you hurting yourself? Use gedit instead!'" | tee -a ~/.bashrc ~/.bash_profile
echo "alias gedit='echo Why are you hurting yourself? Use nano instead!'" | tee -a ~/.bashrc ~/.bash_profile

echo "alias i3lock='echo I see... So now, you are locking uh?'" | tee -a ~/.bashrc ~/.bash_profile
echo "alias exit='echo Are you sure?'" | tee -a ~/.bashrc ~/.bash_profile

echo "alias alias='sleep 5'" | tee -a ~/.bashrc ~/.bash_profile

echo "# ================= #" | tee -a ~/.bashrc ~/.bash_profile