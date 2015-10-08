(function(){
    $(document).keydown(function(key){
      KeyActions.keyPressed(key.keyCode);
    });
    $(document).keyup(function(key){
      KeyActions.keyLifted(key.keyCode);
    });
})();
