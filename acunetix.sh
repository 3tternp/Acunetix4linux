#!/bin/bash
# Display the menu
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi
echo ===============================================================
echo   Acunetix     DOWNLOAD, AND INSTALL
       current_date_time=$(date) 
echo   "Current date and time: $current_date_time"
echo   Take A Coffee Break and Give it to Me I am Here For U 
echo ===============================================================
echo ================================================================

echo "  ___                        _   _           ___    _     _            "      
echo " / _ \                      | | (_)         /   |  | |   (_)                 "
echo "/ /_\ \ ___ _   _ _ __   ___| |_ ___  __   / /| |  | |    _ _ __  _   ___  __"
echo "|  _  |/ __| | | | '_ \ / _ \ __| \ \/ /  / /_| |  | |   | | '_ \| | | \ \/ /"
echo "| | | | (__| |_| | | | |  __/ |_| |>  <   \___  |  | |___| | | | | |_| |>  < "
echo "\_| |_/\___|\__,_|_| |_|\___|\__|_/_/\_\      |_/  \_____/_|_| |_|\__,_/_/\_\ "                                                                                                                                            
echo "                                                            Develop by: ASTRA" 
echo =================================================================
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

    # Check if the input is empty
    if [ -z "$docker_names" ]; then
    echo "Error: Container name cannot be empty."
    exit 1
fi
# Execute the docker command
docker exec -u root -it $docker_names /bin/bash /home/acunetix/.acunetix/change_credentials.sh  

 ## sudo bash change_credentials.sh
  
   elif [ "$count" -eq 3 ]; then
    # Exit the script
    exit 0

  else
    # Invalid selection
    echo -e "Invalid selection. Please try again."
  fi
done

