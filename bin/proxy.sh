#!/bin/sh
ssh -D 8899 -f -C -q -N -i ~/Documents/trubeko-key-pair-oregon.pem ec2-user@52.24.220.178
