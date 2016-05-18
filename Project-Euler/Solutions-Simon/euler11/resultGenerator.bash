filetemp="raw_data/python1000-2.tmp" 							#Use as temporary storage
filesave="raw_data/python1000-2.rslt"							#Saves results to this file
ARR=()
for i in {1..10}												#Executes five times
do
	rslt=$(\time -f "\t%S \t%U" -o $filetemp python euler11.py 1000 2)	#Execute everything after $filetemp and saves time to temp storage
	readarray timeResult < $filetemp							#Reads the two results to array
	IFS=' ' read -r -a timeArr <<< $timeResult					#Removes spacing

	timeArr[0]="$(echo -e "${timeArr[0]}" | tr -d '.')"	#Removes dot
	timeArr[1]="$(echo -e "${timeArr[1]}" | tr -d '.')"	
	timeArr[0]=$(julia -e "print(${timeArr[0]}*10)")			#Adds 10 to get to ms
	timeArr[1]=$(julia -e "print(${timeArr[1]}*10)")							
	#echo "${timeArr[0]}"									#Prints result in ms.
	#echo "${timeArr[1]}"									

	ARR[i]=$(julia -e "print(${timeArr[0]}+${timeArr[1]})") #Saves result in file
	echo "I: $i done"
done
#echo ${ARR[*]}
mean=0
for i in ${ARR[@]};
do
	mean=$(julia -e "print(${mean}+${i})")
done
echo $(julia -e "print(div(${mean}, ${#ARR[@]}))") &>> $filesave

filetemp="raw_data/python1000-5.tmp" 							#Use as temporary storage
filesave="raw_data/python1000-5.rslt"							#Saves results to this file
ARR=()
for i in {1..10}												#Executes five times
do
	rslt=$(\time -f "\t%S \t%U" -o $filetemp python euler11.py 1000 5)	#Execute everything after $filetemp and saves time to temp storage
	readarray timeResult < $filetemp							#Reads the two results to array
	IFS=' ' read -r -a timeArr <<< $timeResult					#Removes spacing

	timeArr[0]="$(echo -e "${timeArr[0]}" | tr -d '.')"	#Removes dot
	timeArr[1]="$(echo -e "${timeArr[1]}" | tr -d '.')"	
	timeArr[0]=$(julia -e "print(${timeArr[0]}*10)")			#Adds 10 to get to ms
	timeArr[1]=$(julia -e "print(${timeArr[1]}*10)")							
	#echo "${timeArr[0]}"									#Prints result in ms.
	#echo "${timeArr[1]}"									

	ARR[i]=$(julia -e "print(${timeArr[0]}+${timeArr[1]})") #Saves result in file
	echo "I: $i done"
done
#echo ${ARR[*]}
mean=0
for i in ${ARR[@]};
do
	mean=$(julia -e "print(${mean}+${i})")
done
echo $(julia -e "print(div(${mean}, ${#ARR[@]}))") &>> $filesave

filetemp="raw_data/python1000-10.tmp" 							#Use as temporary storage
filesave="raw_data/python1000-10.rslt"							#Saves results to this file
ARR=()
for i in {1..10}												#Executes five times
do
	rslt=$(\time -f "\t%S \t%U" -o $filetemp python euler11.py 1000 10)	#Execute everything after $filetemp and saves time to temp storage
	readarray timeResult < $filetemp							#Reads the two results to array
	IFS=' ' read -r -a timeArr <<< $timeResult					#Removes spacing

	timeArr[0]="$(echo -e "${timeArr[0]}" | tr -d '.')"	#Removes dot
	timeArr[1]="$(echo -e "${timeArr[1]}" | tr -d '.')"	
	timeArr[0]=$(julia -e "print(${timeArr[0]}*10)")			#Adds 10 to get to ms
	timeArr[1]=$(julia -e "print(${timeArr[1]}*10)")							
	#echo "${timeArr[0]}"									#Prints result in ms.
	#echo "${timeArr[1]}"									

	ARR[i]=$(julia -e "print(${timeArr[0]}+${timeArr[1]})") #Saves result in file
	echo "I: $i done"
done
#echo ${ARR[*]}
mean=0
for i in ${ARR[@]};
do
	mean=$(julia -e "print(${mean}+${i})")
