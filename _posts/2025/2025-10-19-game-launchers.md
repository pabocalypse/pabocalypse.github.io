---
layout: post
title: "Game Launchers - Proliferate"
date: 2025-10-19 09:37 +00:00
categories: gaming tools
tags: gaming tools
---

The number of game launchers there are for Windows makes for a problem once we
start to use more than one for any reason. Sometimes just remembering where your
games are can be a hassle if they all aren't in [Steam][steam]. The list I use
include:

* [Steam][steam] -> For the majority of my games.
* [GOG][gog]-> For games made by CDProjekt Red, as they come DRM free.
* [Epic Launcher][epic-games] -> For the free games that they give away every
  week, plus for Rocket League when I played that.
* [Ubisoft Connect][ubisoft] -> Needed for Ubisoft games even when purchased via
  Steam.
* [Origin / EA App][ea-app] -> For games published by EA, from a time where that
  was required.

> __Note:__ For Epic games, I use a third party launcher called
> [Legendary][legendary] in this setup. It has done its job, and allows me to
> launch games without the full Epic store app on my system. I use a web browser
> to claim the games.

So in order to know which launcher has the game that I want, or if it's my
library at all I use yet another launcher called [Playnite][playnite]. The fact
that I use another launcher to launch games via the launchers reminds me of
[xkcd#927][xkcd#927].

![xkcd 927](https://imgs.xkcd.com/comics/standards.png)
_xkcd comic [927][xkcd#927] - standards_

In order to make Playnite itself more useful, I add a few add-ons. Below are a
few of them, minus any that I used for the libraries above.

__Playnite Addons:__

* Generic
  * [DuplicateHider][duplicatehider]
    * Hide duplicate games. This is useful if you have bought a game in Steam,
      and claimed it for free via Epic. You can essentially combine them
      together to hide the old ones.
  * [GameActivity][gameactivity]
    * This is used to track gaming sessions to see what you play where a little
      easier.
  * [HowLongToBeat][howlongtobeat-plugin]
    * This gets and sets game completion time to How Long To Beat (HLTB) which
      can be useful if you want to know how long or short a game will probably
      be.
  * [Ludusavi][ludusavi-plugin]
    * Backs up your game saves via Ludusavi rather than having to rely on the
      launchers cloud save functionality. This also works for games where they
      don't have support for saving in the cloud.
  * [Purchase Date Importer][playniteextensionscollection]
    * This extension will obtain the purchase date from your Epic, GOG and Steam
      accounts and import them to the games in your library as added dates.
  * [Steam Wishlist Discount Notifier][playniteextensionscollection]
    * Checks your Steam wishlist in a view in Playnite and checks and notified
      you of new discounts in the background.
  * [SuccessStory][successstory]
    * Used to track achievements so that you can see them within Playnite.
  * [SystemChecker][systemchecker]
    * This plugin get the game requirements and check with your configuration in
      playnite.
* Themes
  * [Harmony][harmony]
  * [Helium][helium]

By using playnite itself to launch my games, I get a single pane of glass view
on what I own, so I hopefully do not mistakely purchase a second copy just
because it is cheap on Steam. More importantly I don't have to recall which
launcher to use to just play my games.

[steam]: https://store.steampowered.com/about/
[gog]: https://www.gog.com/galaxy
[epic-games]: https://store.epicgames.com/en-US/download
[ubisoft]: https://www.ubisoft.com/en-gb/ubisoft-connect
[ea-app]: https://www.ea.com/en-gb/ea-app
[legendary]: https://github.com/derrod/legendary
[heroic-legendary]: https://github.com/Heroic-Games-Launcher/legendary
[playnite]: https://playnite.link/
[duplicatehider]: https://github.com/felixkmh/DuplicateHider
[gameactivity]: https://github.com/Lacro59/playnite-gameactivity-plugin
[howlongtobeat-plugin]: https://github.com/Lacro59/playnite-howlongtobeat-plugin
[ludusavi-plugin]: https://github.com/mtkennerly/ludusavi-playnite
[playniteextensionscollection]: https://github.com/darklinkpower/PlayniteExtensionsCollection
[successstory]: https://github.com/Lacro59/playnite-successstory-plugin
[systemchecker]: https://github.com/Lacro59/playnite-systemchecker-plugin
[harmony]: https://github.com/darklinkpower/Harmony
[helium]: https://github.com/darklinkpower/Helium
[xkcd#927]: https://xkcd.com/927/
