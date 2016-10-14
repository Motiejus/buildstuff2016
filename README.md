Abstract
========

Title: Understanding and building your own Docker

Abstract: Docker started small and got big in really short time. Believe it or
not, you can learn to build your version of it too, within the duration of a
conference talk!

In the talk, we will assemble and run a Docker-like container with only
standard command-line tools found in modern Linux distributions.

First half of the presentation will cover the facilities Linux provides for
Docker to build upon: cgroups, pid and network namespaces, overlay file
systems. During the second half we will put theory to practice in a terminal
session. At the end of the talk we will not only be armed with knowledge how to
build an isolated container, but also have an actual container running.

After the talk, you will have a good insight how Docker works, and understand
how you could use its building blocks to build something that perfectly matches
your environment.

You’ll get most out of this session if you are comfortable in Linux terminal,
for instance, configuring networking from command-line. Knowledge about Pid
namespaces, cgroups or overlay filesystems is not required. You will learn it
all that during the talk.

Demo
====

    CID=$(docker run -d debian true)
    docker export $CID | sudo tar -C /tank/images/debian -xfv -
    zfs snapshot tank/images/debian@latest
    zfs list -t all
    zfs clone tank/images/debian@latest tank/containers/t1

    # Get brand-new namespaces (but no chroot):
    unshare --map-root-user --mount --net --pid --mount-proc --fork bash

Links
=====

* https://github.com/kelseyhightower/talks/tree/master/devops-networking-forum-2016/demo#network-namespaces-in-action
* http://www.slideshare.net/jpetazzo/anatomy-of-a-container-namespaces-cgroups-some-filesystem-magic-linuxcon
* https://youtu.be/sK5i-N34im8?t=2559
* https://docs.docker.com/engine/userguide/storagedriver/zfs-driver/
