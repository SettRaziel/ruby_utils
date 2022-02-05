#!/bin/bash
# @Author: Benjamin Held
# @Date:   2015-08-30 09:48:37
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2019-03-26 17:32:15

yardoc -q './lib/**/*.rb' --private --readme README.md
printf "Looking for undocumented passages: \n"
yard stats './lib/**/*.rb' --list-undoc
