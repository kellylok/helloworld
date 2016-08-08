#!/bin/bash
file_name="$0"
check_log="./after_modify.log"
record_log="./before_modify.log"

# recording the md5 value before modifying
record_md5() {
	if [ -f $file_name ];then
		find $file_name -type f | xargs md5sum > $record_log
	fi
}

check_md5() {
	if [ -f $file_name ];then
		find $file_name -type f | xargs md5sum > $check_log
	fi
}

if [ ! -f $record_log ];then
	record_md5
fi
check_md5
if [ -f $record_md5 ] && [ -f $check_md5 ];then
	diff $record_log $check_log > /dev/null
	Status=$?
	if [ $Status -eq 0 ];then
		echo "$Status"
		exit
	else
		echo "文件修改过了!"
		cat $check_log > $record_log
	fi
fi
