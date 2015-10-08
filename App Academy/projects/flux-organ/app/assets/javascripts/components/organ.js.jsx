var Organ = React.createClass({

  render: function(){
    return(
      <div>
        {
          Object.keys(TONES).map(function(key){
            return  <Key className="key" noteName={key}/>;
          })
        }
      </div>
    );
  }
});
