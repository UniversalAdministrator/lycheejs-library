
# lychee.js Library (2016-Q2)

brought to you as libre software with joy and pride by [Artificial Engineering](http://artificial.engineering).

Support our libre Bot Cloud via BTC [1CamMuvrFU1QAMebPoDsL3JrioVDoxezY2](bitcoin:1CamMuvrFU1QAMebPoDsL3JrioVDoxezY2?amount=0.5&label=lychee.js%20Support).



## Overview

This is the lychee.js Isomorphic Library that can be used standalone in your existing projects.

The upstream project [lychee.js](https://github.com/Artificial-Engineering/lycheeJS.git)
is the `Isomorphic Engine`, this project is the `Isomorphic Library` which lacks
essential features such as the `lycheejs-*` tools and all software bots.



## NPM Usage

Install the lychee.js Library with the `lycheejs` package.

```bash
# node, node-sdl
npm install lycheejs;
```

Use the lychee.js Definitions with the `lychee.import(identifier)` method.
This method guarantees isomorphic behaviour across all platforms.

```javascript
var lychee = require('lycheejs')(__dirname);

lychee.environment.init(function(sandbox) {

	var Renderer = lychee.import('lychee.Renderer');
	var renderer = new Renderer({
		width: 1024,
		height: 768
	}); 

});
```
 


## Bower Usage

Install the lychee.js Library with the `lycheejs` package.

```bash
# html, html-nwjs, html-webview
bower install lycheejs;
```

Use the lychee.js Definitions with the `lychee.import(identifier)` method.
This method guarantees isomorphic behaviour across all platforms.

```html
<script src="./bower_components/lycheejs/build/html/lychee.js"></script>
```

```javascript
var lychee = (window || global).lychee;

lychee.environment.init(function(sandbox) {

	var Renderer = lychee.import('lychee.Renderer');
	var renderer = new Renderer({
		width: 1024,
		height: 768
	});

});
```



## License

lychee.js is (c) 2012-2016 Artificial-Engineering and released under MIT / Expat license.
The projects and demos are licensed under CC0 (public domain) license.
The runtimes are owned and copyrighted by their respective owners and may be shipped under a different license.

For further details take a look at the [LICENSE.txt](LICENSE.txt) file.

