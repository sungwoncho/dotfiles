DOTFILES_ROOT=$HOME/.dotfiles/

for src in $(find -H "$DOTFILES_ROOT" -name '*.sym' -not -path '*.git*')
do
  echo $src
done
