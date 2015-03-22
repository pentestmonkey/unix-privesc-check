# Checks performed by unix-privesc-check #

The security checks are performed by "modules" in the following directory:

<pre>
# ls -l lib/checks/<br>
total 96<br>
-rwxr-xr-x 1 root root 1738 2012-10-18 22:12 binary_banned<br>
-rwxr-xr-x 1 root root 1867 2012-10-18 19:47 binary_change_privileges<br>
-rwxr-xr-x 1 root root 1608 2012-10-18 19:47 binary_chroot<br>
-rwxr-xr-x 1 root root 2725 2012-10-18 22:17 binary_dependency<br>
-rwxr-xr-x 1 root root 1488 2012-10-18 19:47 binary_path<br>
-rwxr-xr-x 1 root root 1458 2012-10-18 19:47 binary_pie<br>
-rwxr-xr-x 1 root root 1482 2012-10-18 19:47 binary_random<br>
-rwxr-xr-x 1 root root 3086 2012-10-18 19:47 binary_rpath<br>
-rwxr-xr-x 1 root root 1402 2012-10-18 19:47 binary_ssp<br>
-rwxr-xr-x 1 root root 1697 2012-10-18 19:47 binary_tmp<br>
-rwxr-xr-x 1 root root 2582 2012-10-18 19:47 credentials<br>
drwxr-xr-x 8 root root 4096 2012-10-18 19:47 enabled<br>
-rwxr-xr-x 1 root root 1275 2012-10-18 19:47 gpg_agent<br>
-rwxr-xr-x 1 root root 2101 2012-10-18 19:47 group_writable<br>
-rwxr-xr-x 1 root root 1373 2012-10-18 19:47 jar<br>
-rwxr-xr-x 1 root root 1565 2012-10-18 19:47 key_material<br>
-rwxr-xr-x 1 root root 1697 2012-10-18 19:47 passwd_hashes<br>
-rwxr-xr-x 1 root root 1387 2012-10-18 19:47 setgid<br>
-rwxr-xr-x 1 root root 1387 2012-10-18 19:47 setuid<br>
-rwxr-xr-x 1 root root 1302 2012-10-18 19:47 shadow_hashes<br>
-rwxr-xr-x 1 root root 1562 2012-10-18 19:47 ssh_agent<br>
-rwxr-xr-x 1 root root 1725 2012-10-18 19:47 ssh_key_unencrypted<br>
-rwxr-xr-x 1 root root 2788 2012-10-18 19:47 system_libraries<br>
-rwxr-xr-x 1 root root 1916 2012-10-18 19:47 world_writable<br>
</pre>

## binary\_banned ##

Check if privileged programs (e.g. SetUID, those run as root) call banned (and potentially dangerous) functions.  Based on Microsoft's banned API list as parsed by tools/generate\_banned.sh.

## binary\_change\_privileges ##

Check if privileged programs (e.g. SetUID, those run as root) drop their privileges.

Based on ideas found at http://people.redhat.com/sgrubb/security/

## binary\_chroot ##

Check if privileged programs (e.g. SetUID, those run as root) calling chroot() function call also chdir() function.

Based on ideas found at http://people.redhat.com/sgrubb/security/

## binary\_dependency ##

Check for excessive permissions over privileged files and processes' linked libraries.

## binary\_path ##

Check if privileged files set PATH variable.

Based on ideas found at http://people.redhat.com/sgrubb/security/

## binary\_pie ##

Check for PIE (ASLR-compliant executable) support.

Based on ideas found at http://people.redhat.com/sgrubb/security/

## binary\_random ##

Based on Microsoft's random API list as parsed by tools/generate\_random.sh

## binary\_rpath ##

Checks in binaries have insecure writeable/relative RPATH.

## binary\_ssp ##

Check for stack canary (SSP) support.

## binary\_tmp ##

Check if privileged files call temporary files handling functions.

Based on ideas found at http://people.redhat.com/sgrubb/security/

## credentials ##

Check for read permissions on sensitive files.

## gpg\_agent ##

Check if the gpg-agent is running

## group\_writable ##

List group-writable files

## jar ##

List all jar files

## key\_material ##

List potentially sensitive files

## passwd\_hashes ##

List users with no password set or password in /etc/passwd

## setgid ##

List setgid files.

## setuid ##

List setuid files.

## shadow\_hashes ##

List users with no password set.

## ssh\_agent ##

Check if the ssh-agent is running and list SSH unencrypted keys.

## ssh\_key\_unencrypted ##

List unencrypted SSH client private keys.

## system\_libraries ##

List group-writable and world-writable system libraries and their parent directories.

## world\_writable ##

List world-writable files