#!/bin/sh

echo "";
echo "\033[0;32m>>>\033[0m 1. Installing zsh"

if [ -d ~/.oh-my-zsh ]
then
 	echo "\033[0;33mYou already have Oh My Zsh installed.\033[0m"
else
	curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

echo "\033[0;34mLooking for an existing zsh config...\033[0m"
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]
then
  echo "\033[0;33mFound ~/.zshrc.\033[0m \033[0;32mBacking up to ~/.zshrc.pre-quickconfig\033[0m";
  cp ~/.zshrc ~/.zshrc.pre-quickconfig;
  rm ~/.zshrc;
fi
echo "\033[0;34mInstalling ~/.zshrc\033[0m"
cp ./zshrc ~/.zshrc;

if [ -f ~/.oh-my-zsh/themes/jmig.zsh-theme ] || [ -h ~/.oh-my-zsh/themes/jmig.zsh-theme ]
then
  echo "\033[0;33mDeleting old zsh theme\033[0m";
  rm ~/.oh-my-zsh/themes/jmig.zsh-theme;
fi
echo "\033[0;34mInstalling jmig.zsh-theme\033[0m"
cp ./jmig.zsh-theme ~/.oh-my-zsh/themes/jmig.zsh-theme


echo "";
echo "\033[0;32m>>>\033[0m 2. Installing git config"

echo "\033[0;34mLooking for an existing git config...\033[0m"
if [ -f ~/.gitconfig ] || [ -h ~/.gitconfig ]
then
  echo "\033[0;33mFound ~/.gitconfig.\033[0m \033[0;32mBacking up to ~/.gitconfig.pre-quickconfig\033[0m";
  cp ~/.gitconfig ~/.gitconfig.pre-quickconfig;
  rm ~/.gitconfig;
fi
echo "\033[0;34mInstalling ~/.gitconfig\033[0m"
cp ./gitconfig ~/.gitconfig;

echo "\033[0;34mLooking for an existing gitignore...\033[0m"
if [ -f ~/.gitignore ] || [ -h ~/.gitignore ]
then
  echo "\033[0;33mFound ~/.gitignore.\033[0m \033[0;32mBacking up to ~/.gitignore.pre-quickconfig\033[0m";
  cp ~/.gitignore ~/.gitignore.pre-quickconfig;
  rm ~/.gitignore;
fi
echo "\033[0;34mInstalling ~/.gitignore\033[0m"
cp ./gitignore ~/.gitignore;



echo "";
echo "\033[0;32m>>>\033[0m 3. Installing vim config"

echo "\033[0;34mLooking for an existing vim config...\033[0m"
if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]
then
  echo "\033[0;33mFound ~/.vimrc.\033[0m \033[0;32mBacking up to ~/.vimrc.pre-quickconfig\033[0m";
  cp ~/.vimrc ~/.vimrc.pre-quickconfig;
  rm ~/.vimrc;
fi
echo "\033[0;34mInstalling ~/.vimrc\033[0m"
cp ./vimrc ~/.vimrc;

echo "";
echo "";
echo "\033[0;32mInstallation OK!!!";
echo "Start a new session and enjoy\033[0m";
