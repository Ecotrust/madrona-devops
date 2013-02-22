# Initial setup

```
vagrant box add madrona-11.10-amd64 madrona-11.10-amd64.box
vagrant init madrona-11.10-amd64

--OR--
Copy these files to the same directory that houses your Madrona project

```

# Settings

In Vagrantfile, if launching Madrona demo

    config.vm.boot_mode = :gui

# Running 

``vagrant up``
``fab dev init``*

*Requires you to install Fabric

## Caveats

This will try to put your stuff directly in ~/ .. if your windows machine has home as the network U: drive,

You can change this behavior by settings the ``VAGRANT_HOME`` environment variable:

    set VAGRANT_HOME=E:\projects\vagrant\.vagrant.d
    echo %VAGRANT_HOME%