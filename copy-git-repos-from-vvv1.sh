# Copy all the Git repositories from your VVV1 -environment to VVV2-environment
#
# VVV2 is assumed to locate in ~/vagrant-local
#
# How to use?
# 1. Put this file inside www-folder of the old VVV1 -folder
# 2. Make sure it is executable by running chmod +x ./copy-git-repos-from-vvv1.sh
# 3. Inside your www-folder of old VVV1 execute the script (./copy-git-repos-from-vvv1.sh)
#
#!/bin/bash

for installation in *; do
  if [[ -d $installation ]]; then
    cd $installation"/htdocs/"
    echo "Copying git repository from " $installation" -installation"
    if [[ -f .gitignore ]]; then
      rm -rf ../../../../vagrant-local/www/$installation/public_html/.git
      rm ../../../../vagrant-local/www/$installation/public_html/.gitignore
      rm ../../../../vagrant-local/www/$installation/public_html/.idea
      cp -a .git ../../../../vagrant-local/www/$installation/public_html/.git
      cp .gitignore ../../../../vagrant-local/www/$installation/public_html/.gitignore
      cp -a .idea ../../../../vagrant-local/www/$installation/public_html/.idea
      cp wp-config.php ../../../../vagrant-local/www/$installation/public_html/wp-config-vvv1.php
    fi
    cd ../..
  fi

done
