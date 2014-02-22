SGMP-Patient-Data-Tracker
=========================

Personal project to help track who/where patient data has gone to.

Development
-----------

In order to get a working development environment you'll need to:

1. Install [`vagrant`](http://www.vagrantup.com/)
2. Clone the repo, `cd` in and run `vagrant up`. The first time will take a while as it downloads all the packages.

```
git clone https://github.com/Dawil/SGMP-Patient-Data-Tracker.git
cd SGMP-Patient-Data-Tracker && vagrant up
```

You can now ssh into the machine with `vagrant ssh`. The code for this repo will be located in the shared folder `/vagrant` on the virtual machine.

### Vagrant Guest Versions

You may find that the vagrant version of your guest is different to that of your host. This may not be a problem but if you find that you're experiencing shared folder issues such as calls to `ls` are blocking then you may need to synchronize the versions. The [`vbguest`](https://github.com/dotless-de/vagrant-vbguest) plugin can do this for you. Just run:

> vagrant plugin install vagrant-vbguest

on your host machine and run `vagrant reload`.
