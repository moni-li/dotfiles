# Windows Subsystem for Linux

"Bash on Ubuntu on Windows" was introduced in the Win10 Anniversary Update because developing on Windows is terrible.

## Setup

1. Settings > Update & Security > For Developers > Select "Developer Mode"
2. Control Panel > Programs > Turn Windows Features On or Off > Select "Windows Subsystem for Linux"
3. Reboot
4. Search and open bash (under command)
5. Follow installation steps for Ubuntu
6. "Bash on Ubuntu on Windows" now shows up under Apps

## Solutions (or Work-arounds) to Issues I Encountered

1. Sharing ssh config between Windows and WSL
..* Symlinking doesn't work. You get a "bad owner or permissions"
..* Some people changed the home directory in /etc/passwd to their user directory in Windows, but this did not work for me
..* My work-around was to simply copy my .ssh folder
2. Accessing files on Windows from Linux
..* Symlinking works in this case; note that `-fs` replaces existing folders with that name while `-s` does not
...ink folder into current directory with same name `ln -fs /mnt/:drive/:folder`
...Link folder into specific folder `ln -fs /mnt/:drive/:folder ~/:wsl_folder`
3. Git shows that all files in my Windows repos have been modified
..* In my case, this was due to line endings. `git config --global core.autocrlf true`
4. Sudo unable to resolve host
..* Edit /etc/hosts file `printf "\n127.0.0.1 $HOSTNAME\n" | sudo tee -a /etc/hosts`
5. `bundle install` fails, giving error "parent directory is world writable but not sticky"
..* found this solution on [github](https://github.com/bundler/bundler/issues/4599 "Bundler Issue #4599") `$ find ~/.bundle/cache -type d -exec chmod +t {} +`
