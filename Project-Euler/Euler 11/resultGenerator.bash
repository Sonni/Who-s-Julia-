filetemp="resultGenerator.tmp" 									#Use as temporary storage
filesave="resultGenerator.rslt"									#Saves results to this file
for i in {1..5}													#Executes five times
do
	\time -f "\t%S \t%U" -o $filetemp python euler11.py			#Execute everything after $filetemp and saves time to temp storage
	readarray timeResult < $filetemp							#Reads the two results to array
	IFS=' ' read -r -a timeArr <<< $timeResult					#Removes spacing
	for j in {0..1}												#Runs througt the two results
	do
		timeArr[$j]="$(echo -e "${timeArr[$j]}" | tr -d '.')"	#Removes dot
		timeArr[$j]="$((${timeArr[j]}*10))"						#Adds 10 to get to ms
		echo "${timeArr[j]}"									#Prints result in ms.
	done
	echo "$((${timeArr[0]}+${timeArr[1]}))" &>> $filesave		#Saves result in file
done

