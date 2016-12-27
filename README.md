# cheku
CHEcK Users on your linux

CHEKU is a script-based monitoring program.
It watches for new login sessions of a specific user and stores information in the journal of the OS.
The script starts an infinite process.

##Scripts

1. cheku.sh

 This is the main script. It monitors the login session information of a specific user.
 The user is specified in the file **cheku-user**.

2. cheku-config.sh

 This is a help-script. It's the interactive creator of the **cheku-user**.

3. cheku-daemon.sh

 This script starts **cheku.sh** as a daemon in background.
