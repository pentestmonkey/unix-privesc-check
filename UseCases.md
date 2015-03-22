# Use cases #

Unix-privesc-check support several use cases (`--type` switch):

<pre>
--type	select from one of the following check types:<br>
all<br>
attack_surface<br>
quick<br>
sdl<br>
test<br>
</pre>

Each `--type` causes unix-privesc-check to run one or more modules (also known as checks).

The scan types are simply directories under `lib/checks/enabled`:
<pre>
$ ls -l lib/checks/enabled/<br>
total 20<br>
drwxr-xr-x 3 root root 4096 2012-10-18 19:47 all<br>
drwxr-xr-x 3 root root 4096 2012-10-18 19:47 attack_surface<br>
drwxr-xr-x 3 root root 4096 2012-10-18 19:47 quick<br>
drwxr-xr-x 3 root root 4096 2012-10-18 19:47 sdl<br>
drwxr-xr-x 3 root root 4096 2012-10-18 19:47 test<br>
</pre>

And the contents of each directory are the modules that will be run within that scan type (symlink files to the checks under `lib/checks/`).
For example the scan type _all_ is defined as follows:
<pre>
$ ls -l lib/checks/enabled/all/<br>
total 0<br>
lrwxrwxrwx 1 root root 19 2012-10-18 19:47 binary_banned -> ../../binary_banned<br>
lrwxrwxrwx 1 root root 30 2012-10-18 19:47 binary_change_privileges -> ../../binary_change_privileges<br>
lrwxrwxrwx 1 root root 19 2012-10-18 19:47 binary_chroot -> ../../binary_chroot<br>
lrwxrwxrwx 1 root root 23 2012-10-18 19:47 binary_dependency -> ../../binary_dependency<br>
lrwxrwxrwx 1 root root 16 2012-10-18 19:47 binary_pie -> ../../binary_pie<br>
lrwxrwxrwx 1 root root 18 2012-10-18 19:47 binary_rpath -> ../../binary_rpath<br>
lrwxrwxrwx 1 root root 16 2012-10-18 19:47 binary_ssp -> ../../binary_ssp<br>
[...]<br>
</pre>

To run a particular scan type, do like this:
<pre>
$ ./upc.sh --type all<br>
</pre>

You can define your own scan types by creating a directory inside `lib/checks/enabled` and symlinking therein from `lib/checks/` each module you want to be run when you type:
<pre>
$ ./upc.sh --type <directoryname><br>
</pre>