#!/bin/bash

# Function to install Docker if not installed
install_docker() {
    echo "Docker is not installed. Installing now..."
   sudo apt update && apt install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
    echo "Docker installed successfully."
}

# Check if script is run as root
if [[ $(id -u) -ne 0 ]]; then 
    echo "Please run as root" 
    exit 1 
fi

# Check if Docker is installed, install if necessary
if ! command -v docker &> /dev/null; then
    install_docker
fi

# Display banner
echo "==============================================================="
echo "  Acunetix DOWNLOAD, AND INSTALL"
current_date_time=$(date) 
echo "  Current date and time: $current_date_time"
echo "  Take A Coffee Break and Give it to Me I am Here For U"
echo "==============================================================="
echo "==============================================================="
echo "                                            Developed by: ASTRA" 
echo "================================================================="

# Install Acunetix only after Docker is confirmed installed
echo "Checking Docker installation..."
if command -v docker &> /dev/null; then
    echo "Docker is installed. Proceeding with Acunetix installation."
else
    echo "Docker installation failed. Please install manually and retry."
    exit 1
fi

while true; do
    echo -e "\033[36m"
    echo -e "Choose the operation you want to perform:"
    echo -e "\033[31m"
    echo -e "1. Installation"
    echo -e "\033[36m"
    echo -e "2. Change Credential"
    echo -e "\033[35m"
    echo -e "3. Exit"
    echo -e "\033[34m"

    read count

    if [ "$count" -eq 1 ]; then
        sudo docker pull secfa/docker-awvs
        sudo docker run -it -d -p 13443:3443 --cap-add LINUX_IMMUTABLE secfa/docker-awvs
        read -p "Press enter to continue"
    elif [ "$count" -eq 2 ]; then
        read -p "Enter the Docker container name: " docker_names
        if [ -z "$docker_names" ]; then
            echo "Error: Container name cannot be empty."
            exit 1
        fi
        docker exec -u root -it $docker_names /bin/bash /home/acunetix/.acunetix/change_credentials.sh  
    elif [ "$count" -eq 3 ]; then
        exit 0
    else
        echo -e "Invalid selection. Please try again."
    fi
done

