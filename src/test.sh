#!/bin/bash

#src/test.sh
EXPECTED="Hello, Test!"

NODE_CMD="node"
if ! command -v node >/dev/null 2>&1 && command -v node.exe >/dev/null 2>&1; then
    NODE_CMD="node.exe"
fi

OUTPUT=$($NODE_CMD -e "console.log(require('./src/app')('Test'))" | tr -d '\r')

if [ "$OUTPUT" == "$EXPECTED" ]; then
    echo "Test Passed!"
    exit 0
else 
    echo "Test Failed! Expected '$EXPECTED' but got '$OUTPUT'"
    exit 1
fi 