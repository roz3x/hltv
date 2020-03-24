#!/bin/bash

echo $( curl -X GET https ://www.hltv/org/matches?event=$( curl -X GET https://www.hltv.org 2>/dev/null | grep 'a href="/matches?event=' | grep -oP '\d\d+' | cut -d$'\n' -f1 ) 2>/dev/null | tr -d '\n' | sed 's/\s//g' | grep -oP 'live-matches.*section-spacer' | sed 's/\s//g' | grep -oP '<spanclass="team-name">(\w)*</span>' | cut -d'>' -f2 | cut -d'<' -f1 | awk 'NR==1{print $1 " Vs " } NR==2 {print $1}' || echo 'some error occured'
