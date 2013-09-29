#Instalation directory
dir=$(pwd)

cd

#Install oh-my-zsh
rm -rf ~/.oh-my-zsh
rm -rf ~/.zshrc
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

#Install vimified
rm -rf ~/.vim
rm -rf ~/vimified
rm -rf ~/.vimrc
curl -L https://raw.github.com/zaiste/vimified/master/install.sh | sh

#Create symbolic links for the config files

function install_link {
    rm -rf $1

    ln -s $2 $1
}

install_link ~/.gitconfig $dir/gitconfig
install_link ~/.taskrc $dir/taskrc
install_link ~/.zshrc $dir/zshrc
install_link ~/.fonts $dir/fonts
install_link ~/.config/terminator/config $dir/.config/terminator/config

install_link ~/vimified/after.vimrc $dir/vim/after.vimrc
install_link ~/vimified/before.vimrc $dir/vim/before.vimrc
install_link ~/vimified/local.vimrc $dir/vim/local.vimrc

#Make sure all the bundle are installed

vim +BundleInstall +qall
