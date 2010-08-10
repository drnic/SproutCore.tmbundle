#!/bin/bash
defaultProjectName="SCProject.tmproj";

fullProjectPath=$(CocoaDialog filesave \
			--text "Please name your project and select a folder to save it into" \
			--title "Create New Project" \
			--with-extensions .tmproj \
			--with-file "$defaultProjectName");

if [ -n "$fullProjectPath" ]; then

	fullProjectPath=$(tail -n1 <<<"$fullProjectPath");
	
	projectPath=`dirname "$fullProjectPath"`;
	
	#convert to snakecase which will make SC happy
	basename=`basename "$fullProjectPath" ".tmproj"`;
	projectName=`./change_case.rb snake "$basename"`;
	projectNS=`./change_case.rb camel "$projectName"`;
	
	# Gather variables to be substituted.
	TM_NEW_FILE_DIRECTORY="$projectName";
	TM_NEW_FILE_BASENAME="$projectNS";

	#create folder so I can copy Textmate project file over
	mkdir -p "$projectPath/$projectName/"
	perl -pe 's/\$\{([^}]*)\}/$ENV{$1}/g' < "Project.tmproj.xml" > "$projectPath/$projectName/$projectName.tmproj";
	
	cd "$projectPath";
	
	# generate project and default app
	sc-init "$projectName"
	
	# Open the project in TextMate.
	open -a "TextMate.app" "$projectPath/$projectName/$projectName.tmproj";
fi