#!/bin/bash
git -C ~/Documents/FYP/ pull
tar zcf ~/Backups/FYP-`date +%F`.tar.gz -C ~/Documents/FYP .
