# Add binaries into the path
PATH=~/.dotfiles/bin:$PATH
export PATH

# Source all files in ~/.dotfiles/source/
function src() {
  local file
  if [[ "$1" ]]; then
    source "$HOME/.dotfiles/source/$1.sh"
  else
    for file in ~/.dotfiles/source/*; do
      source "$file"
    done
  fi
}

# Run dotfiles script, then source.
function dotfiles() {
  ~/.dotfiles/bin/dotfiles "$@" && src
}

src

if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

if [ -f /opt/emscripten/emsdk_set_env.sh ]; then
  source /opt/emscripten/emsdk_set_env.sh
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#### Android 
export PATH=${PATH}:/opt/google/android-studio-beta/bin:/opt/google/android-sdk/platform-tools:/opt/google/android-sdk/tools:/opt/google/android-ndk
export ANDROID_HOME=/opt/google/android-sdk
export PATH=${PATH}:/opt/genymotion
export JAVA7_HOME=/usr/lib/jvm/java-7-oracle
export JAVA8_HOME=/usr/lib/jvm/java-8-oracle
