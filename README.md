# TTYtter kdialog Notification Extension 1.0.2

by [noquierouser](http://noquierouser.uni.cx) \([@noquierouser](http://twitter.com/noquierouser)\)

## Changelog

### Version 1.0.2 (Sept. 24, 2011)

* Fixed kdialog popups showing in the middle of the screen in fluxbox. This is supposed to be fixed in next versions to fit more Window Managers with the same bug.

### Version 1.0.1 (Sept. 15, 2011)

* Fixed DM prefix and DM sender not showing on notification title
* Changed notification title format to something more friendly

### Version 1.0 (Sept. 14, 2011)

* First Commit

## About

This is a TTYtter extension which uses kdialog passive popups to notify for new
messages, according to your preferences.

It's meant for KDE4 users, but I don't know if it might work on KDE3.5 or
earlier. Any feedback is highly appreciated.

## Compatibility

This extension has been tested with TTYtter 1.2.1, KDE 4.4.5, kdialog 1.0 on
Debian 6.0.2 (Squeeze).

## License

This extension is bound by the Floodgap Free Software License. See the term at
http://www.floodgap.com/software/ffsl/

You can also check COPYING for further information about the license.

## Installation

* Make sure you have the last version of this extension in your `~/.ttytter/` directory. You can download the `kdialog.pl` file from [here](https://raw.github.com/noquierouser/ttytter-kdialog/master/kdialog.pl) or clone this repo. Do it how you see fit.

* Then, after saving `kdialog.pl` (I recommend to save it in `~/.ttytter/`, make that dir if you don't have it), load this extension and choose what you want to be notified:

	$ ttytter -exts=${path_to_file}/kdialog.pl -notifytype=kdialog -notifies=dm,reply{,me,default,search}

* If you like it and you know it... save those settings in your `~/.ttytterrc` file.

## Links

* [An edible version of this readme](http://noquierouser.uni.cx/pages/ttytter-kdialog)
* [@noquierouser](http://twitter.com/noquierouser)
* [TTYtter site](http://www.floodgap.com/software/ttytter/)
* [@TTYtter](http://twitter.com/ttytter)
* [@doctorlinguist](http://twitter.com/doctorlinguist)
