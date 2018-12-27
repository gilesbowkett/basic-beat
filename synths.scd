//
// SYNTHS
//

// http://blog.rumblesan.com/post/53271713518/drum-sounds-in-supercollider-part-1
SynthDef('kick', { arg amp=1;

  var subosc = {SinOsc.ar(55)};
  var subenv = {Line.ar(amp, 0, 0.3, doneAction: 2)};

  var crackle = { BPF.ar(in: PinkNoise.ar, freq: 660, rq: 3, mul: Env.perc(releaseTime: 0.3, level: amp).ar) };

  var clickosc = {LPF.ar(WhiteNoise.ar(1),1500)};
  var clickenv = {Line.ar(amp, 0, 0.02)};

  var suboutput = (subosc * subenv);
  var clickoutput = (clickosc * clickenv);

  var kickOut = Out.ar(0,
    Pan2.ar(suboutput + clickoutput + crackle, 0)
  );

}).add;

// http://blog.rumblesan.com/post/53271713909/drum-sounds-in-supercollider-part-2
SynthDef('snare', { arg amp = 1;

var drumosc, filterenv, drumoutput, volenv;

filterenv = {Line.ar(1, 0, 0.2, doneAction: 2)};
volenv = {Line.ar(amp, 0, 0.6, doneAction: 2)};

drumosc = {
  BPF.ar(in: WhiteNoise.ar(100), freq: (filterenv * 1760), rq: 0.2)
};
drumoutput = {LPF.ar(drumosc,(filterenv * 1000) + 3)};

Out.ar(0,
    FreeVerb.ar(in: Pan2.ar(drumoutput * volenv * 0.1), mix: 0.2, room: 0.5)
);

}).add;

// crash
SynthDef("crash", { arg amp = 1;
  var whiteNoise = PinkNoise.ar(
    mul: Env.perc(releaseTime: 4, curve: -7).kr(doneAction: 2));
  Out.ar(0, Pan2.ar(HPF.ar(whiteNoise, freq: 7040)) * 4 * amp);
}).add;

// set up clap sample
~clapBuffer = Buffer.read(s, "/Applications/SuperCollider/SuperCollider.app/Contents/Resources/sounds/11098__a43__a43-clap.aiff");

// set up open hat sample
~openHatBuffer = Buffer.read(s, "/Applications/SuperCollider/SuperCollider.app/Contents/Resources/sounds/165028__rodrigo-the-mad__mini-909ish-open-hat.wav");

// generic sample player synthdef
SynthDef("samplePlayer",{ arg out = 0, bufnum, amp;
  Out.ar( out,
    PlayBuf.ar(2, bufnum, BufRateScale.kr(bufnum), doneAction: 2) * amp;
  )
}).add;

// basic synth hat
SynthDef("hat", { arg amp = 1, startPan = -1, endPan = 1, pitchVariation = 0, release = 0.1;
  var whiteNoise = WhiteNoise.ar(mul: Env.perc(releaseTime: release, curve: -7).kr(doneAction: 2));
  Out.ar(0, Pan2.ar(BBandPass.ar(whiteNoise, freq: pitchVariation, bw: 1), pos: Line.kr(startPan, endPan, 4)) * amp);
}).add;

// riser
SynthDef("riser",
  { arg amp = 1, startPan = -1, endPan = 1;
    // envs
    var env1 = Env.pairs([[0, 0], [0.4, amp], [3.1, 0.5], [3.5, 0]], \lin); // amp env
    var env2 = Env.pairs([[0, 55], [0.4, 110], [1, 220], [3.1, 1760]], \lin);
    var env3 = Env.pairs([[0, 50], [4, 1]], \exponential);

    // build oscs on the envs
    var squiggly = Saw.ar(freq: SinOsc.ar(env3.kr(doneAction: 2)).range(30, 19900), mul: (env1.kr * 0.6)) * amp;
    var riser = Saw.ar(freq: env2.kr, mul: (env1.kr(doneAction: 2) * 0.8)) * amp;

    // first combine these mono channels in a stereo space, then add reverb
    var combined = Pan2.ar(squiggly + riser, pos: Line.kr(startPan, endPan, 4));
    Out.ar(0, FreeVerb.ar(in: combined, mix: 0.5, room: 0.5));
}).add;

SynthDef("zaps", { arg amp = 1, modFreq = 15, carFreq = 880, modDepth = 3250;
  var car, mod, env;

  env = Env.perc(releaseTime: 0.3).kr(doneAction: 2);
  mod = Pulse.ar(freq: modFreq * [1, 1.14, 0.97, 6, 7, 8, 9, 10, 1.04, 1.2], mul: modDepth);
  car = Pulse.ar(freq: carFreq + mod * [1, 1.41, 0.99, 2.4921, 5, 6, 1.397], mul: env);
  car = Splay.ar(car);
  Out.ar(0, FreeVerb.ar(HPF.ar(car, freq: 5274), mix: 0.05, room: 0.1, damp: 0.9, mul: amp * 0.5));
}).add;

// Bruno's Karplus-Strong synth
SynthDef("plucking", {arg amp = 0.1, freq = 440, decay = 5, dampen = 0.1;

var env, snd;
env = Env.linen(0, decay, 0).kr(doneAction: 2);
snd = FreeVerb.ar(Pluck.ar(
        in: WhiteNoise.ar(amp),
        trig: Impulse.kr(0),
        maxdelaytime: 0.1,
        delaytime: freq.reciprocal,
        decaytime: decay,
    coef: dampen), mix: 0.7, room: 0.8);
    Out.ar(0, [snd, snd] * 0.5);
}).add;
