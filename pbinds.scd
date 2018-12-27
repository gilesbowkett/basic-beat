//
// PBINDS
//

// 4/4 basic beat
var mainClock = TempoClock(125/60);

Pbind(
  \instrument, \kick,
  \dur, 1/4, // 16th note is one quarter of a beat!
  \amp, Pseq(~kickAmps, inf)
).play(mainClock);

// sample player: clap
Pbind(
  \instrument, \samplePlayer,
  \dur, 1/4, // 16th note is one quarter of a beat!
  \bufnum, ~clapBuffer,
  \amp, Pseq(~clapAmps, inf)
).play(mainClock);

// sample player: hat
Pbind(
  \instrument, \samplePlayer,
  \dur, 1/4, // 16th note is one quarter of a beat!
  \bufnum, ~openHatBuffer,
  \amp, Pseq(~sampledOpenHatAmps * 0.65, inf)
).play(mainClock);

Pbind(
  \instrument, \hat,
  \dur, 1/4, // 16th note is one quarter of a beat!
  \amp, Pseq(~hatAmps, inf),
  \startPan, Pseq(~hatStarts, inf),
  \endPan, Pseq(~hatEnds, inf),
  \pitchVariation, Prand([3520, 2637, 7040], inf),
  \release, Pseq(~hatReleases, inf)
).play(mainClock);

Pbind(
  \instrument, \zaps,
  \dur, 1/4, // I have NFI what's going on here
  \amp, Pseq(~rideAmps, inf)
).play(mainClock);

// bar line work

Pbind(
  \instrument, \snare,
  \dur, 1/4, // 16th note is one quarter of a beat!
  \amp, Pseq(~snareAmps, inf)
).play(mainClock);

// riser, crash

Pbind(
  \instrument, \riser,
  \dur, 2, // 16 half notes instead of 16ths
  \amp, Pseq(~riserAmps, inf),
  \startPan, Pseq(~riserStarts, inf),
  \endPan, Pseq(~riserEnds, inf)
// this "sending in Pseq-ed vars" strategy would work to make the track more generative also
).play(mainClock);

Pbind(
  \instrument, \crash,
  \dur, 2,
  \amp, Pseq(~crashAmps, inf)
).play(mainClock);

Pbind(
  \instrument, \plucking,
  \dur, 1/4,
  \freq, 220,
  \amp, Pseq(~pluckAmps, inf),
    \decay, Pwhite(1, 2),
    \dampen, Prand([0.7, 0.8, 0.6], inf),
).play(mainClock);
