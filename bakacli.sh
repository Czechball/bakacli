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
	if command -v xidel > /dev/null
	then
		:
	else
		printf "Xidel není instalován\n"
		printf "Můžete si ho stáhnout z http://videlibri.sourceforge.net/xidel.html#downloads\n"
	fi
	if command -v curl > /dev/null
	then
		:
	else
		printf "Curl není nainstalován.\n"
	fi
	if command -v mkpasswd > /dev/null
	then
		:
	else
		printf "Příkaz mkpasswd nenalezen. Prosím instalujte whois.\n"
	fi
	if [[ failed == 1 ]]
	then
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