
#!/bin/bash

# Repeat part of the xml document by specified tag for provided number of times

# Check if any argument was provided
[[ $1 ]] || { echo "Provide a tag or part which encloses item of an array" >&2; exit 1; }
[[ $2 ]] || { echo "Provide a number of iterations" >&2; exit 1; }

# Declare variables for splited up xml document parts
declare partBefore=""
declare partToRepeat=""
declare partDoneRepeating=""
declare partAfter=""

# Read up to fist match of specified tag
while read -r || [[ $REPLY ]]; do
    
    if [[ ! $REPLY =~ $1 ]]; then
        partBefore+="${REPLY}\n"
	else
        partToRepeat+="${REPLY}\n"
		break
	fi

done

# Read up to last match of specified tag
declare -i spefifiedTagReachedTimes=0
while read -r || [[ $REPLY ]]; do
    
    partToRepeat+="${REPLY}\n"

    if [[ $REPLY =~ $1 ]] && [[ spefifiedTagReachedTimes -lt 1 ]]; then
        spefifiedTagReachedTimes+=1
	fi

    if [[ $REPLY =~ $1 ]] && [[ spefifiedTagReachedTimes -eq 1 ]]; then
        break
	fi

done

# Read rest of the file
while read -r || [[ $REPLY ]]; do
	partAfter+=$REPLY
done

# Repeat items for specified number of times
for (( i=0; i<$2; i++)); do
    partDoneRepeating+=$partToRepeat
done

# Write all parts of the document to file
declare filename="/root/document.xml"
printf "Document is saved to:\n${filename}\n"
printf "${partBefore}" > $filename
printf "${partDoneRepeating}" >> $filename
printf "${partAfter}" >> $filename

exit 0