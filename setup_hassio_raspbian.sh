echo "-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "This program will setup everything to run Hassio on raspbian or another similar OS inside a docker container"
echo "-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo ""
echo "********************************"
echo "Updating everything first..."
echo "********************************"
echo ""
sudo apt-get update && sudo apt-get upgrade -y
echo ""
echo "********************************"
echo "Installing Docker..."
echo "********************************"
echo ""
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker pi
echo ""
echo "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "If the rest of this doesn't work, you may need to logout and log back in to the system..."
echo "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo ""
sleep 5s
echo "*******************************************"
echo "Now installing Hassio and requirements..."
echo "*******************************************"
echo ""
sudo apt install jq apparmor-utils socat -y
sudo curl -sL https://raw.githubusercontent.com/home-assistant/hassio-build/master/install/hassio_install | sudo bash -s -- -m raspberrypi3
echo ""
echo "***********************************"
echo "Now running docker container ls"
echo "***********************************"
echo ""
docker container ls
echo ""
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "Going to try and start hassio..."
echo "If it doesn't work, run \"docker container ls\""
echo "then run the homeassistant image name with \"docker run\" then docker name"
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo ""
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "For more questions feel free to open an issue or contact me on Telegram @JTruj1ll0923"
echo "Enjoy!"
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
sudo docker run homeassistant/raspberrypi3-homeassistant
