#!/usr/bin/expect -f

set timeout 10
spawn ./rebuild_cmd.sh
expect "Enter (1-3) --> "
# Rebuild Resource Index 
send -- "1\r"
expect "Enter (1-2) --> "
send -- "1\r"
expect "Finished.\r"
# Send a ^C (SIGINT)
send -- \x03

spawn ./rebuild_cmd.sh
expect "Enter (1-3) --> "
# Rebuild MySQL Database
send -- "2\r"
expect "Enter (1-2) --> "
send -- "1\r"
expect "Finished.\r"
# Send a ^C (SIGINT)
send -- \x03
