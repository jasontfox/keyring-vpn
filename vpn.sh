#!/bin/sh
vpnCmd="/opt/cisco/anyconnect/bin/vpn"
command=$1
if [[ $# < 5 ]]; then
    if [ $command != "disconnect" ] 
    then 
	    echo "Use password saved in macOS keychain for Cisco VPNs"
	    echo "$0 usage: vpn.sh <connect/disconnect> <vpnname> <vpnprofile-number> <keychain-account> <keychain-service>"
	    exit 1
    fi
fi

if [ $command = "disconnect" ] 
then 
    $vpnCmd -s disconnect
    exit 0
fi

keychainAccount=$4 # this name has to match "Account" for the entry you make in keychain
keychainService=$5 # this has to match the "Service" for the entry you make ih keychain
password=$(security find-generic-password -a "$keychainAccount" -s "$keychainService" -w)

# exit if keychain item is not accessible, the keychain will write an error message already
if [ $? != 0 ]; then exit 1; fi

vpnName=$2
vpnProfileNumber=$3

$vpnCmd -s << EOF
connect $vpnName
$vpnProfileNumber
$keychainAccount
$password
y
exit
EOF > /dev/null 2>&1