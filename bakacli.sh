#!/usr/bin/env bash
#Bakalari CLI
#ok epic

input=""
login=""
tokenhx=""
modulpm=""
date=$(date +%Y%m%d)

dependencycheck ()
{
if ! command -v curl > /dev/null;
	then
		printf "curl není nainstalován\n"
		exit
	elif ! command -v whois > /dev/null;
	then
		printf "whois není nainstalován\n"
		exit
	elif ! command -v xidel > /dev/null;
	then
		printf "Xidel není inanstalován\n"
		exit
	else
		:
fi
}

getloginurl()
{
	printf "Zadejte URL Bakalářů vaší školy, např. bakalari.uzlabina.cz/login.aspx"
	read loginUrl
	if [[ loginurl =~ "" ]]
	then
		loginUrl="https://bakalari.uzlabina.cz/login.aspx"
	else
		:
	fi
}
getlogin()
{
	
	echo
	printf "Zadejte svůj login:"
	read login
	if [[ $login == "" ]]
		then
			getlogin
		else
			restyp=$(xidel -s $loginUrl?gethx=$login -e results/typ)
			resikod=$(xidel -s $loginUrl?gethx=$login -e results/ikod)
			ressalt=$(xidel -s $loginUrl?gethx=$login -e results/salt)
	fi
}

makeToken()
{
	tokenhx=$(TODO)
}

shell()
{
	while [[ $input != "exit" ]];
	do
		printf "[$login]: "
		read input
		if [[ $input == date ]];
		then
			printf "Datum ve formátu DATE je $date\n"
		elif [[ $input == debug ]];
			then
				printf "Typ: $restyp Kód: $resikod Sůl: $ressalt\n"
				printf "login: $login URL: $loginUrl\n"
		fi
	done
}

dependencycheck
getloginurl
getlogin
shell