done
echo $(julia -e "print(div(${mean}, ${#ARR[@]}))") &>> $filesave

#5000
filetemp="raw_data/python5000-2.tmp" 							#Use as temporary storage
filesave="raw_data/python5000-2.rslt"							#Saves results to this file
ARR=()
for i in {1..10}												#Executes five times
do
	rslt=$(\time -f "\t%S \t%U" -o $filetemp python euler11.py 5000 2)	#Execute everything after $filetemp and saves time to temp storage
	readarray timeResult < $filetemp							#Reads the two results to array
	IFS=' ' read -r -a timeArr <<< $timeResult					#Removes spacing

	timeArr[0]="$(echo -e "${timeArr[0]}" | tr -d '.')"	#Removes dot
	timeArr[1]="$(echo -e "${timeArr[1]}" | tr -d '.')"	
	timeArr[0]=$(julia -e "print(${timeArr[0]}*10)")			#Adds 10 to get to ms
	timeArr[1]=$(julia -e "print(${timeArr[1]}*10)")							
	#echo "${timeArr[0]}"									#Prints result in ms.
	#echo "${timeArr[1]}"									

	ARR[i]=$(julia -e "print(${timeArr[0]}+${timeArr[1]})") #Saves result in file
	echo "I: $i done"
done
#echo ${ARR[*]}
mean=0
for i in ${ARR[@]};
do
	mean=$(julia -e "print(${mean}+${i})")
done
echo $(julia -e "print(div(${mean}, ${#ARR[@]}))") &>> $filesave

filetemp="raw_data/python5000-5.tmp" 							#Use as temporary storage
filesave="raw_data/python5000-5.rslt"							#Saves results to this file
ARR=()
for i in {1..10}												#Executes five times
do
	rslt=$(\time -f "\t%S \t%U" -o $filetemp python euler11.py 5000 5)	#Execute everything after $filetemp and saves time to temp storage
	readarray timeResult < $filetemp							#Reads the two results to array
	IFS=' ' read -r -a timeArr <<< $timeResult					#Removes spacing

	timeArr[0]="$(echo -e "${timeArr[0]}" | tr -d '.')"	#Removes dot
	timeArr[1]="$(echo -e "${timeArr[1]}" | tr -d '.')"	
	timeArr[0]=$(julia -e "print(${timeArr[0]}*10)")			#Adds 10 to get to ms
	timeArr[1]=$(julia -e "print(${timeArr[1]}*10)")							
	#echo "${timeArr[0]}"									#Prints result in ms.
	#echo "${timeArr[1]}"									

	ARR[i]=$(julia -e "print(${timeArr[0]}+${timeArr[1]})") #Saves result in file
	echo "I: $i done"
done
#echo ${ARR[*]}
mean=0
for i in ${ARR[@]};
do
	mean=$(julia -e "print(${mean}+${i})")
done
echo $(julia -e "print(div(${mean}, ${#ARR[@]}))") &>> $filesave

filetemp="raw_data/python5000-10.tmp" 							#Use as temporary storage
filesave="raw_data/python5000-10.rslt"							#Saves results to this file
ARR=()
for i in {1..10}												#Executes five times
do
	rslt=$(\time -f "\t%S \t%U" -o $filetemp python euler11.py 5000 10)	#Execute everything after $filetemp and saves time to temp storage
	readarray timeResult < $filetemp							#Reads the two results to array
	IFS=' ' read -r -a timeArr <<< $timeResult					#Removes spacing

	timeArr[0]="$(echo -e "${timeArr[0]}" | tr -d '.')"	#Removes dot
	timeArr[1]="$(echo -e "${timeArr[1]}" | tr -d '.')"	
	timeArr[0]=$(julia -e "print(${timeArr[0]}*10)")			#Adds 10 to get to ms
	timeArr[1]=$(julia -e "print(${timeArr[1]}*10)")							
	#echo "${timeArr[0]}"									#Prints result in ms.
	#echo "${timeArr[1]}"									

	ARR[i]=$(julia -e "print(${timeArr[0]}+${timeArr[1]})") #Saves result in file
	echo "I: $i done"
done
#echo ${ARR[*]}
mean=0
for i in ${ARR[@]};
do
	mean=$(julia -e "print(${mean}+${i})")
done
echo $(julia -e "print(div(${mean}, ${#ARR[@]}))") &>> $filesave

