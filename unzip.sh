#!/bin/sh

data_dir=data
zip_dir=$data_dir/zip

for fname in $zip_dir
do
    unzip $zip_dir/$fname -o $data_dir
    
done
