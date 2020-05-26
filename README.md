# Vagrant VyOS Meta packet

in the `_build` folder are scripts to create local virtualbox vagrant boxes from a vyos iso image

to build the lastest run `_build/build_latest.sh`

it wil create a *vyos-latest* box

to build from a other iso run

`_build/build.sh --iso_url URL --boxname NAME`

## Requirements

 * virtualbox
 * vagrant
 * packer
 * vagrant plugin install vagrant-vyos

