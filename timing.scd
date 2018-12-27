//
// TIMING
//

// set up when to play the kick
~kickAmps = [ 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0 ]; // 16 beats

// set up when to play the clap
~clapAmps = [ 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0 ]; // 16 beats

// set up when to play the hats
~hatAmps = [ 0.1, 0, 1, 0, 0, 0, 1, 0, 0.1, 0, 1, 0.1, 0, 0.1, 1, 0 ]; // 16 beats
~hatStarts = [ 0.5, 0, -0.5, 0, 0.7, -0.7 ]; // hat pan timing
~hatEnds = [ -0.7, 0, 0.7, 0, 0.5, -0.5 ]; // hat pan timing
~hatReleases = [
  0.1, 0.2, 0.1, 0.3, 0.2, 0.3, 0.5, 0.6,
  0.2, 0.1, 0.3, 0.3, 0.1, 0.2, 0.4, 0.2,
  0.1, 0.2, 0.2, 0.3, 0.1, 0.3, 0.3, 0.4,
  0.2, 0.1, 0.3, 0.3, 0.1, 0.2, 0.4, 0.2,
  0.1, 0.2, 0.2, 0.3, 0.1, 0.3, 0.3, 0.4,
  0.2, 0.1, 0.3, 0.3, 0.1, 0.2, 0.4, 0.2,
  0.1, 0.2, 0.3, 0.4, 0.2, 0.3, 0.1, 0.3
]; // hat release times

// timing for sampled open hat
~sampledOpenHatAmps = [ 0, 0, 1, 0 ];

// ride timing
~rideAmps = [
	0, 0, 0, 0,
	0, 0, 0, 0,
	0, 0, 0, 0,
	0, 0, 0, 0,

	1, 0, 0, 1,
	0, 0, 1, 0,
	1, 0, 0, 1,
	1, 0, 1, 0
];

// riser is a little different -- every four bars. so still 16, but no longer dur 1/4
~riserAmps = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0 ]; // 16 beats
~riserStarts = [ 1, 0, -1 ];
~riserEnds = [ -1, 0, 1 ];

// crash is like riser
~crashAmps = [ 1, 0, 0, 0, 0, 0, 0, 0 ]; // 16 beats

// timing for snare (bar line work)
~snareAmps = [
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,

  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 1, 0, 1 ];

// pluck timing
~pluckAmps = [
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,

  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,

  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,

  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,

  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,

  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,

  0, 0, 0, 0,
  1, 0, 1, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,

  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0
];
