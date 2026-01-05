---
layout: post
title: "State of the Server 2025"
date: 2026-01-05 22:06 +00:00
categories: self-hosted
tags: self-hosted state-of-server
---

Highly copied / inspired from TheOrangeOne's - [The State of the Server
posts][theorangeone-state-of-server-2026]. Here is my roundup of self hosted
items when it comes to 2025. There is a full list of services grouped together
as needed that I run in containers:

| Name               | Services                                                                             | Description                                                                                                                            |
|--------------------|--------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| Atuin              | [atuin][atuin]                                                                       | For syncing shell history and more between machines                                                                                    |
| Authentication     | [authelia][authelia]                                                                 | Currently only used for authentication with outline.                                                                                   |
| Container Updates  | [diun][diun]                                                                         | Diun is a service to help you get notified of docker image updates.                                                                    |
| Calendar           | [radicale][radicale]                                                                 | This is a *dav server that allows me to have calendars sync'ed between devices.                                                        |
| DNS                | [adguardhome][adguardhome], [adguardhome-sync][adguardhome-sync], [coredns][coredns] | For domain name resolution.                                                                                                            |
| Dashboard          | [flame][flame-dashboard]                                                             | A no-thrills dashboard that allows me to update docker-compose files to show items on the dashboard as long as the container is up.    |
| Data Syncing       | [syncthing][syncthing]                                                               | Sync your data between devices.                                                                                                        |
| Disk Health        | [scrutiny][gh-scrutiny]                                                              | Monitor your disk smart status to a dashboard.                                                                                         |
| Dynamic DNS        | [ddclient][ddclient]                                                                 | To be able to update a dynamic DNS point with the current external IP address. This might be available in your router.                 |
| Fitness            | [sparkyfitness][sparkyfitness]                                                       | For tracking fitness, currently only used to really track calories consumed, and my weight.                                            |
| Generic Monitoring | [grafana][grafana], [prometheus][prometheus]                                         | A data viewer (grafana), and a time series database (prometheus). Needs something to get data from such as node-exporter to be useful. |
| Git Server         | [gitea][gh-gitea]                                                                    | Gitea is used to mirror some repositories to have an automated backup or sorts.                                                        |
| Media Server       | [plex][plex], [tautulli][gh-tautulli]                                                | Serve your media anywhere                                                                                                              |
| Notes              | [joplin][gh-joplin]                                                                  | This is the sync server for Joplin so that I can have my notes sync between devices.                                                   |
| Notifications      | [apprise][apprise], [mailrise][mailrise], [ntfy][ntfy]                               | For sending applications to various services rather than being limited to just one.                                                    |
| Passwords          | [vaultwarden][vaultwarden]                                                           | A third party password manager that is compatible with the Bitwarden clients.                                                          |
| S3 Storage         | [garage][garage]                                                                     | S3 compatible storage                                                                                                                  |
| Save Later         | [wallabag][wallabag]                                                                 | A "read-it-later" application that also saves a copy of the web page.                                                                  |
| Smart Home         | [home-assistant][home-assistant]                                                     | Probably the de facto self hosted smart home application.                                                                              |
| Tasking            | [vikunja][vikunja]                                                                   | A todo type application for helping with keeping track of your tasks.                                                                  |
| Time               | [ntp][gh-docker-ntp]                                                                 | An NTP server so that my machines don't all need to query an external service for time.                                                |
| Wiki               | [outline][sh-outline]                                                                | Outline is used as a wiki. I may investigate different ones next year.                                                                 |

Some of these are very generic, and a lot of people use them such as plex,
vaultwarden, syncthing, gitea, etc... I'll go into parts of the setup in a
little more detail.

## DNS

There are a few services for DNS - [adguardhome][adguardhome],
[adguardhome-sync][adguardhome-sync], and [coredns][coredns]. AdGuardHome is
used as AdGuardHome is used, mainly to block adverts on the internet.
AdGuardHome-Sync is used to get two instances sync'ed together with their
settings, so I only have to update one of them. Finally you have CoreDNS, which
I use just for my own domains. The reason I don't have this as rewrites in
AdGuard is because it's easier to add more via a text file than the GUI for
AdGuard.

## Notifications

