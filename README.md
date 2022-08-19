# Bitcoin-Core-Tails
Install Bitcoin Core Using Tails


Install tails and create a persistent storage drive. Ensure that you have booted tails with an adminstrator password enabled.

Navigate to the root terminal.


run 
$ `wget http://6hasakffvppilxgehrswmffqurlcjjjhd76jgvaqmsg6ul25s7t3rzyd.onion/en/download/`

then extract your download to your persistent folder (note the file name may be different)

$ `tar -xvzf bitcoin-23.0-x86_64-linux-gnu.tar.gz -C /home/amnesia/Persistent`

then create a `Bitcoin` folder inside of persistent. 

$ `cd /home/amnesia/Persistent`

$ `mkdir Bitcoin`

Then create a `bitcoin.conf` file inside of your persistent directory

$ `touch bitcoin.conf`

then use vim to edit your bitcoin.conf file like so

$ `vim bitcoin.conf`

Press "i" to place vim into insert mode. 

paste in the following 

`prune=10000`
`proxy=127.0.0.1:9050`
`onlynet=onion`
`dns=0`
`dnsseed=0`

Press the escape key and type ':x' then press the enter key.

You can now verify your bitcoin conf has been properly updated by typing

$ `cat bitcoin.conf`

You should see an output very similar to the above example. 

You can now run bitcoin core with
`/home/amnesia/Persistent/bitcoin-23.0/bin/bitcoin-qt`
don't forget to set the data directory to the Bitcoin directory created inside of Persistent.


Alternate
https://bitcoincore.org/bin/bitcoin-core-23.0/bitcoin-23.0-x86_64-linux-gnu.tar.gz

Note: If socks5 refuses to connect try configuring your iptables with the following command
`sudo iptables -I OUTPUT 2 -p tcp -d 127.0.0.1 -m tcp --dport 9050 -j ACCEPT`
