# Outputs the names of your installations in VVV1
#
# How to use?
# 1. Put this file inside www-folder
# 2. Make sure it is executable inside vagrant-box by running chmod +x ./echo-installations.sh
# 3. Inside your vagrant-box in www-folder execute the script (./echo-installations.sh)
#
#!/bin/bash

for installation in *; do
  if [[ -d $installation ]]; then
    echo $installation
  fi

done
