ssh-keygen \
    -m PEM \
    -t rsa \
    -b 4096 \
    -C "ansible@ilmfc0dev01" \
    -f ./keys/ansible_rhel \
    -N <pass here>


ssh-copy-id -i ./keys/ansible_rhel.pub  ansible@ilmfc0prod01 


# Using ssh-agent command for non-interactive authentication

eval $(ssh-agent)
ssh-add -t 8h30 ./keys/ansible_rhel # 8 hours 30 minutes