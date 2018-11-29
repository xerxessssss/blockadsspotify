#! /bin/bash
echo "Created by @xerxessssss"

#Sudo access
sudo -v

# Kill Spotify if Spotify is running
if pgrep -x "spotify" > /dev/null
then
  killall spotify
fi

#Creating a security copy of /etc/hosts
echo "\n\nDo you want to create a backup of 'etc/hosts'?"
echo "Not creating a backup may cause permanent damage"

#Selecting an option
while true; do
  read -p "Do you want to create a backup?" yn
  case $yn in
      [Yy]* ) cp /etc/hosts ~; break;;
      [Nn]* ) echo "OK"; break;;
      * ) echo "Please answer yes or no.";;
  esac
done

#Main menu
clear
while true; do
  echo "\n\n1) Block Spotify ads"
  echo "\n2) Restore Spotify ads"
  echo "\n3) Exit"

  read -p "SELECT AN OPTION..." option
  case $option in
      [1]* )
      sudo sh -c "echo '#Block Spotify ads' >> /etc/hosts";
      sudo sh -c "echo '0.0.0.0 adclick.g.doublecklick.net' >> /etc/hosts";
      sudo sh -c "echo '0.0.0.0 googleads.g.doubleclick.net' >> /etc/hosts";
      sudo sh -c "echo '0.0.0.0 http://www.googleadservices.com' >> /etc/hosts";
      sudo sh -c "echo '0.0.0.0 pubads.g.doubleclick.net' >> /etc/hosts";
      sudo sh -c "echo '0.0.0.0 securepubads.g.doubleclick.net' >> /etc/hosts";
      sudo sh -c "echo '0.0.0.0 pagead2.googlesyndication.com' >> /etc/hosts";
      sudo sh -c "echo '0.0.0.0 spclient.wg.spotify.com' >> /etc/hosts";
      sudo sh -c "echo '0.0.0.0 audio2.spotify.com' >> /etc/hosts";
      sudo sh -c "echo '#Delete the code between this line and Block Spotify ads to restore ads' >> /etc/hosts";
      echo "\nADS REMOVED!";
      break;;
      [2]* ) vi /etc/hosts; break;;
      [3]* ) exit;;
  esac
done
