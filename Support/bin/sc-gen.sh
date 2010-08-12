#!/bin/bash
. "$TM_SUPPORT_PATH/lib/bash_init.sh"

template="$1";
capTemplate=`echo $template | tr [A-Z] [a-z] | awk '{print toupper(substr($0,1,1))substr($0,2);}'`;

defaultName="$2";

name=$(CocoaDialog standard-inputbox \
			--title "New $capTemplate" \
			--text "$defaultName" \
			--informative-text "Enter new $1 name:");
			
[[ $(head -n1 <<<"$name") == "2" ]] && exit_discard

if [ "$name" != "2" ]; then
	name=$(tail -n1 <<<"$name");
	sc-gen $1 $name | pre;
	rescan_project;
fi