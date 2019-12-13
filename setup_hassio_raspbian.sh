echo "Updating everything first..."
sudo apt-get update && sudo apt-get upgrade -y
echo "Installing Docker..."
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker pi
echo "If the rest of this doesn't work, you may need to logout"
echo "and log back in to the system..."
echo ""
echo "Now installing Hassio and requirements..."
sudo apt install jq apparmor-utils socat
sudo curl -sL https://raw.githubusercontent.com/home-assistant/hassio-build/master/install/hassio_install | sudo bash -s -- -m raspberrypi3
echo "Now running docker container ls"
docker container ls
echo "Going to try and start hassio..."
echo "If it doesn't work, run docker container ls,"
echo "then run the homeassistant image name with docker run, then docker name"
sudo docker run homeassistant/raspberrypi3-homeassistant
echo "For more questions, check out https://web.archive.org/web/20190125065335/https://www.reddit.com/r/homeassistant/comments/9xdizy/using_a_raspberry_pi_for_more_than_hassio/"
echo "Enjoy!"
