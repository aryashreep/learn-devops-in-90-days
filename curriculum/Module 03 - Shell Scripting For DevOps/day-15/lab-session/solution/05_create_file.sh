#!/bin/bash
# create a file; && runs on success, || runs on failure

filename=$1

touch "$filename" && echo "file bann gayi: $filename" || echo "file nahi bani"
