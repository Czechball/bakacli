#!/usr/bin/env bash
#Bakalari CLI
#ok epic

input=""
login="<nepřihlášen>"

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


shell