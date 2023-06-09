import csv
def convert_dataset_encoding(dataset_path, output_path):
    with open(dataset_path, 'r', encoding='latin-1') as input_file:
        data = input_file.read()
    
    with open(output_path, 'w', encoding='utf-8') as output_file:
        output_file.write(data)

# Example usage
dataset_path = 'D:/Rayal/Flutter/Flutter/symptom_analysis/assets/disease_data.csv'
output_path = 'D:/Rayal/Flutter/Flutter/symptom_analysis/assets/disease_data.1csv'
convert_dataset_encoding(dataset_path, output_path)
print("Dataset converted successfully!")

