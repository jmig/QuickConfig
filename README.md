##@jmig's QuickConfig

Painless configuration for a new workstation.

###How to use
Just run the ./install.sh script and follow the instructions. The script will look for and install the following:

1. Homebrew
2. Oh-My-Zsh
   * .zshrc
   * jmig.zsh-theme
3. Git
   * .gitconfig
   * .gitignore
4. .vimrc
5. terminal-notifier



*Note: If a file already exists on your system, the script will ask you if you want to replace it and will back it up before.*


###Hooks Git

* pre-commit : Remove trailing whitespaces

###SublimeText2 Plugins

* RsyncProducteev is a SublimeText Plugin that Rsync your project with the dev server when pressing CMD+U. Send you a Notification when done using terminal-notifier.
