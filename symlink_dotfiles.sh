DOTFILES_ROOT=$(pwd)

for name in $(find -H "${DOTFILES_ROOT}" -maxdepth 2 -name '.*' -not -path '*.git'); do
  if [ ! -d "${name}" ]; then
    SRC=$(basename "${name}")
    TARGET="${HOME}/${SRC}"
    echo "-----> Symlinking from ${DOTFILES_ROOT}/${SRC} to ${TARGET}"
    rm -f "${TARGET}"
    ln -s "${DOTFILES_ROOT}/${SRC}" "${TARGET}"
  fi
done

# oh-my-zsh & plugins
if [ ! -d "~/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH_PLUGINS_DIR="${HOME}/.oh-my-zsh/custom/plugins"
if [ ! -d "${ZSH_PLUGINS_DIR}" ]; then
  mkdir -p "${ZSH_PLUGINS_DIR}"
fi

cd "${ZSH_PLUGINS_DIR}"
if [ ! -d "${ZSH_PLUGINS_DIR}/zsh-syntax-highlighting" ]; then
  echo "-----> Installing zsh plugins"
  git clone https://github.com/zsh-users/zsh-history-substring-search
  git clone https://github.com/zsh-users/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
fi
cd "${DOTFILES_ROOT}"

# nerd font & theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/themes/powerlevel10k
fonts_dir="${HOME}/.local/share/fonts"
if [ ! -d "${fonts_dir}" ]; then
  mkdir -p "${fonts_dir}"
fi
font_name="Agave"
font_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/${font_name}.zip"
wget "${font_url}"
unzip "./${font_name}.zip" -d "${fonts_dir}"
rm "./${font_name}.zip"

echo "👌 Finish!"