#!/usr/bin/env bash
# host_oracle.sh <Test> - run an iotest natively with GHC and print its stdout.
# The MicroHs library modules a test imports (MicroHs.Lex, .Parse, .Abstract, ...)
# are ordinary Haskell and build under GHC the same way bin/gmhs does; only the
# MicroHs-only modules that have no GHC package equivalent are reached through
# funboot/oracle.  What comes out is what the program MEANS, independent of the
# fun machine -- which is what an EXPECT header should hold.
set -euo pipefail
HERE=/home/cecil/work/lambdalinux/MicroHs
cd "$HERE"
EXTS="-XScopedTypeVariables -XRankNTypes -XTupleSections -XFlexibleInstances -XFlexibleContexts -XMultiParamTypeClasses -XLambdaCase -XTypeSynonymInstances -XPatternGuards"
PKGS="-package mtl -package pretty -package haskeline -package process -package time -package ghc-prim -package containers -package deepseq -package directory -package text -package filepath"
O=funboot/oracle/build
mkdir -p "$O"
ghc $EXTS -ighc -isrc -ipaths -ifunboot/oracle -ifunboot/iotests $PKGS \
    -w -outputdir "$O" -o "$O/$1" -main-is "$1" "funboot/iotests/$1.hs" -v0 2>&1 | head -20
"$O/$1"
