#Instalation directory
dir=$(pwd)

cd

#Create symbolic links for the config files

function install_link {
    rm -rf $1

    ln -s $2 $1
}

install_link ~/.Xdefaults $dir/.Xdefaults
install_link ~/.gitconfig $dir/.gitconfig
install_link ~/.taskrc $dir/.taskrc
install_link ~/.zshrc $dir/.zshrc
install_link ~/.fonts $dir/.fonts
install_link ~/.config/terminator $dir/.config/terminator
install_link ~/.config/ranger $dir/.config/terminator/config

install_link ~/vimified/after.vimrc $dir/vim/after.vimrc
install_link ~/vimified/before.vimrc $dir/vim/before.vimrc
install_link ~/vimified/local.vimrc $dir/vim/local.vimrc

#Make sure all the bundle are installed

vim +BundleInstall +qall
