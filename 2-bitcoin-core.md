Install Bitcoin Core Using Tails

This step assumes the user has already completed 1-installing-tails.md and has setup persistence.

Install tails and create a persistent storage drive. Ensure that you have booted tails with an adminstrator password enabled.

Navigate to the root terminal.

run $ `wget http://6hasakffvppilxgehrswmffqurlcjjjhd76jgvaqmsg6ul25s7t3rzyd.onion/en/download/`

then extract your download to your persistent folder (note the file name may be different)

$ `tar -xvzf bitcoin-23.0-x86_64-linux-gnu.tar.gz -C /home/amnesia/Persistent`

STOP HERE IF YOU WISH TO USE AN INTERNAL DISK INSTEAD OF THE TAILS PERSISTENT STORAGE

then create a Bitcoin folder inside of persistent.

$ `cd /home/amnesia/Persistent`

$ `mkdir Bitcoin`

Then create a bitcoin.conf file inside of your persistent directory cd Bitcoin

`echo "prune=10000 proxy=127.0.0.1:9050 onlynet=onion" > bitcoin.conf`

You can now verify your bitcoin conf has been properly updated by typing

$ `cat bitcoin.conf`

You should see an output very similar to the above example.

You can now run bitcoin core with `cd ..`

`/home/amnesia/Persistent/bitcoin-23.0/bin/bitcoin-qt` don't forget to set the data directory to the Bitcoin directory created inside of Persistent.

Alternate download link: https://bitcoincore.org/bin/bitcoin-core-23.0/bitcoin-23.0-x86_64-linux-gnu.tar.gz

Note: Starting the core GUI and navigating to the settings window, and the Network tab and manually enabling the socks5 proxy seems more reliable than providing a config file

Note: If socks5 refuses to connect try configuring your iptables with the following command `sudo iptables -I OUTPUT 2 -p tcp -d 127.0.0.1 -m tcp --dport 9050 -j ACCEPT`
