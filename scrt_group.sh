#!/bin/bash

# Путь к исходному файлу
input_file="222222.txt"
# Путь к выходному файлу
output_file="extracted_values.txt"

# Удаляем выходной файл, если он существует
[ -f "$output_file" ] && rm "$output_file"

# Извлечение значений типа (3,'КІБ-20'), удаление скобок и запись в выходной файл
grep -oP "\(\d+,'[^']+'\)" "$input_file" | sed 's/[()]//g' >> "$output_file"

echo "Значения успешно извлечены и записаны в $output_file"

