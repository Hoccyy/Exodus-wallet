Exodus’s light node is a wallet for storage and transfer of decentralized value

## Binary Downloads


Stay tuned.

## Main Features

1.	High transaction concurrency and fast confirmation.

2.	No need to download the entire data.


## Installation

Download and install [NW.js v0.21.6 LTS](https://dl.nwjs.io/v0.21.6/) and [Node.js v7.9.0](https://nodejs.org/download/release/v7.9.0/).  These versions are recommended for easiest install but newer versions will work too.  If you already have another version of Node.js installed, you can use [NVM](https://github.com/creationix/nvm) to keep both.

Clone the source:

```sh
git clone https://github.com/exodus/Exodus.git
cd Exodus
```



Install [bower](http://bower.io/) and [grunt](http://gruntjs.com/getting-started) if you haven't already:

```sh
npm install -g bower
npm install -g grunt-cli
```

Build Exodus:

```sh
bower install
npm install
grunt
```
If you are on Windows or using NW.js and Node.js versions other than recommended, see [NW.js instructions about building native modules](http://docs.nwjs.io/en/latest/For%20Users/Advanced/Use%20Native%20Node%20Modules/).

After first run, you'll likely encounter runtime error complaining about node_sqlite3.node not being found, copy the file from the neighboring directory to where the program tries to find it, and run again. (e.g. from `Exodus/node_modules/sqlite3/lib/binding/node-v51-darwin-x64` to `Exodus/node_modules/sqlite3/lib/binding/node-webkit-v0.21.6-darwin-x64`)

Then run Exodus desktop client:

```sh
/path/to/your/nwjs/nwjs .
```


### macOS

- `make osx64`

### Windows

- `install visual studio2015`

    * Setting environment variables: `C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin`

- `nmake win64`

### Linux

- `make linux64`


## About Exodus

Exodus is an infrastructure of Blockchain 4.0 with features such as DAG enhanced data structure, HashNet Concensus, full functions supported, high-performance, easy to use, friendly user experience, scalability. 

## Delete cash files



* macOS: `~/Library/Application Support/Exodus`
* Linux: `~/.config/Exodus`
* Windows: `%LOCALAPPDATA%\Exodus`


## Translations

Exodus uses standard gettext PO files for translations and [Crowdin](https://crowdin.com/project/Exodus) as the front-end tool for translators. To join our team of translators, please create an account at [Crowdin](https://crowdin.com) and translate the Exodus documentation and application text into your native language.

To download and build using the latest translations from Crowdin, please use the following commands:

```sh
cd i18n
node crowdin_download.js
```

This will download all partial and complete language translations while also cleaning out any untranslated ones.

## License

MIT.
