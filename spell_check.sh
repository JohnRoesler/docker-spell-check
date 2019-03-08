#!/bin/sh

# CHECK_DIR - The directory in which to recursively spell check files
# CHECK_NAME - The name of files to match, e.g. '*.md'

files=$(find $CHECK_DIR -name "$CHECK_NAME")
for f in $files
do
  echo $f
  cat $f | aspell list -p $PERSONAL_WORDS_LIST | sort -u
done
