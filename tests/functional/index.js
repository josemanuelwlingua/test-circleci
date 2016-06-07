define([
    'intern!object',
    'intern/chai!assert',
    'require',
    'intern/dojo/node!dijit-intern-helper/helpers/dijit',
    'intern/dojo/node!leadfoot/helpers/pollUntil',
    'intern/dojo/node!dijit-intern-helper/helpers/wlingua'
], function (registerSuite, assert, require, dijit, pollUntil, wlingua) {

    registerSuite({
        name: 'index',
        'successful index': function () {
            return this.remote
                .get(require.toUrl('../../index.html'))
                .setFindTimeout(10000)
                .setPageLoadTimeout(8000)
                .setExecuteAsyncTimeout(10000)
                .then(function(){
                    return true;
                });
        }
    });
});