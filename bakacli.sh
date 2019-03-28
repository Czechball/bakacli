#!/usr/bin/env bash
#Bakalari CLI
#ok epic

input=""
login="<nepřihlášen>"

xidelCheck ()
{
	if command -v xidel > /dev/null
	then
		:
	else
		printf "Xidel není instalován\n"
		printf "Můžete si ho stáhnout z http://videlibri.sourceforge.net/xidel.html#downloads\n"
		exit
	fi
}

login()
{
	printf "Login"
}

shell()
{
	while [[ $input != "exit" ]]
	do
		printf "[$login]: "
		read input
	done
}

xidelCheck
shell