#!/bin/bash

# USAGE: digparser.sh DOMAIN
# EXAMPLE: digparser.sh www.tstmedia.com

# assumes output in the following layout
# $ ./digparser.sh tstmedia.com
# 
# ; <<>> DiG 9.7.3-P3 <<>> tstmedia.com
# ;; global options: +cmd
# ;; Got answer:
# ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 41661
# ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0
# 
# ;; QUESTION SECTION:
# ;tstmedia.com.			IN	A
# 
# ;; ANSWER SECTION:
# tstmedia.com.		882	IN	A	107.20.200.187
# 
# ;; Query time: 37 msec
# ;; SERVER: 75.75.75.75#53(75.75.75.75)
# ;; WHEN: Mon Jul  2 20:19:16 2012
# ;; MSG SIZE  rcvd: 46

main() {
  perform_dig $* | find_answers | find_end_of_answers | trim_non_answers | parse_dig_lines
}

perform_dig() {
  dig $*
}

find_answers() {
  # answer section begins with:
  # ;; ANSWER SECTION:
  grep -A10 "ANSWER SECTION"
}

find_end_of_answers() {
  # next section after answers begins with the query times, e.g.:
  # ;; Query time: 45 msec
  grep -B10 ";; Query"
}

trim_non_answers() {
  # non-answers begin with ';;', also eliminate blank lines
  grep -v ';;' | grep -v -E '^$'
}

parse_dig_lines() {
  while read line; do
    use_dig_line $line
  done
}

use_dig_line() {
  # line comes looking like one of the following, tab-delimited:
  # www.tstmedia.com.	2080	IN	CNAME	tstmedia.com.
  # tstmedia.com.		292	IN	A	107.20.200.187
  line=$*
  domain=$1
  ttl=$2 # dunno how useful it is, but it appears to be the ttl in seconds
  ignore=$3 # pretty sure this is useless. always appears to be "IN"
  record_type=$4 # A, CNAME, etc.
  value=$5

  # and then do whatever you want with those values
  echo ---------
  echo domain $domain
  echo record_type $record_type
  echo value $value
}

main $*

