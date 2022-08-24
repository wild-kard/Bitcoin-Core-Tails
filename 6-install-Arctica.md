`sudo apt update`

`sudo apt install -y build-essential`

Above may not be necessary

Create a .cargo dotfile directory inside of dotfiles
`mkdir .cargo /live/persistence/TailsData_unlocked/dotfiles`

download and install rust

`wget https://static.rust-lang.org/dist/rust-1.63.0-x86_64-unknown-linux-gnu.tar.gz`
ALTERNATE
`https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init`

Extract the tarball

`tar -xvzf rust-1.63.0-x86_64-unknown-linux-gnu.tar.gz -C /home/amnesia/Persistent`

Run the rust-up installer

`sudo bash /rust-1.63.0-x86_64-unknown-linux-gnu/install.sh`

git clone and use Cargo to install Arctica

`git clone https://github.com/wild-kard/arctica`

`cd arctica`

currently stuck here need to navigate around tails firewalls to access depedencies from github for the cargo build

`cargo build`

