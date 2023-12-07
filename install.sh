#!/bin/bash

install_brew() {
    if ! command -v "brew" &> /dev/null; then
        printf "Homebrew not found, installing."
        # install homebrew
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        # set path
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    sudo softwareupdate --install-rosetta

    printf "Installing homebrew packages..."
    brew bundle
}

create_dirs() {
    declare -a dirs=(
        "$HOME/Documents/screenshots"
        "$HOME/Documents/Development"
        "$HOME/Documents/School"
    )

    for i in "${dirs[@]}"; do
        mkdir "$i"
    done
}

build_xcode() {
    if ! xcode-select --print-path &> /dev/null; then
        xcode-select --install &> /dev/null

        until xcode-select --print-path &> /dev/null; do
            sleep 5
        done

        sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer

        sudo xcodebuild -license
    fi
}

install_app_store_apps() {
    # mas install 497799835 # Xcode
    # mas install 1451685025 # WireGuard
    # mas install 1545870783 # System Color Picker
    # mas install 1351639930 # Gifski (video to gif)
}

printf "🗄  Creating directories\n"
create_dirs

printf "🛠  Installing Xcode Command Line Tools\n"
build_xcode

printf "🍺  Installing Homebrew packages\n"
install_brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

printf "Installing yabai\n"
brew install koekeishiya/formulae/yabai --HEAD
codesign -fs 'yabai-cert' $(brew --prefix yabai)/bin/yabai

printf "🛍️  Installing Mac App Store apps\n"
install_app_store_apps

printf "💻  Set macOS preferences\n"
./macos/.macos


# Dno why this is here, but it creates errors and i cba fixing it since idont use ruby anywas
printf "🌈  Configure Ruby\n"
ruby-install ruby-2.7.4 1>/dev/null
source /opt/homebrew/opt/chruby/share/chruby.sh
source /opt/homebrew/opt/chruby/share/auto.sh
chruby ruby-2.7.4 1>/dev/null
# disable downloading documentation
echo "gem: --no-document" >> ~/.gemrc
gem update --system 1>/dev/null
gem install bundler 1>/dev/null
# configure bundler to take advantage of cores
num_cores=$(sysctl -n hw.cpu)
bundle config set --global jobs $((num_cores - 1)) 1>/dev/null
# install colorls
gem install clocale colorls 1>/dev/null

printf "📦  Configure Node\n"
# install n for version management
yarn global add n 1>/dev/null
# make cache folder (if missing) and take ownership
sudo mkdir -p /usr/local/n
sudo chown -R $(whoami) /usr/local/n
# take ownership of Node.js install destination folders
sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
# install and use node lts
n lts

printf "🐍  Configure Python\n"
# setup pyenv / global python to 3.12.x
pyenv install 3.12 1>/dev/null
pyenv global 3.12 1>/dev/null
# dont set conda clutter in zshrc
conda config --set auto_activate_base false

# installing zap plugin manager
printf "🔌  Installing Zap\n"
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --keep --branch release-v1

printf "👽  Installing AstroNvim\n"
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim

printf "🐗  Stow dotfiles\n" # Some of those not work its good to manually stow them
cd dotfiles
stow alacritty colorls fzf skhd starship yabai zsh Documents

# reload zsh
source ~/.zshrc

printf "✨  Done!\n"
printf "Remember to configure yabai scripting addition 'https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(from-HEAD)' and install yabai indicator\n"
printf "Some changes may require a logout/restart to take effect.\n"
