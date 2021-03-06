#!/bin/bash

set -ex

echo "Installing Powerlang / Open Bee-DMR"

powerlang_repo=https://github.com/powerlang/powerlang
powerlang_branch=master

bee_dmr_repo=https://github.com/powerlang/bee-dmr
bee_dmr_branch=master

git clone --branch "${powerlang_branch}" "${powerlang_repo}" powerlang
mkdir -p powerlang/bootstrap/specs/bee-dmr
git clone --branch "${bee_dmr_branch}"   "${bee_dmr_repo}"   powerlang/bootstrap/specs/bee-dmr
echo "bee-dmr" > powerlang/bootstrap/specs/current

make -C powerlang
