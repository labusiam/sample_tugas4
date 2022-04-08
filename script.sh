#!/usr/bin/bash

wget https://github.com/labusiam/dataset/raw/main/weather_data.xlsx

FILE=/home/faizal/c_maret/tugas/tugas4/weather_data.xlsx

if [ -f "$FILE"  ];
then
	echo "$FILE exists."
	in2csv weather_data.xlsx --sheet "weather_2014" > weather_2014.csv
	in2csv weather_data.xlsx --sheet "weather_2015" > weather_2015.csv
else
	echo "$FILE didn't Exists"
fi

FILE_WEATHER_2014=/home/faizal/c_maret/tugas/tugas4/weather_2014.csv
FILE_WEATHER_2015=/home/faizal/c_maret/tugas/tugas4/weather_2015.csv

if [[ -f "$FILE_WEATHER_2014" && "$FILE_WEATHER_2015" ]];
then 
	echo "The Files are exists"
	csvstack weather_2014.csv weather_2015.csv > weather.csv
	rm weather_data.xlsx
else
	echo "The Files didn't exists"
fi

[[ -f /home/faizal/c_maret/tugas/tugas4/weather.csv ]] && cat weather.csv | sample -r 0.3 > sample_weather.csv
