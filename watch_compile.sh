#!/bin/sh
#
# Helper script to recompile any time the source chages
#

src_dir=./src/

if [ -z "$(which rebar3)" ]; then
    echo "Error: Missing rebar3" 2>&1
    echo "  Install erlang/rebar3 to continue" 2>&1
    echo "  https://github.com/erlang/rebar3" 2>&1
    exit 1
fi


if [ -z "$(which inotifywait)" ]; then
    echo "Error: Missing inotifywait" 2>&1
    echo "  Install inotify-tools to continue" 2>&1
    echo "  https://github.com/inotify-tools/inotify-tools/wiki" 2>&1
    exit 1
fi

rebar3 compile
while inotifywait -qqre modify "$src_dir"; do
    echo "Recompiling..."
    rebar3 compile
done