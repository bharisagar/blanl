#!/bin/bash
required_files=("file1.txt" "file2.log" "file3.csv")
missing_count=0
echo "Checking for required files..."
for file in "${required_files[@]}"; do
	if [[ -f "$file" ]]; then
		echo "$file is exists."
	else
		echo "$file is missing."
		# Increment the missing count
		((missing_count++))
	fi
done
if [ $missing_count -gt 0 ]; then
	echo "$missing_count files are missing."
	until [ $missing_count -eq 0 ]; do
		missing_count=0
		sleep 2
		for file in "${required_files[@]}"; do
			if [[ ! -f "$file" ]]; then
				((missing_count++))
			fi
	done
	echo " still missing $missing_count "
	done
else
	echo "All required files are present."
fi
i=0
while [ $i -lt $required_files[@] ]; do
	file=${required_files[$i]}
	case $file in
		*.txt)
			echo "processing text file : $file"
			;;
		*.log)
			echo "processing log file : $file"
			;;
		*.csv)
			echo "processing csv file : $file"
			;;
		*)
			echo "unknown file type : $file"
			;;
	esac
	((i++))
done
