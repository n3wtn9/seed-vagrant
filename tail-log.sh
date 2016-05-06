#! /bin/bash

cd logs
tail -f `ls -Art | tail -n 1`
