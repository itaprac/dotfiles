# dotfiles

Dotfiles for my M1 Macbook Air Sonoma

![zsh with starship prompt and colorls](https://user-images.githubusercontent.com/15176096/71632895-ff0d0980-2bde-11ea-966f-65e5d564361f.png)
![vim and tmux](https://user-images.githubusercontent.com/15176096/71633424-2f09dc00-2be2-11ea-9c15-a4f492b7ea68.png)

-   Terminal: [Alacritty](https://github.com/jwilm/alacritty) using zsh w/ [starship prompt](https://starship.rs/) and [color-ls](https://github.com/athityakumar/colorls)
-   Window management: [yabai](https://github.com/koekeishiya/yabai)
-   Hotkeys: [skhd](https://github.com/koekeishiya/skhd)
-   Vim: [neovim](https://neovim.io/) with [vim-plug](https://github.com/junegunn/vim-plug) to manage plugins
-   Tools: [tmux](https://github.com/tmux/tmux), [z](https://github.com/rupa/z), [fzf](https://github.com/junegunn/fzf)

## Installation

**Before you get started** make sure you give full disk access permission to your terminal (for writing macos defaults). `System Preferences -> Privacy -> Full Disk Access`.

To install:

`curl -L https://raw.githubusercontent.com/itaprac/dotfiles/main/run.sh | sh`

## File overview

-   Configs for the following tools:
    -   git
    -   [Alacritty](./alacritty)
    -   [colorls](./colorls)
    -   [fzf](./fzf)
    -   [AstroNvim](https://github.com/AstroNvim/AstroNvim)
    -   [skhd](./skhd)
    -   [starship](./starship)
    -   [yabai](./yabai)
-   Shell environment configs:
    -   [Antigen](https://github.com/zsh-users/antigen) for zsh plugin management
    -   [`.zshrc`](./zsh/.zshrc)
    -   [`.zlogin.sh`](./zsh/.zlogin.sh)
    -   [`.zshenv.sh`](./zsh/.zshenv.sh)
    -   [`.aliases`](./zsh/.aliases)
    -   [`.exports`](./zsh/.exports)
-   [`Brewfile`](./Brewfile) - contains all homebrew packages, casks, and mac appstore apps

The install script will also setup Python and Node versions/environments:

-   [pyenv](https://github.com/pyenv/pyenv) sets the global Python version to 3.12
-   [n](https://github.com/tj/n) sets the global Node version to LTS

### Customization

#### Git

-   Be sure to update the user name/email values in the global [gitconfig](./git/.gitconfig)

#### Color Schemes

-   Alacritty color scheme is [Snazzy](https://github.com/sindresorhus/terminal-snazzy)
-   VSCode/Vim color scheme is [Ayu](https://github.com/dempfi/ayu)
-   The macOS ['highlight color'](https://github.com/itaprac/dotfiles/blob/960bf587fe029e80d4f093201ae89e966370a57a/macos/.macos#L22-L23) (accent color for mac, typically blue) is set to blue. To set it to a different color:
    -   Pick your desired color and get its RGB value (ex. pink is `255,105,180`)
    -   Take each value and divide it by 255 (ex. pink is now `1, 0.41176470588, 0.70588235294`)
    -   Put them into RGB order (ex. pink is `"1 0.41176470588 0.70588235294"`)
