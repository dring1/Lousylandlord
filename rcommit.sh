#!/bin/bash
# For this script to work, create an environment variable called LOUSYLANDLORD and assign it the absolute path
# of your LLL repo. For me its /Users/Frederic_Marchand/Documents/Code/Ruby on Rails/LousyLandlord
# Pass in your commit message
#

#if [ ! -n $1 ]; then
#    cd $LOUSYLANDLORD
    rm -rf tmp/
    git add -A .
    git status
    git commit -m "\"$1\""
    bundle exec rake db:migrate
    echo "Ready to Push!\n"
#fi
