#!/bin/bash

set -e

rm -rf dev-clean.tar.gz test-clean.tar.gz LibriSpeech

wget http://www.openslr.org/resources/12/dev-clean.tar.gz
tar -xzvf dev-clean.tar.gz
wget http://www.openslr.org/resources/12/test-clean.tar.gz
tar -xzvf test-clean.tar.gz
#mv flac_to_wav.sh LibriSpeech
cd LibriSpeech
../flac_to_wav.sh

cd ..
python create_desc_json.py LibriSpeech/dev-clean/ train_corpus.json
python create_desc_json.py LibriSpeech/test-clean/ valid_corpus.json
