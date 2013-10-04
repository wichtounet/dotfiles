install: install-vim

install-terminator:
	mkdir -p ~/.config/terminator/
	-ln -si ${PWD}/.config/terminator/config ~/.config/terminator/config

install-git: install-terminator
	-ln -si $(PWD)/.gitconfig ~/.gitconfig
	-ln -si $(PWD)/.gitignore ~/.gitignore

install-task: install-git
	-ln -si ${PWD}/.taskrc ~/.taskrc

install-fonts: install-task
	-ln -si ${PWD}/.fonts ~/.fonts

install-zsh: install-fonts
	-rm -rf ~/.oh-my-zsh
	cd
	wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
	-ln -si ${PWD}/.zshrc ~/.zshrc

install-vim: install-zsh
	-rm -rf ~/.vim ~/vimified ~/.vimrc
	cd
	curl -L https://raw.github.com/zaiste/vimified/master/install.sh | sh
	-ln -si ${PWD}/vim/after.vimrc ~/vimified/after.vimrc
	-ln -si ${PWD}/vim/before.vimrc ~/vimified/before.vimrc
	-ln -si ${PWD}/vim/local.vimrc ~/vimified/local.vimrc
	vim +BundleInstall +qall

.PHONY: install install-terminator install-git install-task install-fonts install-zsh install-vim
