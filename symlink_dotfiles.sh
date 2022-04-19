DOTFILES_ROOT=$(pwd)

for name in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '.*' -not -path '*.git'); do
  if [ ! -d "$name" ]; then
    SRC=$(basename "$name")
    TARGET="$HOME/$SRC"
    echo "-----> Symlinking from $DOTFILES_ROOT/$SRC to $TARGET"
    rm -f "$TARGET"
    ln -s "$DOTFILES_ROOT/$SRC" "$TARGET"
  fi
done

# zsh plugins
DOTFILES_ROOT=$(pwd)
ZSH_PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"
mkdir -p "$ZSH_PLUGINS_DIR" && cd "$ZSH_PLUGINS_DIR"
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
  echo "-----> Installing zsh plugins"
  git clone https://github.com/zsh-users/zsh-history-substring-search
  git clone https://github.com/zsh-users/zsh-autosuggestions
  git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

fi
cd "$DOTFILES_ROOT"

echo "👌 Finish!"