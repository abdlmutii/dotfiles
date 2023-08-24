# dotfiles
My terminal full setup.

# Installation 
First, Install the required apps:
- [Termux Monet](https://github.com/HardcodedCat/termux-monet/releases/tag/v0.118.0-33) **or** [Termux](https://f-droid.org/en/packages/com.termux/)
- [Termux:API for termux](https://f-droid.org/en/packages/com.termux.api/) **or** [Termux:API for monet](https://github.com/HardcodedCat/termux-api/releases)
- [Termux:Styling for termux](https://f-droid.org/en/packages/com.termux.styling/) or [Termux:Styling for monet](https://github.com/HardcodedCat/termux-styling/releases)
> Termux-Styling isn't required, unless you want to edit the interface, i would prefer using the `color.properties` file.
 
Second, run this command:
```
pkg update && pkg upgrade && pkg install zsh git which fzf && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
> You will be asked if you want to install packages, just press enter.

Third, Run this command to install the config:
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &&  pkg install neofetch neovim && git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && git clone https://github.com/abdlmutii/dotfiles.git && cd dotfiles && cp -r .termux/* ~/.termux && cp -r .config/* ~/.config && cp -r ~/.config/nvim/custom ~/.config/nvim/lua/ && rm -rf ~/.config/nvim/custom && mv backgrounds ~/backgrounds && mv .zshrc ~/.zshrc && mv .p10k.zsh ~/.p10k.zsh && cd .. && rm -rf dotfiles && cd .. && cd usr && cd etc && echo "" > motd && cd ~ && pkg install termux-api nodejs exa jq golang man && npm i localtunnel && exit
```

## NeoVim Setup
First, Enter neovim:
```
nvim
```

Second, Install these TreeSitter addons:
```
:TSInstall go dot bash html css embedded-template gomod g osum lua markdown pug javascript typescript tsx
```

Third, Install these lsps:
```
:MasonInstall emmet_ls prettierd golines goimports gopls beautysh fixjson stylua write_good shellcheck eslint
```

# Discord presence
Termux doesn't allow to have discord rich presences.

# Congratulations 
You've installed the config.
