#!/bin/bash
# source another script to reuse its functions

source ./14_function_with_args.sh

echo "---"
echo "Ab dusre script se function call kar rahe hain:"
greet "popatlal"
install_package "docker"
