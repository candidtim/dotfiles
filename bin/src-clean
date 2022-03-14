#!/bin/bash

if [ "$1" != "--yes" ]; then
  echo "Deletes all build and artifact directories under ~/src"
  echo "Usage: ,src-clean.sh --yes"
  exit 0
fi

find ~/src -type d -name "node_modules" -exec rm -rf {} \;
find ~/src -type d -name "target" -exec rm -rf {} \;
find ~/src -type d -name "build" -exec rm -rf {} \;
find ~/src -type d -name "venv" -exec rm -rf {} \;
