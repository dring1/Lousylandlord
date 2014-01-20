#!/bin/bash
# Call this script from the root directory of the project
# Pass in your commit message
# Example: ./rcommit.sh "Commit message"

echo "rm -rf tmp/"
rm -rf tmp/
echo "git add -A ."
git add -A .
echo "git status"
git status
echo "git commit -m \"$1\""
git commit -m "$1"
echo "bundle exec rake db:migrate"
bundle exec rake db:migrate
echo "Ready to Push!\n"
