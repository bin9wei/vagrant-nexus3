# vagrant-nexus3
A vagrant box (CentOS 7) to install Nexus 3

## How to use

	# Clone it locally:
	$ git clone git@github.com:bin9wei/vagrant-nexus3.git

    # Download [nexus-3.39.0-01-unix.tar.gz](https://sonatype-download.global.ssl.fastly.net/repository/downloads-prod-group/3/nexus-3.39.0-01-unix.tar.gz%20and%20place%20it%20in%20/vagrant-nexus3) and place it under /vagrant-nexus3

    # Bring up virtual box
	$ cd /vagrant-nexus3
    $ vagrant up
	
	# Open [http://localhost:18081/](http://localhost:18081/)

    # ssh to virtual box
    $ vagrant ssh

    # Shut down virtual box
    $ vagrant halt