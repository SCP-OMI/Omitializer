RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

echo -e "${PURPLE}_______ ______  ___________________";
echo -e "${PURPLE}__  __ \___   |/  /____  _/___  __/";
echo -e "${PURPLE}_  / / /__  /|_/ /  __  /  __  /   ";
echo -e "${PURPLE}/ /_/ / _  /  / /  __/ /   _  /    ";
echo -e "${PURPLE}\____/  /_/  /_/   /___/   /_/     ";
echo "                                               ";


echo -e "${GREEN} Welcome to Omitializer"
sleep 1
echo -e "${GREEN} This script will install some of the most common tools and dependencies for development"
sleep 1
echo -e "${GREEN} Let's get started"
sleep 1


echo -e "{${GREEN} + ${WHITE}} Updating / upgrading"
sudo apt update
sudo apt -y upgrade

echo -e "{${GREEN} + ${WHITE}} Installing dependencies"
echo -e "{${GREEN} + ${WHITE}} Installing Git"
sudo apt install git -y
echo -e "{${GREEN} + ${WHITE}} Installing Python3"
sudo apt install python3 -y
echo -e "{${GREEN} + ${WHITE}} Installing Python3-pip"
sudo apt install python3-pip -y
echo -e "{${GREEN} + ${WHITE}} Installing vscode"
sudo apt install code -y
echo -e "{${GREEN} + ${WHITE}} Installing make"
sudo apt install make -y
echo -e "{${GREEN} + ${WHITE}} Installing curl"
sudo apt install curl
echo -e "{${GREEN} + ${WHITE}} Installing wget"
sudo apt install wget -y
echo -e "{${GREEN} + ${WHITE}} Installing zsh"
sudo apt install zsh -y
echo -e "{${GREEN} + ${WHITE}} Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# Install NodeJS and package manager
echo -e "{${GREEN} + ${WHITE}} Are you a web-developer?"
read -p "Install NodeJS and package manager for web development (y/n)? " webdev
if [ "$webdev" == "y" ]; then
  echo -e "${GREEN}+ Installing NodeJS${WHITE}"
  sudo apt install nodejs -y
  echo -e "${GREEN}+ Choose package manager (y: yarn, n: npm):${WHITE}"
  read -p "(y/n): " yarn_choice
  if [ "$yarn_choice" == "y" ]; then
    echo -e "${GREEN}+ Installing yarn${WHITE}"
    sudo npm install --global yarn
  else
    echo -e "${GREEN}+ Using npm (already included with NodeJS)${WHITE}"
  fi
fi

# Install Docker
echo -e "{${GREEN} + ${WHITE}} you want Docker?"
read -p "y/n: " docker
if [ $docker == "y" ]; then
    echo -e "{${GREEN} + ${WHITE}} Installing Docker"
    sudo apt install docker.io -y
    sudo systemctl start docker
    sudo systemctl enable docker
fi

# Install Docker Compose
echo -e "{${GREEN} + ${WHITE}} Do you want Docker Compose?"
read -p "y/n: " docker_compose
if [ $docker_compose == "y" ]; then
    echo -e "{${GREEN} + ${WHITE}} Installing Docker Compose"
    sudo apt install docker-compose -y
fi

# Install VLC
echo -e "{${GREEN} + ${WHITE}} Do you want VLC?"
read -p "y/n: " vlc
if [ $vlc == "y" ]; then
    echo -e "{${GREEN} + ${WHITE}} Installing VLC"
    sudo apt install vlc -y
fi

# Install wine
echo -e "{${GREEN} + ${WHITE}} Do you want Wine?"
read -p "y/n: " wine
if [ $wine == "y" ]; then
    echo -e "{${GREEN} + ${WHITE}} Installing Wine"
    sudo dpkg --add-architecture i386 
    sudo mkdir -pm755 /etc/apt/keyrings
    sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
    sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
    sudo apt update
    sudo apt install --install-recommends winehq-stable -y
fi



# Install Brave
echo -e "Do you want to install Brave?"
read -p "y/n: " brave
echo -e "{${GREEN} + ${WHITE}} Installing Brave"
if [ "$brave" == "y" ]; then
    echo -e "{${GREEN} + ${WHITE}} Installing Brave"
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt install brave-browser -y
fi

# Install Discord
echo "Do you want to install Discord?"
read -p "y/n: " discord
if [ $discord == "y" ]; then
    echo "{${GREEN} + ${WHITE}} Installing Discord"
    sudo snap install discord
fi

