# New Config
To start configuring the environment the first thing you will need to have installed is [git](https://git-scm.com/). We can continue with the next steps.

## Adding the SSH Key (This step is just for me hahah 😂)
Open your terminal and run `ssh-keygen` and you will have two files in `~/.ssh/`, run 
```bash
cat ~/.ssh/FILENAMEHERE.pub
```
and copy the output.
Go to github and open the settings page, select the `SSH and GPG keys` option and add the key. Now you are set to next step.

## Clone this repo in your local machine
```bash
git clone git@github.com:Enkdress/my-dot-files.git ~/.dotFiles
```
## Install zsh and omzsh
In my case I use zsh you can use fish or whatever shell you like. To install zsh:

Ubuntu
```bash
sudo apt install zsh
```
Macos
```bash
brew install zsh
```
if you need to install it in another SO refere to [this](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#how-to-install-zsh-on-many-platforms) page.

Now install Oh my zsh, is a framework where we can add plugins and make pretty our shell, run:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Adding custom zsh config
Once you installed Oh My Zsh you will find a file with the name of `.zsh` in the home directory... remove it! 😂,
we will create a symlink to ours just run next command and restart your terminal:
```bash
ln -s ~/.dotFiles/.zshrc ~/.zshrc
```

## Adding zsh plugins
I normally just use two plugins of omzsh autosuggestions and synstax highlighting.

Install the [autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md) plugins:
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```

Install the [syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md) plugins:
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

## Installing tools
I use some CLI tools like `exa`, `bat`, `fzf`, `rd`, `fg`


---


## Neovim
The first thing to do here is install the latest stable version of neovim, you can do that by copying the following command: 
```bash
curl -LO https://github.com/neovim/neovim/releases/download/{VERSION}/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
```
>[!NOTE]
>If you in this section have an error like:
>```
>AppImages require FUSE to run.
>You might still be able to extract the contents of this AppImage
>if you run it with the --appimage-extract option.
>See https://github.com/AppImage/AppImageKit/wiki/FUSE
>for more information
>```
>You have run the following to fix it (Only tested in Ubuntu)
>```bash
>./nvim.appimage --appimage-extract
>```
>This will generate a folder with the image, you can `./squashfs-root/usr/bin/nvim` to open neovim

If you went through the last step without any error you can do the following to have the bin globally in your terminal:
```bash
sudo mv nvim.appimage /usr/local/bin/nvim
```

In case you went through the error you can do the following:
```bash
sudo mv path/to/squashfs-root /tmp/squashfs
sudo ln -s /tmp/squashfs/usr/bin/nvim /usr/bin/nvim
nvim
```

## Adding my neovim configuration
We will use the `~/.config` folder, so in case you don't have it create it with `mkdir ~/.config`.
Now we can start creating the link:
```bash
ln -s ~/.dotFiles/config/nvim/luaConf ~/.config/nvim
```
By now you should be seeing all the plugins being installed with some errors (maybe)... So depending on what 
the error is saying trying to fix it. [Link](https://github.com/Enkdress/my-dot-files/edit/master/KNOWN_ERRORS.md) to a document with possible errors you can see.


---


## TMUX
First you have to install the package so use your SO package manager to install tmux.

Ubuntu
```bash
sudo apt install tmux
```
Macos
```bash
brew install tmux
```

This configuration is easy you just copy and paste the following commands:

```bash
ls -s ~/.dotFiles/tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Open `tmux` and intall the plugins using `<C-w>+I` sequence and you are ready to go.





---

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
# Packages
* exa
* picom jonaburg
* nitrogen
* systray
