Unix-privesc-checker is a script that runs on Unix systems (tested on Solaris 9, HPUX 11, Various Linuxes, FreeBSD 6.2).  It tries to find misconfigurations that could allow local unprivileged users to escalate privileges to other users or to access local apps (e.g. databases).

It is written as a single shell script so it can be easily uploaded and run (as opposed to un-tarred, compiled and installed).  It can run either as a normal user or as root (obviously it does a better job when running as root because it can read more files).

Also see: http://pentestmonkey.net/tools/unix-privesc-check/