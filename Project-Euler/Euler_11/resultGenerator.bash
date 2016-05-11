filetemp="raw_data/julia1000-2.tmp" 							#Use as temporary storage
filesave="raw_data/julia1000-2.rslt"							#Saves results to this file
ARR=()
for i in {1..10}												#Executes five times
do
	rslt=$(\time -f "\t%S \t%U" -o $filetemp julia Euler\ 11.jl 1000 2)	#Execute everything after $filetemp and saves time to temp storage
	readarray timeResult < $filetemp							#Reads the two results to array
	IFS=' ' read -r -a timeArr <<< $timeResult					#Removes spacing

	timeArr[0]="$(echo -e "${timeArr[0]}" | tr -d '.')"	#Removes dot
	timeArr[1]="$(echo -e "${timeArr[1]}" | tr -d '.')"	
	timeArr[0]=$(julia -e "print(${timeArr[0]}*10)")			#Adds 10 to get to ms
	timeArr[1]=$(julia -e "print(${timeArr[1]}*10)")							
	#echo "${timeArr[0]}"									#Prints result in ms.
	#echo "${timeArr[1]}"									

	ARR[i]=$(julia -e "print(${timeArr[0]}+${timeArr[1]})") #Saves result in file
done
#echo ${ARR[*]}
mean=0
for i in ${ARR[@]};
do
	mean=$(julia -e "print(${mean}+${i})")
done
echo $(julia -e "print(div(${mean}, ${#ARR[@]}))") &>> $filesave
