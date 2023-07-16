import csv
import re
import random
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.neural_network import MLPClassifier

# Load the dataset and extract symptoms and diseases
with open('C:/Users/user/Desktop/Repositories/Flutter/symptom_analysis/assets/disease_data.csv', 'r', encoding='utf-8') as file:
    reader = csv.reader(file)
    next(reader)  # Skip the header row
    data = [(', '.join(re.findall(r"'(.*?)'", row[1])), row[0]) for row in reader]

# Shuffle the dataset
random.shuffle(data)

# Split the dataset into symptoms and diseases
symptoms_list, diseases_list = zip(*data)

# Vectorize the symptoms using TF-IDF
vectorizer = TfidfVectorizer()
X = vectorizer.fit_transform(symptoms_list)

# Create and train the neural network model
model = MLPClassifier(hidden_layer_sizes=(100,), max_iter=1000)
model.fit(X, diseases_list)

# Print the list of symptoms
print("List of Symptoms:")
for symptom in symptoms_list:
    print(symptom)

# Manually input the testing data
test_data = [
    'Increased thirst and urination, Dermatitis on the paw pads, Loss of appetite, Jaundice',
    'Swelling in the ear, Scratching, Head shaking, Barking, Pain in ear',
    'Fever, Inflammation of the blood vessels, Disorientation, Coughing, Dilated pupils, Dull coat'
]

# Vectorize the testing data
test_data_vectorized = vectorizer.transform(test_data)

# Predict the diseases for the testing data
predictions = model.predict(test_data_vectorized)
probabilities = model.predict_proba(test_data_vectorized)

# Print the list of symptoms
print("\nSymptoms:")
for symptom in test_data:
    print(symptom)

# Print the top 3 predicted diseases and their accuracies
for symptom, prediction, probability in zip(test_data, predictions, probabilities):
    top_3_indices = probability.argsort()[-3:][::-1]
    top_3_diseases = model.classes_[top_3_indices]
    top_3_accuracies = probability[top_3_indices]

    print(f"\nSymptoms: {symptom}")
    for disease, accuracy in zip(top_3_diseases, top_3_accuracies):
        print(f"Predicted Disease: {disease} (Accuracy: {accuracy:.2f})")
