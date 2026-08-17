export EDITOR="nvim"
export PATH="$HOME/desktop/bin:$HOME/.local/bin:$PATH"

keys=(~/.ssh/id_ed25519_*(N))
(( ${#keys} )) && eval "$(keychain --eval --quiet ${keys[@]:t})"
# eval "$(keychain --eval --quiet ed25519_personal ed25519_work)"
source <(fzf --zsh)

# Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.local/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey -s ^f "tmux-sessionizer\n"

alias clipboard="wl-copy"

# Node
export PATH="$HOME/.npm-global/bin:$PATH"
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Turso
export PATH="$PATH:/home/wlm/.turso"
