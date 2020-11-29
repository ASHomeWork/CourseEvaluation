rvm install 2.6
rvm use 2.6 --default
sudo apt-get update 
sudo apt-get install -y nodejs
sudo apt install npm
sudo npm cache clean
sudo npm install -g n
sudo    n   stable
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt install --no-install-recommends yarn
gem install bundler
yarn add bootstrap@4.3.1 jquery popper.js
