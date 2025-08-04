---
layout:     post
title:      "Updating MoTD in Ubuntu"
date:       2025-08-04 19:58:00 +00:00
categories: linux ubuntu
tags:       linux ubuntu motd
---

This is a small post on cleaning up the motd when you first login to a ubuntu
box. You may see a message with grouping like this:

```shell
user@host:~$ ssh remote-host
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.15.0-1066-oracle x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sat Aug  3 18:44:04 UTC 2025

  System load:  0.0                Processes:             122
  Usage of /:   19.6% of 44.96GB   Users logged in:       0
  Memory usage: 49%                IPv4 address for ens3: 10.0.0.63
  Swap usage:   0%

 * Strictly confined Kubernetes makes edge and IoT secure. Learn how MicroK8s
   just raised the bar for easy, resilient and secure K8s cluster deployment.

   https://ubuntu.com/engage/secure-kubernetes-at-the-edge

Expanded Security Maintenance for Applications is not enabled.

7 updates can be applied immediately.
To see these additional updates run: apt list --upgradable

4 additional security updates can be applied with ESM Apps.
Learn more about enabling ESM Apps service at https://ubuntu.com/esm


Last login: Thu Jul  3 21:13:14 2025 from 127.0.0.1
```

This is somewhat annoying, more so the "advert" for the kubernetes part, and the
help for the documentation once you are more familiar with using and
administrating Ubuntu.

## Removing the Help Links

This is just to remove a file, since it isn't configurable. The potential here
is the remove the file via something like ansible so if the file returns, it is
easier to redo rather than having to do it from scratch. It could also be
configured if extra files appear that do the same thing.

```shell
sudo rm -v /etc/update-motd.d/10-help-text
```

## Removing the "News"

This is called news, but this is the removal of the "Strictly confined
Kubernetes..." stuff.

1. Run `sudo nano /etc/default/motd-news`
1. Change `ENABLED=1` to `ENABLED=0`
1. Save and exit nano (Ctrl + o, Ctrl + x)

## Removing the Updates from ESM Notice

ESM is an extended support thing, unless you are signed up to Ubuntu Pro (free
for 5 devices), then this should just be removed. This is done via creating an
empty file, and forcing a temporary file to get updated.

```shell
sudo touch /var/lib/update-notifier/hide-esm-in-motd
sudo /usr/lib/update-notifier/update-motd-updates-available --force
```

If you wish to check what this will now look like, you can run the below:

```shell
sudo /etc/update-motd.d/90-updates-available
```

## Removing fwupdmgr Notice

On different machines you may have seen notices like this when connecting as
well:

```text
1 device has a firmware upgrade available.
Run `fwupdmgr get-upgrades` for more information.
```

In order to remove these you'll need to do the following:

1. Edit `/etc/fwupd/daemon.conf` and change the value `UpdateMotd=true` to
   `UpdateMotd=false` .
2. Run `sudo systemctl restart fwupd`.
3. Run `rm -vf /run/motd.d/85-fwupd` to remove the current message.

## Outcome

These few steps will now shorten the output to:

```shell
user@host:~$ ssh remote-host
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.15.0-1066-oracle x86_64)

 System information as of Sat Aug  3 18:56:46 UTC 2025

  System load:  0.05               Processes:             123
  Usage of /:   19.6% of 44.96GB   Users logged in:       0
  Memory usage: 52%                IPv4 address for ens3: 10.0.0.63
  Swap usage:   0%

7 updates can be applied immediately.
To see these additional updates run: apt list --upgradable

New release '22.04.3 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Last login: Sat Aug  3 18:44:04 2025 from 127.0.0.1
```

You can still cleanup more files in `/etc/update-motd.d` to get rid of some more
information, as well as changing some of the other output as you want.
