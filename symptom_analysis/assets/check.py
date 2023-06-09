#with open('D:/Rayal/Flutter/Flutter/symptom_analysis/assets/disease_data.csv', 'r', encoding='utf-8') as file:
input_file = 'D:/Rayal/Flutter/Flutter/symptom_analysis/assets/disease_data.csv'
output_file = 'D:/Rayal/Flutter/Flutter/symptom_analysis/assets/disease_data2.csv'

with open(input_file, 'r', encoding='utf-8') as file:
    lines = file.readlines()

# Remove inconsistent quotation marks and strip whitespace
updated_lines = [line.replace('"', '').strip() for line in lines]

# Write the updated dataset to a new file
with open(output_file, 'w', encoding='utf-8') as file:
    file.write('\n'.join(updated_lines))

print("Dataset formatting updated successfully.")



