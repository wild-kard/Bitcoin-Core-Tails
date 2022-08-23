Since we want to sync and store our blockdata on the local interal disk, instead of on the free space of our tails usb, we need to set up a .bitcoin 
directory in the local disk.

However, in order to do this, we also need to tell our tails .config to automatically mount the internal drive on boot. 


for me this means running
`udisksctl mount --block-device /dev/nvme0n1p2`

Your path will be slightly different based on the name of the local drive you wish to mount 


we will now take this script and make it autorun at startup by editing the tails dotfiles

Navigate to 
`/live/persistence/TailsData_unlocked/dotfiles`

make your directories
`mkdir --parents /live/persistence/TailsData_unlocked/dotfiles/.config/autostart`

create a startup file
`echo "[Desktop Entry]
X-GNOME-Autostart-enabled=true
Exec=/udisksctl mount --block-device /dev/nvme0n1p2 
Encoding=UTF-8
Version=1.0
Type=Application
Name=autostart
Terminal=false" > mount_internal.desktop`


Now we need to give our new dotfiles directory and our new autostart script the proper permissions
`sudo chmod -R 777 /live/persistence/TailsData_unlocked/dotfiles/.config/autostart`

`sudo chmod +x /live/persistence/TailsData_unlocked/dotfiles/.config/autostart/mount_internal.desktop`


The specified internal disk should now automount at Log In


