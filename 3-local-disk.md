Since we want to sync and store our blockdata on the local interal disk, instead of on the free space of our tails usb, we need to set up a .bitcoin 
directory in the local disk.

However, in order to do this, we also need to tell our tails .config to automatically mount the internal drive on boot. 


for me this means running
`udisksctl mount -b /dev/nvme0n1p2`

Your path will be slightly different based on the name of the local drive you wish to mount 


we will now take this script and make it autorun at startup.


