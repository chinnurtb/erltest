#!/bin/sh
cd `dirname $0`
echo $PWD
exec erl -pa $PWD/ebin $PWD/deps/*/ebin -boot start_sasl -s reloader -s mywebdemo
