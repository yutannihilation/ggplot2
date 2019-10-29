#!/bin/sh -ex

# make sure the documents are regenerated
Rscript -e 'devtools::document()'

if [ -n "$(git diff --name-only man NAMESPACE)" ]; then
  echo "Did you forget to regenerate the documents? (This error might be ignorable)."
  exit 1
fi
