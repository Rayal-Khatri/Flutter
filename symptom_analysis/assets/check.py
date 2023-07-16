import pandas as pd
# Load the dataset
df = pd.read_csv('C:/Users/user/Desktop/Repositories/Flutter/symptom_analysis/assets/disease_data.csv')
# Extract the symptoms column
symptoms = df['Symptoms']

# Create a set to store unique symptoms
all_symptoms = set()

# Iterate through the symptoms and add them to the set
for s in symptoms:
    # Remove the brackets and quotes from the symptom string
    s = s.replace("[", "").replace("]", "").replace("'", "")
    # Split the symptom string by commas
    symptoms_list = [symptom.strip() for symptom in s.split(",")]
    # Add each symptom to the set
    all_symptoms.update(symptoms_list)

# Convert the set to a list and sort it
all_symptoms = sorted(list(all_symptoms))

# Print the list of symptoms
print("List of Symptoms:")
for symptom in all_symptoms:
    print(symptom)
