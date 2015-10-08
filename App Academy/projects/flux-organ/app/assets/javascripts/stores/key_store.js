(function(root) {
  'use strict';
  var _keys = [];
  var CHANGE_EVENT = "CHANGE";

  var removenoteNames = function(noteName){
    var idx = _keys.indexOf(noteName);
    if (idx !== -1){
      _keys.splice(idx, 1);
    }
    KeyStore.changed();
  };

  var createnoteName = function(noteName){
    if (_keys.indexOf(noteName) === -1){
      _keys.push(noteName);
    }
    KeyStore.changed();
  };

  root.KeyStore = $.extend({}, EventEmitter.prototype, {
    all: function(){
      return _keys.slice();
    },
    addChangeHandler: function(callback){
      KeyStore.on(CHANGE_EVENT, callback);
    },
    removeChangeHandler: function(callback){
      KeyStore.removeListener(CHANGE_EVENT, callback);
    },
    changed: function(){
      KeyStore.emit(CHANGE_EVENT);
    }
  });

  AppDispatcher.register(function(payload){

    switch(payload.actionType){
      case KeyConstants.CREATE_NOTE:
        createnoteName(payload.noteName);
        break;
      case KeyConstants.REMOVE_NOTE:
        removenoteNames(payload.noteName);
        break;
    }
  });


}(this));
