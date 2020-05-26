#!/bin/bash

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    --iso_url)
    ISO_URL="$2"
    shift
    shift
    ;;
    --box_name)
    BOX_NAME="$2"
    shift
    shift
    ;;
    -h|--help)
    echo "Build a virutalbox vagrant box from vyos iso"
    echo ""
    echo "Set the ISO URL:"
    echo "--iso_url URL"
    echo ""
    echo "Provide a vagrant boxname"
    echo "--box_name Boxname"
    exit 0
    ;;
esac
done


ISO_NAME="iso.iso"

if [ -z "$BOX_NAME" ]
  then
    echo "--box_name required"
    exit 1    
fi

if [ -z "$ISO_URL" ]
  then
    echo "--iso_url required"
    exit 1    
fi

#download ISO and hash
curl $ISO_URL --output $ISO_NAME
hash=$(cat iso.iso | md5)


export ISO_FILE=$ISO_NAME
export ISO_SUM=$hash
export ISO_SUM_TYPE="md5"

packer build packer.json
# TODO: test if packer failed

vagrant box add vyos-virtualbox.box --name $BOX_NAME -f