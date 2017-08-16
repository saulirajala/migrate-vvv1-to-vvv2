# How to migrate from VVV1 to VVV2?

1. Make sure you have backups from the old vagrant-local -folder!
1. Copy all the databases from old vvv1 by running `copy-all-databases.sh`
2. Copy all the git-files and wp-config.php from old vvv1 by running `copy-git-repos-from-vvv1.sh`
3. Destroy vvv1 vagrant-box by `vagrant destroy`
4. Rename vagrant-local -folder to vagrant-local-vvv1
5. Install vvv2 as usually by following the instructions in https://varyingvagrantvagrants.org/docs/en-US/installation/
6. Add the old sites to vvv-custom.yml (you can get the names by running `echo-installations.sh` and after that it is just some multicursor fun)
7. Run `vagrant up --provision`
8. Put old databases to `vagrant-local/database/backups` and `vagrant ssh`
9. Run the `import-sql.sh` of this repo inside `/srv/database`
10. Run `git-reset-all-repos.sh` to reset all your repos in new vvv2

## Problems with Mailcatcher?
I did have some problems with Mailcatcher. VVV tried to install it, but failed
with the following message `ERROR:  Error installing mailcatcher:`. This had
something to do with old version of Ruby (1.9) and bug in rvm
(https://github.com/Varying-Vagrant-Vagrants/VVV/pull/1235). I managed to get it
work by manually:
```
vagrant ssh
curl --silent -L "https://raw.githubusercontent.com/rvm/rvm/stable/binscripts/rvm-installer" | sudo bash -s stable --ruby
source "/usr/local/rvm/scripts/rvm"
/usr/bin/env rvm default@mailcatcher --create do gem install mailcatcher --no-rdoc --no-ri
/usr/bin/env rvm wrapper default@mailcatcher --no-prefix mailcatcher catchmail
cp "/srv/config/init/mailcatcher.conf"  "/etc/init/mailcatcher.conf"
cp "/srv/config/php-config/mailcatcher.ini" "/etc/php/7.0/mods-available/mailcatcher.ini"
```

## What else?
Check out my fork of vvv2 custom site template: https://github.com/saulirajala/custom-site-template
