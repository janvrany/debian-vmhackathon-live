#!/bin/bash

set -ex

echo "Installing Powerlang / Open Bee-DMR"

powerlang_repo=https://github.com/janvrany/powerlang
powerlang_branch=jv/wip/debug-support

bee_dmr_repo=https://github.com/janvrany/bee-dmr
bee_dmr_branch=jv/wip/debug-support

git clone --branch "${powerlang_branch}" "${powerlang_repo}" powerlang
mkdir -p powerlang/bootstrap/specs/bee-dmr
git clone --branch "${bee_dmr_branch}"   "${bee_dmr_repo}"   powerlang/bootstrap/specs/bee-dmr
echo "bee-dmr" > powerlang/bootstrap/specs/current

make -C powerlang