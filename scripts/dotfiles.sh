set -ux

# stow dotfiles
cd /home/vagrant/dotfiles
for DIR in $(ls -d */ | sed 's#/##')
do
  stow "$DIR"
done

