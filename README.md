# The problem
An issue with Howdy is that, after initial sign using facial recognition, the user is greeted with this dialog when they get to their desktop:
> **Authentication required**
>
> The login keyring did not get unlocked when you logged into your computer.

They are prompted to type their password in order to access their login keyring. This makes the initial login with facial recognition a little pointless if the user needs to type their password immediately afterwards anyway.

# The solution
A workaround for this is to disable Howdy on initial sign in -- forcing the user to use their password at this stage.
This prevents the aforementioned dialog from showing up.
The scripts in this repository are based on https://github.com/boltgolt/howdy/issues/141#issuecomment-553326878.
However, I have modified this solution by introducing a new script `enable-howdy.sh` that is copied into `/usr/local/bin/` when installed.
`enable-howdy.sh` just runs the command `sudo howdy disable 0`.
Then, instead of giving the user passwordless access to the whole of Howdy, the installer only gives the user passwordless access to the aforementioned `enable-howdy.sh` script.
I think this is more secure as it prevents bad actors from accessing the whole of Howdy without a password (and changing settings like the recognition certainty, etc.) -- they are limited to enabling Howdy only.

## How to use
Clone this repository in your terminal with 
```
git clone https://github.com/Wartybix/Auto-Toggle-Howdy
```
Then navigate to the new directory (e.g. with `cd Auto-Toggle-Howdy`).
Run the installer with `./install.sh`.
Enter the following line in your terminal to enable Howdy after initial login:
```
sudo /usr/local/bin/enable-howdy.sh >> ~/.bash_profile
```
You may also remove the program with `./uninstall.sh`.
If you do uninstall, make sure to remove the line you added to your `.bash_profile`.
