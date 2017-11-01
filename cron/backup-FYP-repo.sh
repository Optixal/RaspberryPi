#!/bin/bash
git -C ~/Documents/github/FYP/ pull
tar zcf ~/Backups/FYP-`date +%F`.tar.gz -C ~/Documents/github/FYP .
