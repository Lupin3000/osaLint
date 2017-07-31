#!/usr/bin/osascript

-- define global variables
global appName
global imageName

-- set magic values
set appName to "Docker"
set imageName to "alpine/shellcheck "

-- run docker linters
on LintShell(macPath)
	set posixPath to quoted form of POSIX path of macPath
	set fileName to do shell script "basename " & posixPath
	set dirName to do shell script "dirname " & posixPath
	set shellCmd to "docker run --rm -i -v " & dirName & ":/mnt " & imageName & fileName

	tell application "Terminal"
		set shell to do script shellCmd in front window
	end tell
end LintShell

-- display select box
on SelectFile()
	set dlTitle to "Nothing selected..."
	set dlMsg to "Process is terminated."

	try
		set macPath to choose file
	on error
		display dialog dlMsg buttons ["OK"] with title dlTitle
		return dlMsg
	end try

	LintShell(macPath)
end SelectFile

-- start Docker
on StartDocker()
	set dlTitle to "Docker cannot started"
	set dlMsg to "Something went wrong, could not start Docker!"

	try
		tell application appName
			activate
		end tell
	on error
		display dialog dlMsg buttons ["OK"] with title dlTitle
	end try
end StartDocker

-- check if Docker is running
on RunScript()
	set dlTitle to "Docker not running"
	set dlMsg to "Should Docker started?"

	if application appName is running then
		SelectFile()
	else
		display dialog dlMsg buttons ["OK", "No"] with title dlTitle
		if button returned of result is "OK" then
			StartDocker()
		end if
	end if
end RunScript

RunScript()
