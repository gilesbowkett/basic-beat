# basic-beat

a simple drum machine, and beat, in SuperCollider

## from CCRMA 2018

I created this beat at the SuperCollider workshop this past summer at [Stanford's CCRMA (Center for Computer Research in Music and Acoustics)](https://ccrma.stanford.edu/).
It was a great workshop and I highly recommend it.

## how it works

To play the beat, first run `ruby installer.rb`, then load `loader.scd` in SuperCollider and evaluate the file.

`loader.scd` loads three files:

* `synths.scd`: this defines the drum sounds and the riser sound which plays at the end of every four bars.
* `pbinds.scd`: this defines the pattern bindings which play the drum sounds. It's roughly equivalent to a sequencer.
* `timing.scd`: this defines the individual sequences for each drum. It's roughly equivalent to the individual rows for each drum that you'd see in a grid sequencer.

## drum samples

Two drum samples come from freesound.org:

* https://freesound.org/people/Rodrigo%20The%20Mad/sounds/165028/
* https://freesound.org/people/A43/sounds/11098/

Thanks to their respective creators!

## blog posts

Some blog posts on truthindustri.es explain this code in depth:

* https://truthindustri.es/supercollider/2019/01/01/supercollider-house-beat.html
* https://truthindustri.es/supercollider/2019/01/04/supercollider-house-drums.html
* https://truthindustri.es/supercollider/2019/01/05/supercollider-riser.html

