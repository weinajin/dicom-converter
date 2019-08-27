#!/bin/bash

# The script runs especially for case where the folder id is the patient id.
# user need to provide argument of the target folder containing multiple folders (their folder id is pt id), the script runs process_vgh_data.py for each individual folders


path=$@
echo "The target folder to be processed is: $path"
ls $path
for folder in $(find $path -maxdepth 1 -type d); do
		bn=$(basename $folder)
		if [ ${#bn} -eq 3 ]; then
				echo "Begin processing folder: $folder"
				python process_vgh_data.py --path="$folder/DICOM"
		fi
done
