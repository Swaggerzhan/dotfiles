echo "HOME: $HOME"
NVIM_DIR=$HOME/.config/nvim
mkdir -p $NVIM_DIR
cp -r ./* $NVIM_DIR
cd $HOME
ln -s $HOME/.config/nvim/tmux.conf $HOME/.tmux.conf
