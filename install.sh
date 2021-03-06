#!/bin/sh

prompt_user_for_install(){
  while true; do
      #action is $1
      #name is $2
      read -p "Do you want to $1 $2 [y/n]?" yn
      case $yn in
          [Yy]* ) return 0;;
          [Nn]* ) return 1;;
          * ) echo "Please answer yes or no.";;
      esac
  done
}

backup_file(){
  #file is $1
  echo "\033[0;32mBacking up to ~/.$1.pre-quickconfig\033[0m";
  cp ~/.$1 ~/.$1.pre-quickconfig;
  rm ~/.$1;
}

install_file(){
  echo "\033[0;34mInstalling ~/.$1\033[0m"
  cp ./$1 ~/.$1;
}

check_and_install_config_file(){
  #file is $1
  echo "\033[0;34mLooking for an existing .$1...\033[0m"
  if [ -f ~/.$1 ] || [ -h ~/.$1 ]
  then
    echo "\033[0;33mFound ~/.$1.\033[0m"
    if prompt_user_for_install "backup and replace" "your ~/.$1"
    then
      backup_file $1
      install_file $1
    else
      echo "\033[0;34mSkipping install of ~/.$1\033[0m";
    fi
  else
    install_file $1
  fi
}

######################
#      HomeBrew      #
######################
echo "";
echo "\033[0;32m>>>\033[0m 1. Installing HomeBrew"
if /usr/bin/which -s brew
then
  echo "\033[0;33mYou already have HomeBrew installed.\033[0m"
else
  ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
fi


######################
#      oh-my-zsh     #
######################
echo "";
echo "\033[0;32m>>>\033[0m 2. Installing zsh"
if [ -d ~/.oh-my-zsh ]
then
 	echo "\033[0;33mYou already have Oh My Zsh installed.\033[0m"
else
	curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

check_and_install_config_file "zshrc"

if [ -f ~/.oh-my-zsh/themes/jmig.zsh-theme ] || [ -h ~/.oh-my-zsh/themes/jmig.zsh-theme ]
then
  echo "\033[0;33mDeleting previous jmig zsh theme\033[0m";
  rm ~/.oh-my-zsh/themes/jmig.zsh-theme;
fi
echo "\033[0;34mInstalling jmig.zsh-theme\033[0m"
cp ./jmig.zsh-theme ~/.oh-my-zsh/themes/jmig.zsh-theme


######################
#         Git        #
######################
echo "";
echo "\033[0;32m>>>\033[0m 3. Installing git & git config"

if /usr/bin/which -s git
then
  echo "\033[0;33mYou already have Git installed.\033[0m"
else
  brew install git
fi

check_and_install_config_file "gitconfig"
check_and_install_config_file "gitignore"

######################
#         RVM        #
######################

echo "";
echo "\033[0;32m>>>\033[0m 4. Installing rvm & Ruby"

if prompt_user_for_install "install rvm and latest ruby stable" ""
then
  curl -sSL https://get.rvm.io | bash -s stable --ruby --auto-dotfiles
else
  echo "\033[0;34mSkipping install of rvm/ruby\033[0m";
fi

######################
#         Vim        #
######################
echo "";
echo "\033[0;32m>>>\033[0m 5. Installing vim config"

check_and_install_config_file "vimrc"


######################
#    Term Notifier   #
######################
echo "";
echo "\033[0;32m>>>\033[0m 6. Installing terminal-notifier"
if /usr/bin/which -s terminal-notifier
then
  echo "\033[0;33mYou already have terminal-notifier installed.\033[0m"
else
  gem install terminal-notifier
fi

######################
#      AppleDoc      #
######################
echo "";
echo "\033[0;32m>>>\033[0m 7. Installing appledoc"
if /usr/bin/which -s appledoc
then
  echo "\033[0;33mYou already have appledoc installed.\033[0m"
else
  brew install appledoc
fi

######################
#    XCode Theme     #
######################
echo "";
echo "\033[0;32m>>>\033[0m 8. Installing XCode theme"
if [ -f ~/Library/Developer/Xcode/UserData/FontAndColorThemes/jmig.dvtcolortheme ] || [ -h ~/Library/Developer/Xcode/UserData/FontAndColorThemes/jmig.dvtcolortheme ]
then
  echo "\033[0;33mDeleting previous jmig Xcode theme\033[0m";
  rm ~/Library/Developer/Xcode/UserData/FontAndColorThemes/jmig.dvtcolortheme;
fi
echo "\033[0;34mInstalling jmig Xcode theme\033[0m"
if [ ! -d ~/Library/Developer/Xcode/UserData/FontAndColorThemes/ ]
then
  mkdir -p ~/Library/Developer/Xcode/UserData/FontAndColorThemes/
fi
cp ./jmig.dvtcolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes/jmig.dvtcolortheme
#This theme needs the font Inconsolata by Raph Levien
echo "\033[0;34mDownloading & Installing Inconsolata Font by Raph Levien\033[0m"
curl -SL "http://levien.com/type/myfonts/Inconsolata.otf" > Inconsolota.otf
mv Inconsolota.otf ~/Library/Fonts/Inconsolata.otf


######################
#       xctool       #
######################
echo "";
echo "\033[0;32m>>>\033[0m 9. Installing xctool"
if /usr/bin/which -s xctool
then
  echo "\033[0;33mYou already have xctool installed.\033[0m"
else
  brew install xctool
fi


######################
#       chisel       #
######################
echo "";
echo "\033[0;32m>>>\033[0m 10. Installing chisel"

if (brew list | grep -x chisel)
then
  echo "\033[0;33mYou already have Chisel installed.\033[0m"
else
  touch ~/.lldbinit
  brew install chisel
  CHISEL_CMD_LINE=`brew info chisel | tail -1 | sed -e 's/^ *//' -e 's/ *$//'`
  if grep -Fxq "$CHISEL_CMD_LINE" ~/.lldbinit
  then
    echo "\033[0;33m.lldbinit already with Chisel installed.\033[0m"
  else
    echo $CHISEL_CMD_LINE >> ~/.lldbinit
  fi
fi


echo "";
echo "";
echo "\033[0;32mInstallation OK!!!";
echo "Start a new session and enjoy\033[0m";
