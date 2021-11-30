# better-webpage-grabbing
Cross-platform script for pulling URL lists in parallel with automatic metadata generation and easy failure tracking. Built for stable usage on large lists. Pretty much a point and click extension of wget for this specific use case. Uses 8 workers/threads by default. 

# Summary

* Input: Text file containing one url per line.
* Output: `data/` directory containing successfully downloaded URLs, csv metadata file in pwd with format: filename,url_source,datetime,hash

# Prerequisites

If you don't have `parallel` installed already;

        sudo apt install parallel
OR

        ./install.sh    

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

Successfully downloaded files reside in the `data/` directory. The random number after the '_' in each filename is to prevent data loss if a distinct file with the same name on a different (sub)domain is downloaded (and would otherwise be overwritten).

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
        The smallest file was facebook.com_2516525256 at 123610 Bytes
        The largest file was Kerala_504216606 at 1313468 Bytes
        The number of failed downloads is 1.
