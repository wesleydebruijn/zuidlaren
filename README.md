# zuidlaren

This README would normally document whatever steps are necessary to get the
application up and running.

## Chicken Sounds as a Service

To get it working do this:

Install paprefs (on host machine):
`$ apt-get install paprefs`

Launch paprefs (PulseAudio Preferences) > Network Server > [X] Enable network access to local sound devices.

Restart PulseAudio:
`$ service pulseaudio restart`

Check if it worked or restart machine:
`$ (pax11publish || xprop -root PULSE_SERVER) | grep -Eo 'tcp:[^ ]*'`
You should get: `tcp:myhostname:4713`