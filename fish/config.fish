# view
set -g theme_display_date yes
set -g theme_date_format "+%F %H:%M"
set -g theme_display_git_default_branch yes
set -g theme_color_scheme dark

# path
set -x PATH $HOME/.nodebrew/current/bin $PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# ghq + fzf
function ghq_fzf_repo -d 'Repository search'
  ghq list --full-path | fzf --reverse --height=100% | read select
  [ -n "$select" ]; and cd "$select"
  echo " $select "
  commandline -f repaint
end

# fish key bindings
function fish_user_key_bindings
  bind \cg ghq_fzf_repo
end

# pnpm
set -gx PNPM_HOME "/Users/hirotaka/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# k8s
set -g theme_display_k8s_context yes
set -g theme_display_k8s_namespace yes