#!/bin/bash

avg_request_size=``
code_200=`cat data/apache.log | awk -F ' ' '{print $9}' | grep 200 | wc -l`
code_206=`cat data/apache.log | awk -F ' ' '{print $9}' | grep 206 | wc -l`
code_301=`cat data/apache.log | awk -F ' ' '{print $9}' | grep 301 | wc -l`
code_302=`cat data/apache.log | awk -F ' ' '{print $9}' | grep 302 | wc -l`
code_304=`cat data/apache.log | awk -F ' ' '{print $9}' | grep 304 | wc -l`
code_403=`cat data/apache.log | awk -F ' ' '{print $9}' | grep 403 | wc -l`
code_404=`cat data/apache.log | awk -F ' ' '{print $9}' | grep 404 | wc -l`
code_409=`cat data/apache.log | awk -F ' ' '{print $9}' | grep 499 | wc -l`
code_502=`cat data/apache.log | awk -F ' ' '{print $9}' | grep 502 | wc -l`

echo "Average request size: "
echo "Response codes sent are: "
echo "          Code 200 was sent $code_200 times"
echo "          Code 206 was sent $code_206 times"
echo "          Code 301 was sent $code_301 times"
echo "          Code 302 was sent $code_302 times"
echo "          Code 304 was sent $code_304 times"
echo "          Code 403 was sent $code_403 times"
echo "          Code 404 was sent $code_404 times"
echo "          Code 499 was sent $code_409 times"
echo "          Code 502 was sent $code_502 times"
