#!/bin/bash
#save this .sh file to /opt/.hdfs_retention_scripts/ path
#save dir/folders on which u wnt to perform purging or TTL in folder_dirs.txt and format like /abc/a1/vendor/=30
Todaysdate=$(date +'%Y%m%d%s')
path=/opt/.hdfs_retention_scripts/
logpath=$path/folder_$Todaysdate.log
dir_list=$path/folder_dirs.txt

IFS=$'\n' read -d '' -r -a lines < $dir_list
echo "====================================================">> $logpath

for directoryNameWithDays in ${lines[@]}
do
var=$(echo $directoryNameWithDays | awk -F"=" '{print $1,$2}')
set -- $var
directoryName=$1
no_Of_Days=$2
deln=$(date --date="$no_Of_Days days ago" +%Y%m%d)
echo directoryName is $directoryName and days is $no_Of_Days and date is between $deln to $Todaysdate

#echo inloop
hadoop fs -ls  $directoryName | sed 's/  */ /g' | cut -d\  -f8|xargs -n 1 basename | grep -E '^[0-9]'  | while read line ; do
#echo  $line
if [ ${line} -lt ${deln} ]; then
echo $directoryName$line
hadoop fs -ls $directoryName$line >> $logpath
#hadoop fs -rm -r  $directoryNameWithDays$line >> $logpath
fi
done

done
