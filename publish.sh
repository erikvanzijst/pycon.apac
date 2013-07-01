#!/usr/bin/env sh

DEPLOY_DIR=`mktemp -d -t djangocon-XXXXXX`

echo "Cloning evzijst.bitbucket.org into $DEPLOY_DIR..."
( cd $DEPLOY_DIR && git clone git@bitbucket.org:evzijst/evzijst.bitbucket.org.git evzijst )

echo "Merging content into site repo..."
rsync -r --delete slides/* $DEPLOY_DIR/evzijst/pycon.au/

( cd $DEPLOY_DIR/evzijst && \
    git add --all && \
    git commit -m "Site update" &&
    echo "Pushing site..." &&
    git push )

rm -rf $DEPLOY_DIR
