# My nvim configuration
<br/><br/>

## 1. Install neovim
If you want the realease version you should download nvim.appimage
```
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
```

and then give it a permission to execute and then move it to the bin folder
```
chmod +x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
```


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

## 3. Create .config symbolic link
You can create this symbolic link for:
..* nvim whit init.vim
..* alacritty config

```
$ ln -s ~/.dotFiles/.config/nvim $HOME/.config/
and
$ ln -s ~/.dotFiles/.config/alacritty $HOME/.config/
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

<br/>

# Alacritty config
Into ```~/.config``` folder create a symbolic link to ```~/.dotFiles/.config/alacritty```

<br/>

# Zsh config

### * Install zsh 
```
$ sudo apt install zsh
$ chsh -s $(which zsh)
```

### * Install powerlevel10k
```
$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
$ echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
```

### * Run powerlevel configuration
```
$ p10k configure
```

# NeoVim plugins
## Coc Plugin 
Coc-extensions:
* coc-explorer

* coc-css

* coc-git

* coc-highlight

* coc-json

* coc-snippets

* coc-tsserver

* coc-html

* coc-spell-checker


## Install NVM
```curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash```
then run ```command -v nvm``` and should appear ```nvm```... If did not work you have to install manually
read the documentation

After that into the zsh config maybe is .zshrc or .p10k.zsh go to the last lines and add the following 
```
source $HOME/.dotFiles/personalConf.zsh
```
