# My nvim configuration
<br/><br/>

## 1. Install neovim
For Debian based
```
$ sudo apt-get install neovim
```
For Archlinux based
```
$ sudo pacman -S neovim
```

<br/>

## 2. Make init.vim file
Create <b>~/.config/nvim</b> and then create init.vim file inside
```
$ touch init.vim
```

<br/>

## 3. Modify the init.vim
Add the following lines into the file
```
set runtimepath^=~/.vim runtimepath+=~/.vim/after                               
let &packpath = &runtimepath                                                
source ~/.vimrc   
```

<br/>

## 4. Clone this repo
```
$ git clone https://github.com/Enkdress/my-dot-files.git ~/.dotFiles
```

<br/>

## 5. Create symbolic link
You must to create a symbolic link in your home folder of .vimrc
```
$ ln -s ~/.dotFiles/.vimrc ~/.vimrc
```

<br/>

## 6. Install vim plug
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

<br/>

## 7. Install the plugins
Into nvim run ```:PlugInstall```
