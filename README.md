# dotfiles
you know what this is

# zsh
install omz
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
install zsh-autosuggestions
```
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
```
install zsh-syntax-highlighting
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```
restart omz to apply changes
```
omz reload
```
# tmux
install tpm
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
source it within tmux
```
tmux source ~/.tmux.conf
```
`prefix + I` wihtin tmux to install plugins and make sure `xclip` package installed
