---
layout: post
title: "Assassin's Creed Odyssey - 0x20900000"
date: 2026-07-27 20:14 +00:00
categories: games
tags: gaming assassins-creed
---

When playing through Assassin's Creed Odyssey, when trying some of the online
stuff, I ran into the follow Online Service Error.

![Screenshot of Error Code](./assets/images/posts/2026/9e411231aaa228a9d8dfbb0489161686.jpg)
_Online Service Error - 0x20900000_

In order to resolve this issue, I had to allow the following domain Adguard Home
as it was blocked by a different rule coming from the `AdGuard DNS filter`.

`ubiservices.data.ubi.com`.

Once the above domain was allowed, this then allowed the Online Service part of
the game to work as intended.

To allow the domain through in AdGuard home, you login to the web interface, and
then do the following:

* Open the menu `Filters` -> `Custom filtering rules`
* Into the box with all the rules, add `@@||ubiservices.data.ubi.com^`
* Click `Apply`
