# better-webpage-grabbing
Cross-platform script for pulling URL lists with automatic metadata generation and easy failure tracking. Built for stable usage on large lists. Pretty much a point and click extension of wget for this specific use case. 

# Summary

Takes a file containing urls seperated by newlines and downloads the pages are the urls to a 'data/' folder in the current directory. A metadata file is also created in the present working diretory with the format: filename,url_source,datetime,hash,filesize_bytes.

* Input: Text file containing one url per line.
* Output: `data/` directory containing successfully downloaded URLs, csv metadata file in pwd with format: filename,url_source,datetime,hash
# Example Usage

`./wgetUrlsWithMetaData.sh test.txt`

This will generate the following new files: 

        ├── data
        │   ├── facebook.com_2738712587
        │   ├── google.com_1453029789
        │   └── Kerala_516426438
        ├── failedLog.txt
        ├── failedUrls.txt
        ├── log.txt
        ├── meta_output.csv

Successfully downloaded files reside in the `data/` directory. The random number after the '_' in each filename is to prevent data loss if a distinct file with the same name on a different domain is downloaded (and would otherwise be overwritten).

## Metadata Output CSV

`cat meta_output.csv`

        filename,url_source,datetime,hash,filesize_bytes
        data/google.com_1453029789,https://google.com,19:22/09/28/2021,3167848543,166391
        data/facebook.com_2738712587,https://facebook.com,19:22/09/28/2021,271623169,123585
        data/Kerala_516426438,https://en.m.wikipedia.org/wiki/Kerala,19:22/09/28/2021,4241811873,1313468
        data/dfg2352fasdfdsagfdssadfsaddadff3545235df.com_74182339,dfg2352fasdfdsagfdssadfsaddadff3545235df.com,19:22/09/28/2021,4294967295,0

## Getting Summary Metadata

`./getCompletionMetaData.sh`

        3 files successfully downloaded.
        Total amount of data successfully acquired: 1.6M
        The smallest file was Kerala_1395212061 at 1.3M
        The largest file was google.com_2892128486 at 164K
        The number of failed downloads is 1.