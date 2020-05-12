#!/bin/bash
BINDIR=$(dirname "$(readlink -fn "$0")")
cd "$BINDIR"
mv -ft disabled {basevotes,funcommands,funvotes,nextmap,playercommands,sounds}.smx
