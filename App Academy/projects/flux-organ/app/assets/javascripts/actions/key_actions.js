var KeyActions = {
  keyPressed: function(noteName){
    AppDispatcher.dispatch({
      actionType: KeyConstants.CREATE_NOTE,
      noteName: noteName
    });
  },
  keyLifted: function(noteName){
    AppDispatcher.dispatch({
      actionType: KeyConstants.REMOVE_NOTE,
      noteName: noteName
    });
  }
};
