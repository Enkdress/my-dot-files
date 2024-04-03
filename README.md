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
or
git clone https://github.com/Enkdress/my-dot-files.git ~/.dotFiles

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
sudo mv path/to/squashfs-root /dev/squash
sudo ln -s /dev/squash/usr/bin/nvim /usr/bin/nvim
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


## Installing Node js
There are multiple ways to install node js but the one I prefer is to use a version manager
for node, I recommend using one of these [volta](https://docs.volta.sh/guide/getting-started) or [nvm](https://github.com/nvm-sh/nvm)

### Volta
You can install volta with the following command.
```bash
curl https://get.volta.sh | bash
```
Once you have volta installed you can install the node version you want, in this case I'll be using
the `v20.11.0`

```bash
volta install node@20.11.0
```

### NVM
You can go to their github page linked above and follow the installation process, but here are
some quick commands:
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

To install node using nvm you just have to `nvm install node@20.11.0`


If you are using the `.zshrc` file in this repo you don't have to worry about the variables. But in case
you aren't using this `.zshrc` you will need to add the following variables to your `.zshrc`.

For Volta:
```bash
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export VOLTA_FEATURE_PNPM=1
```

For NVM:
```bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```

## Node global packages
```bash
npm i -g typescript neovim pnpm yarn tailwindcss-language-server tree-sitter
```

## Python packages

First thing you need to do is to install `pip` follow this section to do it:
```bash
curl https://bootstrap.pypa.io/get-pip.py >> ~/get-pip-py
python3 ~/get-pip-py
rm -rf ~/get-pip-py
```

Now you can restart your terminal and it should be in installed. If there is an
error saying that you don't have it then you need to add the `~/.local/bin` in your $PATH.

### Python global packages
```bash
pip3 install neovim
```


