#!/usr/bin/env bash
##TODO remove asking for sudo for each command that needs it.
##TODO use cryptsetup refresh /dev/sda --allow-discards to make sync faster if the device can discard.
##TODO create an "SOS" nuke data shortcut.
readonly SIZE=$(df --output=size --block-size=M . | tail -1 | head -c-2)
readonly CHAINSTATE=$(du --block-size=M /media/amnesia/a988dd30-61b1-49d7-88f4-50b8c450e5c0/home/lappy/Bitcoin/chainstate | cut -f1 | head -c-2)
readonly BUFFER=$((CHAINSTATE > 6144 ? 10 * CHAINSTATE / 6 : 10240))
readonly RAM=$(($(awk '/MemAvailable/{print $2}' /proc/meminfo) / 1024))
block_space=$((SIZE - BUFFER - CHAINSTATE))
prune=$((block_space > 550 ? block_space : 550))
dbcache=$(( RAM - 1408 > 450 ? RAM - 1408 : 450))	# an extra GB to dbcache since a 1GB swap is on
readonly RPC_PARAMS='-rpcport=17600 -datadir=/media/amnesia/a988dd30-61b1-49d7-88f4-50b8c450e5c0/home/lappy/Bitcoin'
if test -f "/media/amnesia/a988dd30-61b1-49d7-88f4-50b8c450e5c0/home/lappy/Bitcoin/bitcoind.pid"; then
	bitcoin-cli $RPC_PARAMS stop
fi

for chain in INPUT FORWARD OUTPUT; do
	sudo iptables -P $chain ACCEPT
done

# deletes rules dropping non-Tor traffic
for rule in {33..29} 20 19 ; do
	sudo iptables --delete OUTPUT $rule
done

# waits to make sure bitcoin core has shutdown
wait -f $PID
. torsocks off		# disables Tor for the following command
/home/amnesia/Persistent/bitcoin-23.0/bin/bitcoin-qt $RPC_PARAMS -dbcache=$dbcache -prune=$prune -blocksonly -startupnotify="bash giant_prune.sh" & PID2=$!
wait -f $PID2
shred /home/amnesia/Persistent/swap	# shreds the swap file
/sbin/reboot	# restarts the computer after bitcoin core is closed.
