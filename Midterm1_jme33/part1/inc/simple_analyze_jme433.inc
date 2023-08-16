#!/bin/bash
# simple_analyze_jme433.inc

first_record=`head -1 data/apache.log | awk -F ':' '{print $1}' | awk -F '[' '{print $2}'`
last_record=`tail -1 data/apache.log | awk -F ':' '{print $1}' | awk -F '[' '{print $2}'`
record_num=`cat data/apache.log | wc -l`
uniq_ip_num=`cat data/apache.log | awk -F ' ' '{print $1}' | sort | uniq | wc -l`
request_type=`cat data/apache.log | awk -F '"' '{print $2}' | awk -F ' ' '{print $1}' | sort | uniq | tr '\n' ' '`


echo "First data: $first_record"
echo "Last data: $last_record"
echo "Number record: $record_num"
echo "Number of uniq IP: $uniq_ip_num"
echo "Request types are: $request_type"
echo
