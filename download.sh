#!/bin/sh
#
# Download FCC 417 broadband data and create a SQLite DB
# Since file is so big, this deletes all intermediate files
# including the .zip and expanded .csv
#

URL="http://transition.fcc.gov/form477/BroadbandData/Fixed/Jun16/Version%201/US-Fixed-without-Satellite-Jun2016.zip"
FNAME=$(basename $URL)
DATA_DIR=data

# Download the zip file
echo
echo DOWNLOADING ZIP FILE...
echo =======================

mkdir -p $DATA_DIR
wget "$URL" -O $DATA_DIR/$FNAME

# Unzip
echo
echo UNZIPPING THE FILE...
echo =====================
cd $DATA_DIR
unzip $FNAME
# rm -f $FNAME

cd ..

# Convert to psv
echo
echo CONVERTING TO PSV
echo =================
chmod 755 convert.py
python convert.py
# rm -f $DATA_DIR/*.csv

sqlite3 fcc_417.sqlite < create_db.sql

# rm -f $DATA_DIR/*.psv
# rm -rf $DATA_DIR
