# better-webpage-grabbing
Cross-platform script for pulling URL lists with automatic metadata generation and easy failure tracking. Built for stable usage on large lists. Pretty much a point and click extension of wget for this specific use case. 

# Summary

Takes a file containing urls seperated by newlines and downloads the pages are the urls to a 'data/' folder in the current directory. A metadata file is also created in the present working diretory with the format: filename,url_source,datetime,hash,filesize_bytes.

* Input: Text file containing one url per line.
* Output: `data/` directory containing successfully downloaded URLs, csv metadata file in pwd with format: filename,url_source,datetime,hash
# Example Usage

`./wgetUrlsWithMetaData.sh test.txt`

This will generate the following new files: 

        .
        ├── data
        │   ├── facebook.com
        │   └── google.com
        ├── failedLog.txt
        ├── failedUrls.txt
        ├── log.txt
        ├── meta_output.csv

Successfully downloaded files reside in the `data/` directory.

`cat meta_output.csv`

        filename,url_source,datetime,hash,filesize_bytes
        data/google.com,https://google.com,19:11/09/28/2021,3974241329,166463
        data/facebook.com,https://facebook.com,19:12/09/28/2021,1883132648,123578
        data/dfg2352fasdfdsagfdssadfsaddadff3545235df.com,dfg2352fasdfdsagfdssadfsaddadff3545235df.com,19:12/09/28/2021,4294967295,0
