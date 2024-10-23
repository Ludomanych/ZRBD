#!/bin/bash

# Путь к исходному файлу
input_file="222222.txt"
# Путь к выходному файлу
output_file="extracted_values.txt"

# Удаляем выходной файл, если он существует
[ -f "$output_file" ] && rm "$output_file"

# Извлечение значений типа ('КІБ-2301','КОВАЛЬЧУК МИКОЛА ПЕТРОВИЧ',8,'СТ','213733',to_date('10-JUN-99','DD-MON-RR'),'Францевський МВМ ГУ МВС України в Тернопільській обл.','1545601318')
# Удаление внешних скобок, замена запятых на точки с запятой, и изменение запятой в to_date на запятую
grep -oP "\('([^']*)','([^']*)',\d+,'([^']*)','([^']*)',to_date\('([^']*)','([^']*)'\),'([^']*)','(\d+)'\)" "$input_file" | \
sed -E "s/^\(//; s/\)$//; s/to_date\('([^']*)','([^']*)'\)/to_date(\1,\2)/g; s/,/;/g; s/;to_date;/,to_date/g" >> "$output_file"

echo "Значения успешно извлечены и записаны в $output_file"
