#!/usr/bin/env bash

set -e

readonly PROGNAME=$(basename $0)
readonly PROGDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly ARGS="$@"

cd -- "$(dirname "$BASH_SOURCE")"

git fetch --all
git checkout stage
git push
git checkout master
git merge stage
git push
git checkout stage