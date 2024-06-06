# dotfiles
My terminal full setup as a developer on mobile

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
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions && pkg install neofetch neovim yazi glow && git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && git clone https://github.com/abdlmutii/dotfiles.git && cd dotfiles && cp -r .termux/* ~/.termux && cp -r .config/* ~/.config && cp -r ~/.config/nvim/custom ~/.config/nvim/lua/ && rm -rf ~/.config/nvim/custom && mv ~/.config/nvim/template ~/.config/nvim/lua/template && mv backgrounds ~/backgrounds && mv .zshrc ~/.zshrc && mv .p10k.zsh ~/.p10k.zsh && cd .. && rm -rf dotfiles && cd .. && cd usr && cd etc && echo "" > motd && cd ~ && pkg install termux-api nodejs eza jq golang && exit
```

## NeoVim Setup
First, Enter neovim:
```
nvim
```

Second, Install these TreeSitter addons:
```
:TSInstall go dot bash html css embedded-template gomod gosum lua markdown pug javascript typescript tsx
```

Third, Install these lsps:
```
:MasonInstall emmet_ls prettierd golines goimports gopls beautysh fixjson stylua write_good shellcheck eslint
```

# Yazi
**[Yazi](https://yazi-rs.github.io)** is a file manager, an awesome one. i added stuff on it
### Plugins
- [miller.yazi](https://github.com/Reledia/miller.yazi), adds a .csv preview make sure to run this command to use this: `pkg i miller`
- [glow.yazi](https://github.com/Reledia/glow.yazi), adds .md preview using glow, make sure to run `pkg i glow`
- [yamb.yazi](https://github.com/h-hg/yamb.yazi), a persistent bookmarks plugin. Press `b` inside yazi to see how to use it
- [escape.yazi](https://github.com/Rolv-Apneseth/bypass.yazi), (ok i know it's bypass.yazi not escape.yazi) just press `L` into a single dir directory and it'll bypass it so fast, to go back press `H`
- [ffmpegthumbnailer](https://github.com/dirkvdb/ffmpegthumbnailer), a way to see videos thumbnails in your fm. i didn't want to download it because imgcat automatically does the job but you can just run `pkg i ffmpegthumbnailer`
- **poppler**, pdf previewer implemented inside, run `pkg i poppler` to use it

### Flavor
I've edited catppuccin theme a bit so file colors are actually matching their icon color, the default one is horrible to be honest you should use mine if you love catppuccin mocha

# Se1f
- **What's se1f**: se1f is a tool to share code with buddies from your terminal directly, also share images, videos ( soon )
- **How to use se1f**: YOU NEED TO HOST [SE1F](https://github.com/abdlmutii/se1f) LOCALLY FIRST, run the command `se1f [file] | jq -r ".url" | xargs xdg-open`
- **How to host se1f**: run a [serveo](serveo.net) server with the go file running on localhost, don't forget to edit `.zshrc` to contain your serveo api instead of the fallback one ( it won't work lol )

# Obsidian
soon ( i wanna sleep )

# Discord presence
Termux doesn't support discord rich presences. and it'll take much resources so i dropped it completely ( although i can do it )

# Congratulations 
You've installed the config.
