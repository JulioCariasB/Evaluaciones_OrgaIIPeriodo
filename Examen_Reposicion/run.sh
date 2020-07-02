#!/bin/bash

FILES="start.S console.S merge_sort.S"
EASY_ASM="./tools/EasyASM"

$EASY_ASM --run $FILES
