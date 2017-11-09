#! /bin/bash

read -p "How many seconds of silence?:" SECONDS
INPUT=$1
OUTPUT=$2

TEMPDIR="/tmp/iGoSpeechHelper"
mkdir $TEMPDIR
mkdir $TEMPDIR/out
unzip INPUT -d $TEMPDIR/

FILES=$TEMPDIR/audio/*
for f in $FILES
do
   filename=$(basename "$f")
   echo "Processing $filename file..."
   oggCat "$TEMPDIR/out/$filename" ./silent.ogg $f 
done
rm $TEMPDIR/audio/*
mv $TEMPDIR/out/* $TEMPDIR/audio/
rm -r $TEMPDIR/out
zip $OUTPUT $TEMPDIR/*
# Todo: Zip auspacken, eingabe wieviele Sekunden vorher sein sollen, pfade angeben, packen, 
