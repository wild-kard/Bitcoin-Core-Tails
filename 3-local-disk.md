Since we want to sync and store our blockdata on the local interal disk, instead of on the free space of our tails usb, we need to set up a .bitcoin 
directory in the local disk.

However, in order to do this, we also need to tell our tails .config to automatically mount the internal drive on boot. 


for me this means running
`udisksctl mount --block-device /dev/nvme0n1p2`

Your path will be slightly different based on the name of the local drive you wish to mount 


we will now take this script and make it autorun at startup by editing the tails dotfiles

Navigate to 
`/live/persistence/TailsData_unlocked/dotfiles`

make a directory called .config
`mkdir .config`

insde of .config create a directory called autostart
`cd .config`

`mkdir autostart`

create a .desktop file with the mount script we customized with the correct device path above 
`echo "#!/bin/bash
udisksctl mount --block-device /dev/nvme0n1p2" > mount_internal.desktop`

Now we need to give our new dotfiles directory and our new autostart script the proper permissions
 `chmod u+x mount_internal.desktop`
 
 `cd ..`
 
 `chmod u+x autostart`
 
 `cd ..`
 
 `chmod u+x .config`




