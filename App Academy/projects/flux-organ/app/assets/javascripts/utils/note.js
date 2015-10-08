(function(root) {
  'use strict';

  // audio context
  var AudioContext = window.AudioContext || window.webkitAudioContext;
  var ctx = new AudioContext();

  var createOscillator = function (freq) {
    var osc = ctx.createOscillator();
    osc.type = "sine";
    osc.frequency.value = freq;
    osc.detune.value = 0;
    osc.start(ctx.currentTime);
    return osc;
  };

  var createGainNode = function () {
    var gainNode = ctx.createGain();
    gainNode.gain.value = 0;
    gainNode.connect(ctx.destination);
    return gainNode;
  };

  // Declare a note class
  var Note = window.Note = function Note(frequency){
    this.frequency = frequency;
    this.oscNode = createOscillator(frequency);
    this.gainNode = createGainNode();
    this.oscNode.connect(this.gainNode);
  };

  Note.prototype.start = function(){
    this.gainNode.gain.value = 0.3;
  };

  Note.prototype.stop = function(){
    this.gainNode.gain.value = 0;
  };




}(this));
