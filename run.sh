#!/bin/bash

echo '---';
echo 'Please choose a script:';
echo '    1) Gifileptic';
echo '    0) Quit';

read -n 1 -s -r index;

while [ $index != 1 ] && [ $index != 0 ]
do
	echo 'Wrong input';
	read -n 1 -s -r index;
done

echo '---';

if [ $index == 1 ]
then
	# === Gifileptic === #
	option_i=1
	option_f=1

	function eraseOptions {
		for i in {1..5}
		do
			tput cuu1;
    		tput el;
    	done
	}

	function printOptions {
		echo 'Gifileptic options:';
		if [ $option_i == 1 ]
		then
			echo '    1) \e[32mInput enabled\e[0m';
		else
			echo '    1) \e[31mInput disabled\e[0m';
		fi
		if [ $option_f == 1 ]
		then
			echo '    2) \e[32mCtrl-c enabled\e[0m';
		else
			echo '    2) \e[31mCtrl-c disabled\e[0m';
		fi
		echo '    9) Cancel';
		echo '    0) \e[5mRun\e[0m';
	}
	
	printOptions;
	read -n 1 -s -r index;

	while [ $index != 9 ] && [ $index != 0 ]
	do
		while [ $index != 1 ] && [ $index != 2 ] && [ $index != 9 ] && [ $index != 0 ]
		do
			eraseOptions;
			printOptions;

			read -n 1 -s -r index;
		done

		if [ $index == 1 ]
		then
			if [ $option_i == 1 ]
			then
				option_i=0
			else
				option_i=1
			fi
		fi

		if [ $index == 2 ]
		then
			if [ $option_f == 1 ]
			then
				option_f=0
			else
				option_f=1
			fi
		fi

		eraseOptions;
		printOptions;

		read -n 1 -s -r index;
	done

	if [ $index == 0 ]
	then
		bash <(curl -s https://raw.githubusercontent.com/MarcVillain/Confloose/master/scripts/gifileptic.sh)
		if [ $option_i == 0 ]
		then
			-i 
		fi
		if [ $option_f == 0 ]
		then
			-f
		fi
	fi

fi