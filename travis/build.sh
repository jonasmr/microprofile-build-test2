#!/bin/bash
set -ev
pushd demo/noui && make clean && make && popd
pushd demo/noui_c && make clean && make && popd
pushd demo/noframes && make clean && make && popd
