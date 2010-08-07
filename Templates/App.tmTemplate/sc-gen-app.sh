#!/bin/bash
if [[ "$TM_DIRECTORY" == "" ]]; then
	fullProjectPath=$(CocoaDialog filesave \
		--text "Please name your app and select a Sproutcore project folder to save it into" \
		--title "Create new Sproutcore app");
else
	fullProjectPath="$TM_NEW_FILE"
fi

echo "$fullProjectPath" >> "log.txt"

# 
if [ -n "$fullProjectPath" ]; then
	fullProjectPath=$(tail -n1 <<<"$fullProjectPath");
	projectName=`basename "$fullProjectPath"`;
	projectPath=`dirname "$fullProjectPath"`;
	
	# Gather variables to be substituted.
	TM_NEW_FILE_BASENAME="$projectName";
	
	#create folder so I can copy Textmate project file over	
	cd "$projectPath";
	
	# generate project and default app
	sc-gen app "$projectName"
	
	# Open the project in TextMate.
	# open -a "TextMate.app" "$projectPath/apps/$projectName/core.js";
fi