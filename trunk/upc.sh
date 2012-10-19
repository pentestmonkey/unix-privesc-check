#!/bin/sh
# $Revision$
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#
# (c) Tim Brown, 2012
# <mailto:timb@nth-dimension.org.uk>
# <http://www.nth-dimension.org.uk/> / <http://www.machine.org.uk/>

. lib/misc/stdio

header() {
	printf "unix-privesc-check version 2.1-dev (rev $Revision$)\n"
	printf "Shell script to check for simple privilege escalation vectors on Unix systems.\n"
	printf "\n"
}

version() {
	header
	printf "http://code.google.com/p/unix-privesc-check/\n\n"
	printf "brought to you by:\n"
	cat docs/AUTHORS
	exit 1
}

usage() {
	header
	printf "Usage: ${0}\n"
	printf "\n"
	printf "\t--help\tdisplay this help and exit\n"
	printf "\t--version\tdisplay version and exit\n"
	printf "\t--type\tselect from one of the following check types:\n"
	for checktype in lib/checks/enabled/*
	do
		printf "\t\t`basename ${checktype}`\n"
	done
	printf "\t--check\tprovide a comma separated list of checks to run, select from the following checks:\n"
	for check in lib/checks/*
	do
		if [ "`basename \"${check}\"`" != "enabled" ]
		then
			printf "\t\t`basename ${check}`\n"
		fi
	done
	exit 1
}

CHECKS=""
CHECKTYPE="all"
while [ -n "${1}" ]
do
	case "${1}" in
		--help|-h)
			usage
			;;
		--version|-v|-V)
			version
			;;
		--type|-t)
			shift
			CHECKTYPE="${1}"
			;;
		--check|-c)
			shift
			CHECKS="${1}"
			;;
	esac
	shift
done

if [ -n "${CHECKS}" ]
then
	for checkfilename in `printf "${CHECKS}" | tr -d " " | tr "," " "`
	do
		if [ ! -e "lib/checks/${checkfilename}" ]
		then
			stdio_message_error "upc" "the provided check name '${checkfilename}' does not exist"
		else
			. "lib/checks/${checkfilename}"
			`basename "${checkfilename}"`_init
			`basename "${checkfilename}"`_main
			`basename "${checkfilename}"`_fini
		fi
	done
else
	if [ ! -d "lib/checks/enabled/${CHECKTYPE}" ]
	then
		stdio_message_error "upc" "the provided check type '${CHECKTYPE}' does not exist"
	else
		for checkfilename in lib/checks/enabled/${CHECKTYPE}/*
		do
			. "${checkfilename}"
			`basename "${checkfilename}"`_init
			`basename "${checkfilename}"`_main
			`basename "${checkfilename}"`_fini
		done
	fi
fi
exit 0
