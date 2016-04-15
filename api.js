"use strict";
function interprete(str) {
    var sandbox = this.createContext({});
    var script = this.createScript('(' + str + ')');
    var exported = str.runInNewContext(sandbox);
    for (var key in exported) {
        sandbox[key] = exported[key];
    }
    return exported;
};

function parse(str) {
    var sandbox = this.createContext({});
    var script = this.createScript('(' + str + ')');
    return script.runInNewContext(sandbox);
};

function jsrd(data, metadata) {
    var obj = {},
    keys = Object.keys(metadata);
    keys.forEach(function(fieldName, index) {
                 Object.defineProperty(obj, fieldName, {
                                       enumerable: true,
                                       get: function () {
                                       return data[index];
                                       },
                                       set: function(value) {
                                       data[index] = value;
                                       }
                                       });
                 });
    return obj;
};