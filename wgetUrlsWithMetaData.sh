

## Summary: Takes a file containing urls seperated by newlines and downloads the pages are the urls to a 'data/' folder in the current directory. A metadata file is also created in the present working diretory with the format: filename,url_source,datetime,hash,filesize_bytes
## Usage: ./Download_URLs_Document_Metadata.sh Listofurls.txt
## Input: File containing one url per line.
## Output: Data directory containing downloaded URLs, csv metadata file in pwd with format: filename,url_source,datetime,hash

URLS_TO_DOWNLOAD=$1
cat $URLS_TO_DOWNLOAD | parallel -j 8 ./wgetWithMetaData.sh

# Add headings to the metadata_output.csv
sed -i "1ifilename,url_source,datetime,hash,filesize_bytes" meta_output.csv


# Get failed logs in a single file
grep -A 1 -B 1 " failed: " log.txt > failedLog.txt
# Get failed URLs into a single file
cat failedLog.txt | tr ' ' '\n' | grep 'http' > failedUrls.txt

# Delete the empty files that get created in the data folder.
find ./data -type f -size 0 -delete

