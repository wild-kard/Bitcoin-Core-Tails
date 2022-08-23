`sudo apt update`

`sudo apt install -y build-essential`

Above may not be necessary

download and install rust
`wget https://static.rust-lang.org/dist/rust-1.63.0-x86_64-unknown-linux-gnu.tar.gz`

Extract the tarball

`tar -xvzf rust-1.63.0-x86_64-unknown-linux-gnu.tar.gz -C /home/amnesia/Persistent`

Run the rust-up installer
`sudo bash /rust-1.63.0-x86_64-unknown-linux-gnu/install.sh`

Use Cargo to install the BDK
`cargo install --git https://github.com/bitcoindevkit/bdk-cli`