#10000
filetemp="raw_data/python10000-2.tmp" 							#Use as temporary storage
filesave="raw_data/python10000-2.rslt"							#Saves results to this file
ARR=()
for i in {1..10}												#Executes five times
do
	rslt=$(\time -f "\t%S \t%U" -o $filetemp python euler11.py 10000 2)	#Execute everything after $filetemp and saves time to temp storage
	readarray timeResult < $filetemp							#Reads the two results to array
	IFS=' ' read -r -a timeArr <<< $timeResult					#Removes spacing

	timeArr[0]="$(echo -e "${timeArr[0]}" | tr -d '.')"	#Removes dot
	timeArr[1]="$(echo -e "${timeArr[1]}" | tr -d '.')"	
	timeArr[0]=$(julia -e "print(${timeArr[0]}*10)")			#Adds 10 to get to ms
	timeArr[1]=$(julia -e "print(${timeArr[1]}*10)")							
	#echo "${timeArr[0]}"									#Prints result in ms.
	#echo "${timeArr[1]}"									

	ARR[i]=$(julia -e "print(${timeArr[0]}+${timeArr[1]})") #Saves result in file
	echo "I: $i done"
done
#echo ${ARR[*]}
mean=0
for i in ${ARR[@]};
do
	mean=$(julia -e "print(${mean}+${i})")
done
echo $(julia -e "print(div(${mean}, ${#ARR[@]}))") &>> $filesave

filetemp="raw_data/python10000-5.tmp" 							#Use as temporary storage
filesave="raw_data/python10000-5.rslt"							#Saves results to this file
ARR=()
for i in {1..10}												#Executes five times
do
	rslt=$(\time -f "\t%S \t%U" -o $filetemp python euler11.py 10000 5)	#Execute everything after $filetemp and saves time to temp storage
	readarray timeResult < $filetemp							#Reads the two results to array
	IFS=' ' read -r -a timeArr <<< $timeResult					#Removes spacing

	timeArr[0]="$(echo -e "${timeArr[0]}" | tr -d '.')"	#Removes dot
	timeArr[1]="$(echo -e "${timeArr[1]}" | tr -d '.')"	
	timeArr[0]=$(julia -e "print(${timeArr[0]}*10)")			#Adds 10 to get to ms
	timeArr[1]=$(julia -e "print(${timeArr[1]}*10)")							
	#echo "${timeArr[0]}"									#Prints result in ms.
	#echo "${timeArr[1]}"									

	ARR[i]=$(julia -e "print(${timeArr[0]}+${timeArr[1]})") #Saves result in file
	echo "I: $i done"
done
#echo ${ARR[*]}
mean=0
for i in ${ARR[@]};
do
	mean=$(julia -e "print(${mean}+${i})")
done
echo $(julia -e "print(div(${mean}, ${#ARR[@]}))") &>> $filesave

filetemp="raw_data/python10000-10.tmp" 							#Use as temporary storage
filesave="raw_data/python10000-10.rslt"							#Saves results to this file
ARR=()
for i in {1..10}												#Executes five times
do
	rslt=$(\time -f "\t%S \t%U" -o $filetemp python euler11.py 10000 10)	#Execute everything after $filetemp and saves time to temp storage
	readarray timeResult < $filetemp							#Reads the two results to array
	IFS=' ' read -r -a timeArr <<< $timeResult					#Removes spacing

	timeArr[0]="$(echo -e "${timeArr[0]}" | tr -d '.')"	#Removes dot
	timeArr[1]="$(echo -e "${timeArr[1]}" | tr -d '.')"	
	timeArr[0]=$(julia -e "print(${timeArr[0]}*10)")			#Adds 10 to get to ms
	timeArr[1]=$(julia -e "print(${timeArr[1]}*10)")							
	#echo "${timeArr[0]}"									#Prints result in ms.
	#echo "${timeArr[1]}"									

	ARR[i]=$(julia -e "print(${timeArr[0]}+${timeArr[1]})") #Saves result in file
	echo "I: $i done"
done
#echo ${ARR[*]}
mean=0
for i in ${ARR[@]};
do
	mean=$(julia -e "print(${mean}+${i})")
done
echo $(julia -e "print(div(${mean}, ${#ARR[@]}))") &>> $filesave
