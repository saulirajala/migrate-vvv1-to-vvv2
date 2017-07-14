# Export all the databases from your VVV1 -environment to backup-folder in your
# desktop
#
# How to use?
# 1. Put this file inside www-folder
# 2. Make sure it is executable inside vagrant-box by running chmod +x ./copy-all-databases.sh
# 3. Inside your vagrant-box in www-folder execute the script (./copy-all-databases.sh)
#
#!/bin/bash

for installation in *; do
  if [[ -d $installation ]]; then
    cd $installation"/"
    echo "Exporting the database of "$installation" -installation"
    wp db export $installation.sql --add-drop-table
    mv $installation.sql ~/Desktop/vagrant-db-backup/$installation.sql
    cd ..
  elif [[ -f $installation ]]; then
    echo "$installation is a file"
  else
    echo "$installation is not valid"
    exit 1
  fi

done
