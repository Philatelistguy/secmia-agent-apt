#!/bin/bash
set -e

DIST_DIR=dists/stable

# Generate Release file
apt-ftparchive release $DIST_DIR > $DIST_DIR/Release

# Sign with your GPG key
gpg --default-key "Secmia Apt Signing" -abs -o $DIST_DIR/Release.gpg $DIST_DIR/Release
gpg --default-key "Secmia Apt Signing" --clearsign -o $DIST_DIR/InRelease $DIST_DIR/Release
