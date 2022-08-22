import the tails signing key and add to the GnuPGP keyring
`wget https://tails.boum.org/tails-signing.key
gpg --import < tails-signing.key`

install the debian keyring
`sudo apt update && sudo apt install debian-keyring`

import the openPGP key of Chris Lamb (former Debian lead)
`gpg --keyring=/usr/share/keyrings/debian-keyring.gpg --export chris@chris-lamb.co.uk | gpg --import`

verify certifications made on tails signing key
`gpg --keyid-format 0xlong --check-sigs A490D0F4D311A4153E2BB7CADBB802B258ACD84F`


looking for something like
`sig!         0x1E953E27D4311E58 2020-03-19  Chris Lamb <chris@chris-lamb.co.uk>`


certify the tails signing key
`gpg --lsign-key A490D0F4D311A4153E2BB7CADBB802B258ACD84F`

download tails
`wget --continue http://dl.amnesia.boum.org/tails/stable/tails-amd64-5.3.1/tails-amd64-5.3.1.img `

download signature of the usb image
`wget https://tails.boum.org/torrents/files/tails-amd64-5.3.1.img.sig `

verify the usb image is signed with the tails signing key
` TZ=UTC gpg --no-options --keyid-format long --verify tails-amd64-5.3.1.img.sig tails-amd64-5.3.1.img `

Output should be something like (Verify that the date of the signature is the same and the signature is marked as Good signature since you certified the Tails signing key with your own key.)
`gpg: Signature made Tue 02 Aug 2022 12:07:47 AM UTC
gpg:                using EDDSA key CD4D4351AFA6933F574A9AFB90B2B4BD7AED235F
gpg: Good signature from "Tails developers (offline long-term identity key) <tails@boum.org>" [full]
gpg:                 aka "Tails developers <tails@boum.org>" [full]`


Select the device to be flashed (need to prompt user here and decide this dynamically eventually). For now...

1. return a list of devices on the system
`ls -1 /dev/sd?`
2. insert USB or SD card to be flashed
`ls -1 /dev/sd?`
3. identify newly inserted device

4. DD the appropriate storage device with the downloaded tails image
`sudo dd if=tails-amd64-5.3.1/tails-amd64-5.3.1.img of=/dev/sda bs=16M oflag=direct status=progress`


You now have a bootable tails usb. Reboot into the tails OS and setup persistence and root priveleges. For now give all usbs a password of 'a' for both root and persistence.
