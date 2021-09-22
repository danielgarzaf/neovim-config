#!/usr/bin/env bash
read -p "Commit Message: " msg
git add .
git commit -m "`echo $msg`"
git push
