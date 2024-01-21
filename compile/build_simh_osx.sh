#!/usr/bin/env bash
# 
# upgrade simh simulations
# and put in ~/bin
#
#   instead reference project directory in commands
set -euf -o pipefail

declare -r PROJECT_DIR="${HOME}/Documents/code/simh.nosync/simh"
declare -rx LDFLAGS="-L/opt/homebrew/opt/libedit/lib"
declare -rx CPPFLAGS="-I/opt/homebrew/opt/libedit/include"
declare -rx CMAKE_BUILD_PARALLEL_LEVEL=6

# update project
cd "$PROJECT_DIR"
git fetch
if [ "$(git rev-parse HEAD)" == "$(git rev-parse @"{u}")" ]; then
  echo "project not updated, nothing to do"
  cd -
  exit 0
fi

# install dependencies
.travis/deps.sh osx
# zlib is a dependecy not in deps.sh
brew install zlib

# build
cmake/cmake-builder.sh

# copy simulator executables
# note that if a simulator is removed or renamed in simh
# then the old executable is preserved
cp -R BIN/* "$HOME/bin"
