Now we need to create our .bitcoin directory and symlinks for tails. 

Start by navigating to your local disk and creating a .bitcoin directory where we will store the chainstate and blockdata.

`cd /media/amnesia/a988dd30-61b1-49d7-88f4-50b8c450e5c0`

`mkdir .bitcoin`

Navigate into the .bitcoin directory and create a chainstate and a blocks directory

`cd .bitcoin`

`mkdir chainstate`

`mkdir blocks`

Now we will navigate back to the dotfiles directory and make a .bitcoin directory which will be symlinked to our local disk directory
`cd`

`cd /live/persistence/TailsData_unlocked/dotfiles`

`mkdir .bitcoin`

Now let's create our symlinks
`cd .bitcoin`

`ln -s /media/amnesia/a988dd30-61b1-49d7-88f4-50b8c450e5c0/.bitcoin/chainstate chainstate`

`ln -s /media/amnesia/a988dd30-61b1-49d7-88f4-50b8c450e5c0/.bitcoin/blocks blocks`


Restart Tails

Your symlinks to internal drive/.bitcoin should now symlink to $HOME/.bitcoin
