#!/bin/sh

ssh-keygen -t rsa
# repeat if more than one
ssh student@ip mkdir -p .ssh
cat .ssh/id_rsa.pub | ssh student@ip 'cat >> .ssh/authorized_keys'