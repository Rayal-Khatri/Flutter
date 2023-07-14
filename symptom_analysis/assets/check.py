import csv

# Specify the paths of the input and output files
input_file = 'C:/Users/user/Desktop/Repositories/Flutter/symptom_analysis/assets/disease_data.csv'
output_file = 'C:/Users/user/Desktop/Repositories/Flutter/symptom_analysis/assets/disease_data_utf8.csv'

# Read the dataset using Windows-1252 encoding and write it in UTF-8 encoding
with open(input_file, 'r', encoding='Windows-1252') as input_csv, open(output_file, 'w', encoding='utf-8', newline='') as output_csv:
    writer = csv.writer(output_csv)
    for row in csv.reader(input_csv):
        writer.writerow(row)

print("Dataset converted successfully!")
