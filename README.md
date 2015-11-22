Whatsie
=======

[![Build status](https://ci.appveyor.com/api/projects/status/t9nvllbmy6h54o5t/branch/master?svg=true)] (https://ci.appveyor.com/project/Aluxian/whatsie/branch/master) [![Dependency Status](https://david-dm.org/Aluxian/Whatsie/status.svg)](https://david-dm.org/Aluxian/Whatsie#info=dependencies) [![Join the chat at gitter.im/Aluxian/Whatsie](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/Aluxian/Whatsie)

A simple & beautiful app for [WhatsApp Web](https://web.whatsapp.com/) which runs on OS X, Windows and Linux. Not affiliated with WhatsApp or Facebook. This is **NOT** an official product.

*This is a break-away from [Aluxian's Whatsie](https://github.com/Aluxian/Whatsie) due to lack of development.*

Build
-----

### Install pre-requisites

If you want to build `deb` and `rpm` packages for Linux, you also need [fpm](https://github.com/jordansissel/fpm). To install it on OS X:

```
$ sudo gem install fpm
$ brew install rpm
```

### Install dependencies

:white_check_mark: Global dependencies:

```
$ npm install -g gulp
```

:white_check_mark: Local dependencies:

```
$ npm install
```

The last command should also install the modules for `./src`. If `./src/node_modules/` doesn't exist then:

```
$ cd ./src
$ npm install
```

### Build and watch

During development you can use the `watch` tasks, which have live reload. As you edit files in `./src`, they will be re-compiled and moved into the `build` folder:

```
$ gulp watch:darwin64
$ gulp watch:linux32
$ gulp watch:linux64
$ gulp watch:win32
```

If you want to build it just one time, use `build`:

```
$ gulp build:darwin64
$ gulp build:linux32
$ gulp build:linux64
$ gulp build:win32
```

### Pack

Package *all* the things!

#### OS X

Pack the app in a neat .dmg:

```
$ gulp pack:darwin64
```

This uses [node-appdmg](https://www.npmjs.com/package/appdmg) which works only on OS X machines. There's an issue about making it cross-platform [here](https://github.com/LinusU/node-appdmg/issues/14).

#### Windows

Create an installer. This will also sign every executable inside the app, and the setup exe itself:

```
$ gulp pack:win32:installer
```

Or, if you prefer, create a portable zip. This will also sign the executable:

```
$ gulp pack:win32:portable
```

These tasks only work on Windows machines due to their dependencies: [Squirrel.Windows](https://github.com/Squirrel/Squirrel.Windows) and Microsoft's SignTool.

If you don't have a Windows machine at hand, you can use AppVeyor. When you push a tagged commit in a branch named `deploy`, AppVeyor will automatically start the build and upload the release files as artifacts. You'll be able to download the artifacts from your AppVeyor dashboard. You have to replace some secret keys in `appveyor.yml` to make it work.

#### Linux

Create deb packages:

```
$ gulp pack:linux32:deb
$ gulp pack:linux64:deb
```

Create rpm packages:

```
$ gulp pack:linux32:rpm
$ gulp pack:linux64:rpm
```

Make sure you've installed [fpm](https://github.com/jordansissel/fpm).

Note to WhatsApp
----------------

This project does not attempt to reverse engineer the WhatsApp API or attempt to reimplement any part of the WhatsApp client. Any communication between the user and WhatsApp servers is handled by WhatsApp Web itself; this is just a native wrapper for WhatsApp Web.

Contributions :pray:
--------------------

Contributions are welcome! For feature requests and bug reports please [Submit An Issue](https://github.com/Skowt/Whatsie/issues) or Twitter [@DanSkowt](https://twitter.com/DanSkowt).
