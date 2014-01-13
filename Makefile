install: install-vim

SOURCE=${CURDIR}

install-config:
	rm -rf ~/.config/terminator
	rm -rf ~/.config/ranger
	-ln -si ${SOURCE}/.config/terminator ~/.config/terminator
	-ln -si ${SOURCE}/.config/ranger ~/.config/ranger

install-git: install-config
	-ln -si $(SOURCE)/.gitconfig ~/.gitconfig
	-ln -si $(SOURCE)/.gitignore ~/.gitignore

install-task: install-git
	-ln -si ${SOURCE}/.taskrc ~/.taskrc

install-fonts: install-task
	-ln -si ${SOURCE}/.fonts ~/.fonts

install-zsh: install-fonts
	-rm -rf ~/.oh-my-zsh
	cd
	wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
	-ln -si ${SOURCE}/.zshrc ~/.zshrc

install-vim: install-zsh
	-rm -rf ~/.vim ~/vimified ~/.vimrc
	cd
	curl -L https://raw.github.com/zaiste/vimified/master/install.sh | sh
	-ln -si ${SOURCE}/vim/after.vimrc ~/vimified/after.vimrc
	-ln -si ${SOURCE}/vim/before.vimrc ~/vimified/before.vimrc
	-ln -si ${SOURCE}/vim/local.vimrc ~/vimified/local.vimrc
	vim +BundleInstall +qall

.PHONY: install install-config install-git install-task install-fonts install-zsh install-vim
