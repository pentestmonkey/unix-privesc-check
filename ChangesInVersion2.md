# Changes to unix-privesc-check in Version 2 #

The SVN tag "r2\_0" onwards (and trunk) contain a completely new codebase for unix-privesc-check.

It is modular and coded much more cleanly.  It contains a significant number of checks that were not present in v1 of the codebase.

# Which Version Should I Use? #

Until version 2 has been debugged and stabilised, you should probably use both versions.

Version 2 will perform some extra checks.  It is also more regularly maintained.

Version 1 contains some checks that have not been ported across.  It is more mature and stable.

# Comparison of Features #

| **UPCv1 ID** | **UPCv2 Check Name** | **Description of Check** | **Comment** |
|:-------------|:---------------------|:-------------------------|:------------|
| UPC001 | privileged\_writable, group\_writable, world\_writable (partially) | $O\_MESSAGE\_STACK The user $O\_FILE\_USER can write to $O\_FILE | we need to add to lib/misc/privileges xinetd |
| UPC002 | privileged\_writable, group\_writable, world\_writable (partially) | $O\_MESSAGE\_STACK The group $O\_FILE\_GROUP can write to $O\_FILE | we need to add to lib/misc/privileges xinetd |
| UPC003 | privileged\_writable, world\_writable and others (partially) | $O\_MESSAGE\_STACK World write is set for $O\_FILE (but sticky bit set) | we need to add to lib/misc/privileges xinetd |
| UPC004 | privileged\_writable, group\_writable, world\_writable (partially) | $O\_MESSAGE\_STACK World write is set for $O\_FILE | we need to add to lib/misc/privileges xinetd |
| UPC005 | credentials, homedirs\_executable, homedirs\_writable, jar, key\_material, system\_configuration | $O\_MESSAGE\_STACK The user $O\_FILE\_USER can read $O\_FILE |  |
| UPC006 | credentials, homedirs\_executable, homedirs\_writable, jar, key\_material, system\_configuration | $O\_MESSAGE\_STACK The group $O\_FILE\_GROUP can read $O\_FILE |  |
| UPC007 | credentials, homedirs\_executable, homedirs\_writable, jar, key\_material, system\_configuration | $O\_MESSAGE\_STACK World read is set for $O\_FILE |  |
| UPC008 | passwd\_hashes | /etc/passwd allows external authentcation |  |
| UPC009 | nis\_authentication | NIS is used for authentication on this system |  |
| UPC010 | ldap\_authentication | LDAP is used for authentication on this system |  |
| UPC011 | nis\_authentication | NIS is used for authentication on this system |  |
| UPC012 | ldap\_authentication | LDAP is used for authentication on this system |  |
| UPC013 | passwd\_hashes | There seem to be some password hashes in /etc/passwd |  |
| UPC014 | passwd\_hashes | The following accounts have no password |  |
| UPC015 | shadow\_hashes | User $USER doesn't have a password |  |
| UPC016 | shadow\_hashes | User $USER doesn't have a password |  |
| UPC017 | sudo | Sudo is configured.  Manually check nothing unsafe is allowed |  |
| UPC018 | sudo | Some users can use sudo without a password |  |
| UPC019 | postgresql\_trust | Postgres trust configured in $DIR/pg\_hba.conf $LINE |  |
| UPC020 | postgresql\_connection | Can connect to local postgres database as \"postgres\" without a password |  |
| UPC021 | postgresql\_connection | Can connect to local postgres database as \"pgsql\" without a password |  |
| UPC022 | devices\_options | This system is an NFS client.  Check for nosuid and nodev options. |  |
| UPC023 | setuid, setgid, privileged**| SetUID/SetGID shell script, may be vulnerable to race attacks**|  |
| UPC024 | credentials | Cleartext subversion passsword file $FILE |  |
| UPC025 | ssh\_agent, ssh\_key | Encrypted private SSH key found in $KEY |  |
| UPC026 | ssh\_agent, ssh\_key | Unencrypted private SSH key found in $KEY |  |
| UPC027 | credentials | Public SSH Key Found in $HOMEDIR/.ssh/authorized\_keys | We only list identified authorized\_keys file, do not parse its content |
| UPC028 | ssh\_agent | There are SSH agents running on this system |  |
| UPC030 | gpg\_agent | There are GPG agents running on this system |  |
| UPC031 | system\_nx | No NX |  |
| UPC032 | system\_nx | No NX logging |  |
| UPC033 | system\_nx | Auditing not enabled |  |
| UPC034 | system\_nx | No NX |  |
| UPC035 | system\_nx | NX set to logging only |  |
| UPC036 | system\_aslr | No ASLR |  |
| UPC037 | system\_aslr | Conservative ASLR |  |
| UPC038 | system\_mmap | mmap allows map to 0 |  |
| UPC039 | system\_selinux | SELinux does not enforce |  |
| UPC040 | privileged\_nx, system\_nx | NX not enabled |  |
| UPC041 | privileged\_ssp | SSP not enabled |  |
| UPC042 | privileged\_ssp | SSP not enabled |  |
| UPC043 | TODO | fscaps shell script, may be vulnerable to race attacks |  |

TODO: Also list in the table above any new features in UPCv2 which are absent from UPCv1.