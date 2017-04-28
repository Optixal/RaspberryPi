#!/bin/bash
find ~/Backups/* -mtime +14 -exec rm {} \;
