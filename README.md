ApigeeMobileAnalyticsPlugin
===========================

PhoneGap / Cordova iOS plugin that allows you to add Apigee Mobile Analytics (http://www.apigee.com) to your app

1. Follow the instructions on Apigee's site for [Adding monitoring to your iOS application](http://apigee.com/docs/enterprise/content/add-monitoring-your-ios-application)
2. Add the `ApigeeMobileAnalyticsPlugin.h` and `ApigeeMobileAnalyticsPlugin.m` classes to your Plugins folder in Xcode
3. Copy the `ApigeeMobileAnalyticsPlugin.js` file to your www folder
4. Add the `ApigeeMobileAnalyticsPlugin.js` to your html file. eg: 
	`<script type="text/javascript" charset="utf-8" src="ApigeeMobileAnalyticsPlugin.js"></script>`
5. Add the plugin to the Cordova.plist under Plugins (key: "ApigeeMobileAnalyticsPlugin" value: "ApigeeMobileAnalyticsPlugin")
		- OR -
Add the plugin to the config.xml file (Cordova 2.3.0+) under `<plugins>`: 
	
	`<plugin name="ApigeeMobileAnalyticsPlugin" value="ApigeeMobileAnalyticsPlugin" />`



There is only one public method so far: `log(options)`.

##### options:

`options` is an object consisting of the following:

- severity: String
	- "assert"
	- "error"
	- "warn"
	- "info"
	- "debug"
	- "verbose"

- tag: String
	- User string for filtering logs (ie: "Login")

- message: String
	- User string message to log (ie: "Error logging in user")


### Example
```javascript
function onDeviceReady()
{
    var apigeeMobileAnalyticsPlugin = window.plugins.apigeeMobileAnalyticsPlugin;
    apigeeMobileAnalyticsPlugin.log({
      severity: "error",
      tag: "Login",
      message: "Error logging in user"
    });
}
```

### TODO

The next thing to be added to the plugin should be the "application-specific configuration" facilities of the Apigee Mobile Analytics SDK.


## License

The MIT License

Copyright (c) 2012 Tommy-Carlos Williams [http://github.com/devgeeks](github.com/devgeeks)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.