
URL_TO_DOWNLOAD="$1"
METADATA_OUTPUT=meta_output.csv
DATA_DIR=data ## Empty directory in which to slap the files when they are wgot. 
#

mkdir -p $DATA_DIR
filename=$(echo "$URL_TO_DOWNLOAD" | rev | cut -d '/' -f 1 | rev) # Getting the last part of the URL
wget_output_filename=$DATA_DIR/"$filename"_"$RANDOM$RANDOM" # Random numbers added to prevent duplicates if you have the same filename on a different domain.

## Grabbing the file, overwriting if it already exists.
wget "$1" -O $wget_output_filename --no-check-certificate --timeout=8 --tries=2 --retry-connrefused -U "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36" -a log.txt

## Once the download has finished, append the completed urls to a file with metadata. 

url="$URL_TO_DOWNLOAD"
filesize_bytes=$(du -b $wget_output_filename | cut -f 1)
metadata_date=$(date +'%R/%m/%d/%Y')
hash=$(cksum $wget_output_filename | cut -d ' ' -f 1) ## Use cksum for performance, love gnu core. 

## Metadata file format: 
# filename,url_source,datetime,hash,filesize_bytes
echo $wget_output_filename,$url,$metadata_date,$hash,$filesize_bytes >> $METADATA_OUTPUT
