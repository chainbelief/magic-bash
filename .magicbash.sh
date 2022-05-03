export PATH="$HOME/.poetry/bin:$PATH"

function bc() {
	bin/compile
}

function bt() {
	bin/test
}

# hardhat
function csize() {
	npx hardhat size-contracts
}

# avalanch
function avash() {
	~/avalanchego
}
function avashsample () {
	git clone https://github.com/ava-labs/avalanche-smart-contract-quickstart.git $1
	cd $1
	yarn
}
# anchor template
function anchorsample() {
	git clone git@github.com:earth04190419/anchor-escrow.git $1
	
}

# cairo

function cc() {
	cairo-compile $1.cairo \
    --output $1_compiled.json 
}

function crun() {
	cairo-run \
		--program=$1_compiled.json --print_output \
		--print_info --layout=small
}

function starkdeploy() {
	starknet deploy --contract $1_compiled.json --inputs $2 $3
}
function starkc() {
	starknet-compile $1.cairo \
    --output $1_compiled.json \
    --abi $1_abi.json
}
function starktx() {
	starknet tx_status --hash $1
}
function starkerrtx() {
	starknet tx_status --hash $2 --contracts ${CONTRACT_ADDRESS}:$1_compiled.json --error_message
}
function starktxdetail() {
	starknet get_transaction --hash $1
}
function starkcall() {
	starknet call \
		--address ${CONTRACT_ADDRESS} \
		--abi $1_abi.json \
		--function $2 \
		--inputs $3 $4 $5 $6
}
function starkinvoke() {
	starknet invoke \
		--address ${CONTRACT_ADDRESS} \
		--abi $1_abi.json \
		--function $2 \
		--inputs $3 $4 $5 $6 $7
}
function starkzfinvoke() {
	starknet invoke \
		--address ${CONTRACT_ADDRESS} \
		--abi $1_abi.json \
		--function $2 \
		--inputs $3 $4 $5 $6 $7 \
		--max_fee 0
}

function cairoenv() {
	source ~/cairo_venv/bin/activate
}
# update bash to github
function updatebash() {
	mkdir ~/.mytemp
	cd ~/.mytemp
	cp ~/.magicbash.sh ~/.mytemp/.magicbash.sh
	git init
	git remote add origin git@github.com:earth04190419/magic-bash.git
	git add .
	git commit -m "update"
	git checkout -b main
	git push origin main --force
	cd -
	sudo rm -r ~/.mytemp
}
# setup pro-bash env
function setupenv() {
	installsnippet
}

# save vscode snippets
function installsnippet() {
	mkdir ~/.config/Code/User/snippets
	cd ~/.config/Code/User/snippets
	git init
	git remote add origin git@github.com:earth04190419/vscode-snippets.git
	git checkout -b main
	git pull origin main
	cd -	
}
function savesnippet() {
	cd ~/.config/Code/User/snippets/
	git init
	git remote add origin git@github.com:earth04190419/vscode-snippets.git
	git checkout -b main

	git add .
	git commit -m "update snippets"
	git push origin main --force
	cd -
}

#solana
function swcat () {
	cat ~/.config/solana/$1.json
}
function swto () {
	solana config set -k ~/.config/solana/$1.json
}
function swnew() {
	solana-keygen new -o ~/.config/solana/$1.json
}
function saddr () {
	solana-keygen pubkey
}
function sget() {
	solana config get
}
function surito() {
	solana config set --uri $1
}

# github
function gu () {
	git add .
	git commit -m "$1"
	git push origin $2
}
#truffle script
function tloc() {
	truffle migrate --reset
}
# hardhat runscript
function locrun() {
	npx hardhat run scripts/run.js
}
function netrun() {
	npx hardhat run scripts/run.js --network $1
}
function rinkrun() {
	netrun rinkeby
}
function deploy() {
 	npx hardhat run scripts/deploy.js --network $1
}

# dev browsing
function dev(){
	cd ~/dev/$1
}

function tutorial(){
	cd ~/dev/tutorial/$1
}

# bash
function editbash(){
	code ~/.magicbash.sh
}

function savebash(){
	source ~/.magicbash.sh
}

# cardano
function cadatestnode(){
cardano-node run \
--config $HOME/cardano/testnet-config.json \
--database-path $HOME/cardano/db/ \
--socket-path $HOME/cardano/db/test/node.socket \
--host-addr 127.0.0.1 \
--port 1337 \
--topology $HOME/cardano/testnet-topology.json
}
