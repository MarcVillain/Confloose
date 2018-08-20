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
	option_i=0
	option_f=0

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
			echo -e '    1) \e[32mDisable input\e[0m';
		else
			echo -e '    1) \e[31mDisable input\e[0m';
		fi
		if [ $option_f == 1 ]
		then
			echo -e '    2) \e[32mDisable Ctrl-c\e[0m';
		else
			echo -e '    2) \e[31mDisable Ctrl-c\e[0m';
		fi
		echo '    9) Cancel';
		echo -e '    0) \e[5mRun\e[0m';
	}
	
	printOptions;
	read -n 1 -s -r index;

	# While not Run or Quit
	while [ $index != 9 ] && [ $index != 0 ]
	do
		# Ensure option is valid
		while [ $index != 1 ] && [ $index != 2 ] && [ $index != 9 ] && [ $index != 0 ]
		do
			eraseOptions;
			printOptions;

			read -n 1 -s -r index;
		done

		# Switch selected option
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

		# Ask again for input
		eraseOptions;
		printOptions;

		read -n 1 -s -r index;
	done

	# Run
	if [ $index == 0 ]
	then
		args=()
		(( $option_i == 1 )) && args+=( '-i' )
		(( $option_f == 1 )) && args+=( '-f' )
		bash <(curl -s https://raw.githubusercontent.com/MarcVillain/Confloose/master/scripts/gifileptic.sh) "${args[@]}"
		
	fi

fi