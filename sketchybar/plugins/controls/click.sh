#!/bin/bash
export RELPATH=$(dirname $0)/../..
command -v 'menubar' 2>/dev/null 1>&2 || alias menubar="$RELPATH/menubar"

### Activate the correpsonding menubar item

menubar -s "$NAME"
