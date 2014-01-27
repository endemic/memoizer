require({
    paths: {
        cs: '../coffeescript/cs',
        'coffee-script': '../coffeescript/coffee-script',
        zepto: '../lib/zepto.min',
        underscore: '../lib/underscore-min',
        backbone: '../lib/backbone-min',
        less: '../lib/less-1.6.0.min',
        localstorage: '../lib/backbone.localStorage-min'
    },
    shim: {
        zepto: {
            exports: '$'
        },
        underscore: {
            exports: '_'
        },
        backbone: {
            // These script dependencies should be loaded before loading backbone.js
            deps: ['underscore', 'zepto'],
            // Once loaded, use the global 'Backbone' as the module value.
            exports: 'Backbone'
        },
        less: {
            exports: 'less'
        },
        localstorage: {
            deps: ['backbone']
        }
    }
}, ['cs!app']);
