apt-get remove docker docker-engine docker.io containerd runc
apt-get update
apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

apt-get update
apt-get install docker-ce docker-ce-cli containerd.io

sh build.sh
