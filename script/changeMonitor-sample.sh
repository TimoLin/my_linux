#/bin/bash
# Change monitor source in a software way instead of push the button
echo YOUR_PASS_WORD | sudo -S ddcutil -d 1 setvcp 60 0x01

