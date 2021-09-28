# better-webpage-grabbing
Cross-platform script for pulling URL lists with automatic metadata generation and easy failure tracking. Built for stable usage on large lists. Pretty much a point and click extension of wget for this specific use case. 

# Summary

Takes a file containing urls seperated by newlines and downloads the pages are the urls to a 'data/' folder in the current directory. A metadata file is also created in the present working diretory with the format: filename,url_source,datetime,hash,filesize_bytes.

* Input: Text file containing one url per line.
* Output: Data directory containing downloaded URLs, csv metadata file in pwd with format: filename,url_source,datetime,hash
# Example Usage: 

`./wgetUrlsWithMetaData.sh test.txt`



