#!/bin/sh

# Targets
SRC=src
LIB=lib
OUT=out
TEMP=tmp

ARTICLE=article

# Clean directory
if [ -d $TEMP ] ; then
        rm $TEMP/*
        rmdir $TEMP
fi	
mkdir $TEMP

if [ -d $OUT ] ; then
        rm $OUT/*
        rmdir $OUT
fi
mkdir $OUT

# Copy required files
cp $SRC/* $TEMP
cp $LIB/* $TEMP

# Create the pdf and ps files
make -C $TEMP

# Copy produced files to out
cp $TEMP/$ARTICLE.pdf $OUT

# Remove the temporary directory
rm $TEMP/*
rmdir $TEMP
