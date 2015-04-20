# IOSR - Sahara API test

To set up the environment run 
$ ./setup-venv.sh
it should set up the venv and install required modules, which give CLI access
to OpenStack module APIs.

In order to activate the venv run
$ source os/bin/activate
then
$ source student-openrc.sh
which will set up the needed credentials. 
You will be prompted to enter password.

Then, it will be possible to use command line commands like glance, sahara etc.
in order to communicate with the OpenStack installation.

There is en exemplary workflow in example.sh.
