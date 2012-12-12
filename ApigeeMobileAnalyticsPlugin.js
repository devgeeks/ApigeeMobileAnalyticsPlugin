//
//  ApigeeMobileAnalyticsPlugin.js
//
//  Created by Tommy-Carlos Williams on 12/12/2012.
//  Copyright 2012 Tommy-Carlos Williams. All rights reserved.
//  MIT Licensed
//

(function(cordovaRef, undefined){

  var ApigeeMobileAnalyticsPlugin = function() {
    this.options = {
      severity: "debug",
      tag: null,
      message: ""
    };
  };

  ApigeeMobileAnalyticsPlugin.prototype = {
    log: function(options) {
      for (var v in options) {
        if (options.hasOwnProperty(v)) {
          this.options[v] = options[v];
        }
      }
      // No success or error callbacks required...
      cordovaRef.exec(null, null, 'ApigeeMobileAnalyticsPlugin','log', [this.options]);
    }
  };

  cordovaRef.addConstructor(function() {
    window.plugins = window.plugins || {};
    window.plugins.apigeeMobileAnalyticsPlugin = new ApigeeMobileAnalyticsPlugin();
  });

})(window.PhoneGap || window.Cordova || window.cordova);
