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

# TODO tidy up config names a little
filecachefilename="files_cache.tmp"
filecacherootpath="/"

usage() {
        printf "usage: ${0}\n"
	printf "Identifies potential privilege escalation paths.\n"
	printf "\n"
	printf "\t--help\tdisplay this help and exit\n"
	printf "\t--type\tselect from one of the following check types:\n"
	for checktype in lib/checks/enabled/*
	do
		printf "\t\t`basename ${checktype}`\n"
	done
        exit 1
}

CHECKTYPE="all"
while [ -n "${1}" ]
do
	case "${1}" in
		"--help")
			usage
			;;
		"--type")
			shift
			CHECKTYPE="${1}"
			;;
	esac
	shift
done

for checkfilename in lib/checks/enabled/${CHECKTYPE}/*
do
	. "${checkfilename}"
	`basename "${checkfilename}"`_init
	`basename "${checkfilename}"`_main
	`basename "${checkfilename}"`_fini
done
exit 0
