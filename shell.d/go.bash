#!/bin/bash

# autodetect go path, if go binary is available
if command -v go 1>/dev/null 2>&1; then
    PATH=$PATH:$(go env GOPATH)/bin
    export PATH
    # go list formatted, example usage: <command> github.com/vmware/govmomi
    alias go-importPath="go list -f '{{ .ImportPath }}' "
    alias go-deps="go list -f '{{ .Deps }}' "
    alias go-files="go list -f '{{ .GoFiles }}' "
    alias go-imports="go list -f '{{ join .Imports \"\\n\" }}'"
fi
