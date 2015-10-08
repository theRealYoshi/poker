var Key = React.createClass({
  getInitialState: function(){
    return {pressed: false};
  },
  componentDidMount: function(){
    var frequency = TONES[this.props.noteName];
    this.note = new Note(frequency);
    KeyStore.addChangeHandler(this._listenToKeyStore);
  },
  componentWillUnmount: function(){
    KeyStore.removeChangeHandler(this._listenToKeyStore);
  },
  _listenToKeyStore: function(){
    var keys = KeyStore.all();
    if (keys.indexOf(parseInt(this.props.noteName)) !== -1){
      this._playNote();
    } else {
      this._endNote();
    }
  },
  _playNote: function(){
    this.setState({pressed: true});
    this.note.start();
  },
  _endNote: function(){
    this.setState({pressed: false});
    this.note.stop();
  },
  render: function(){
    return(
      <div>
        <li></li>
      </div>
    );
  }
  // have to change the tone of the key to make it different
});
