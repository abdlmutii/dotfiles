# dotfiles
My terminal full setup.

# Installation 
First, Install the required apps:
- [Termux Monet](https://github.com/HardcodedCat/termux-monet/releases/tag/v0.118.0-33) **or** [Termux](https://f-droid.org/en/packages/com.termux/)
- [Termux:API](https://f-droid.org/en/packages/com.termux.api/)
- [Termux:Styling](https://f-droid.org/en/packages/com.termux.styling/)

Second, run this command:
```
pkg update && pkg upgrade && pkg install zsh git which fzf && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
You will be asked if you want to install packages, just press enter.

Third, Run this command to install the config:
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &&  pkg install neofetch neovim && git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && git clone https://github.com/abdlmutii/dotfiles.git && cd dotfiles && cp -r .termux/* ~/.termux && cp -r .config/* ~/.config && cp -r ~/.config/nvim/custom ~/.config/nvim/lua/ && rm -rf ~/.config/nvim/custom && mv backgrounds ~/backgrounds && mv .zshrc ~/.zshrc && mv .p10k.zsh ~/.p10k.zsh && cd .. && rm -rf dotfiles && cd .. && cd usr && cd etc && echo "" > motd && cd ~ && pkg install termux-api nodejs exa jq golang man && npm i localtunnel && exit
```
