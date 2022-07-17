## Usage:
vpn.sh \<command\> \<vpn-target\> \<vpnprofile-number\> \<keychain-account\> \<keychain-service\>

- **command**: "connect" or "disconnect"
- **vpn-target**: the hostname for your vpn server 
	- (e.g. vpn.coolguy.io)
- **vpnprofile-number**: the number of the profile to use upon connection. If you manually run the AnyConnect command it should give a list of profiles to choose from
	- (e.g. `/opt/cisco/anyconnect/bin/vpn -s connect`)
- **keychain-account**: the value for "**Account**" in the keychain entry you want to use. 
	- (e.g. ${USER} to use the logged in user name)
- **keychain-service**: the value for "**Service**" in the keychain entry you want to use (e.g. vpn)

You can manually test that the **keychain-account** and **keychain-service** values are correct with the following command:
`security find-generic-password -a "\<keychain-account\>" -s "\<keychain-service\>" -g`