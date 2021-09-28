successful_downloads=$(find data/ -type f | wc -l)
failed_downloads=$(cat failedUrls.txt | wc -l)
file_sizes=$(find data/ -mindepth 1 -maxdepth 1 -print0 | xargs -0 du -s -h | sort -n)
data_folder_size=$(du -s -h data/ | cut -f 1)
#
smallest_filesize=$(echo "$file_sizes" | head -n 1 | cut -f 1)
smallest_file=$(echo "$file_sizes" | head -n 1 | cut -f 2)
smallest_filename=$(echo "$smallest_file" | rev | cut -d "/" -f 1 | rev)
#
largest_filesize=$(echo "$file_sizes" | tail -n 1 | cut -f 1)
largest_file=$(echo "$file_sizes" | tail -n 1 | cut -f 2)
largest_filename=$(echo "$largest_file" | rev | cut -d "/" -f 1 | rev)


echo $successful_downloads files successfully downloaded.
echo Total amount of data successfully acquired: $data_folder_size
echo The smallest file was $smallest_filename at $smallest_filesize
echo The largest file was $largest_filename at $largest_filesize
echo The number of failed downloads is $failed_downloads