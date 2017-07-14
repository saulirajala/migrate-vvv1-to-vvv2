# Reset (returns it to the same situation as in origin )
# all the Git repositories from your VVV2 -environment
#
# How to use?
# 1. Put this file inside www-folder of VVV2-environment
# 2. Make sure it is executable inside vagrant-box by running chmod +x ./git-reset-all-repos.sh
# 3. Inside your new VVV2 vagrant-box in www-folder execute the script (./git-reset-all-repos.sh)
#
#!/bin/bash

for installation in *; do
  if [[ -d $installation ]]; then
    if [[ $installation == 'default' ]]; then
      continue
    fi
    if [[ $installation == 'phpcs' ]]; then
      continue
    fi
    cd $installation"/public_html/"
    echo "Resetting the git repo of "$installation" -installation"
    git reset --hard && git clean -df
    git pull origin master
    cd ../..
  fi
done
