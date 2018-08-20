#!/bin/bash

echo 'Please choose a script:';
echo '    1) gifileptic';
echo '    0) quit';

read -n 1 -s -r index;

while [ $index != 1 ] && [ $index != 0 ]
do
	echo 'Wrong input';
	read -n 1 -s -r index;
done

if [ index == 1 ]
then
	bash <(curl -s https://raw.githubusercontent.com/MarcVillain/Confloose/master/gifileptic.sh);
fi