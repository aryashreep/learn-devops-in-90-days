#!/bin/bash
# install a package passed as argument

package=$1

sudo apt-get update && sudo apt-get install -y "$package"
echo "$package install ho gaya"