Want to use multiple notification services? Just don't want to have to change a
bit of code because you don't want to notify via discord anymore?
[Apprise][apprise]. Apprise allows you to send notifications to different
services in a more uniform way. One of the services it supports is [ntfy][ntfy],
which you can also self-host. The final one in the stack here is
[mailrise][mailrise]. This is basically so that you can send notifications that
would have been emails through to apprise instead.

## S3 Storage

This one is a sort of hot topic from this year. MinIO was the way to go here.
They removed the [admin console][minio-admin-console-removal] for the community
edition, became a [source only distribution][minio-source-only], and most
recently it went into [maintenance mode][minio-maintenance-mode]. Whilst this
does seem to be a slow death of the open source product over the course of some
time, it may not instill faith in a product going forward. It would have most
likely slightly easier to just give a date where they were going to drop the
opensource product instead of killing it over the course of 6 months or so.

At the point of the admin page going away, I looked into alternatives for S3
compatible storage, and [garage][garage] came up. Whilst this doesn't have a web
gui to use, you can use a terminal to interact with it which was the same as
minio at the time. However the removal of stuff meant I was concerned more was
going to get removed, so moved over. Garage has the extra bonus of being able to
serve web sites from it as well quite easily. Granted, it still goes via nginx
for me but the files are all stored in S3.

## The Rest

I believe the rest of them are either quite commonly known, no drama around
them, or aren't very weird in their setup and use to be explained more. Mostly
they are single purpose applications that can be used quite easily without too
many issues.

## Updates for 2026...

I believe the things in this stack that need to be updated and potentially
swapped out are:

- [flame][flame-dashboard] due to it not being updated in a couple of years.
- Reevaluate [plex][plex] vs [jellyfin][jellyfin] in terms of a stack. Some of
  the features of plex seem to be turning it into more of a social network
  rather than streaming content from a disk locally.
- Dropping [ddclient][ddclient] due to relying on [tailscale][tailscale] more
  for remote access instead of an open port.
- A migration of [seafile][seafile] from from a VM to a container.

[minio-admin-console-removal]: https://github.com/minio/object-browser/pull/3509
[minio-maintenance-mode]: https://github.com/minio/minio/commit/27742d469462e1561c776f88ca7a1f26816d69e2
[minio-source-only]: https://github.com/minio/minio/commit/9e49d5e7a648f00e26f2246f4dc28e6b07f8c84a#diff-b335630551682c19a781afebcf4d07bf978fb1f8ac04c6bf87428ed5106870f5
[atuin]: https://github.com/atuinsh/atuin
[adguardhome]: https://adguard.com/en/adguard-home/overview.html
[adguardhome-sync]: https://github.com/bakito/adguardhome-sync
[coredns]: https://coredns.io/
[ddclient]: https://ddclient.net/
[apprise]: https://github.com/caronc/apprise
[mailrise]: https://github.com/YoRyan/mailrise
[ntfy]: https://ntfy.sh/
[authelia]: https://www.authelia.com/
[diun]: https://crazymax.dev/diun/
[sparkyfitness]: https://github.com/CodeWithCJ/SparkyFitness
[flame-dashboard]: https://github.com/pawelmalak/flame
[garage]: https://garagehq.deuxfleurs.fr/
[gh-gitea]: https://github.com/go-gitea/gitea
[home-assistant]: https://www.home-assistant.io/
[gh-joplin]: https://github.com/laurent22/joplin
[gh-docker-ntp]: https://github.com/cturra/docker-ntp
[sh-outline]: https://docs.getoutline.com/s/hosting
[plex]: https://www.plex.tv/
[gh-tautulli]: https://github.com/Tautulli/Tautulli
[gh-scrutiny]: https://github.com/AnalogJ/scrutiny
[syncthing]: https://syncthing.net/
[vaultwarden]: https://github.com/dani-garcia/vaultwarden
[vikunja]: https://vikunja.io/
[wallabag]: https://github.com/wallabag/wallabag
[grafana]: https://github.com/grafana/grafana
[prometheus]: https://prometheus.io/
[radicale]: https://radicale.org/v3.html
[jellyfin]: https://jellyfin.org/
[tailscale]: https://tailscale.com/
[seafile]: https://www.seafile.com/en/home/
[theorangeone-state-of-server-2026]: https://theorangeone.net/posts/state-of-the-server-2026/
