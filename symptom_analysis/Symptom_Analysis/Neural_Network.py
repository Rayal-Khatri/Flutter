# Import the required libraries
import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.neural_network import MLPClassifier

# Load the dataset
df = pd.read_csv('C:/Users/user/Desktop/Repositories/Flutter/symptom_analysis/assets/disease_data.csv')


# Shuffle the dataset
df = df.sample(frac=1).reset_index(drop=True)

# Split the dataset into features (X) and labels (y)
X = df['Symptoms']
y = df['Disease']

# Vectorize the symptoms using TF-IDF
vectorizer = TfidfVectorizer()
X = vectorizer.fit_transform(X)

# Create and train the neural network model
model = MLPClassifier(hidden_layer_sizes=(100,), max_iter=1000)
model.fit(X, y)

# Manually input the testing data
test_data = [
    'Increased thirst and urination,Dermatitis on the paw pads,Loss of appetite, Jaundice',
    "Swelling in the ear, Scratching,Head shakin, barking, pain in ear",
    "Fever, Inflammation of the blood vessels,Disorientation,Coughing,Dilated pupils,Dull coat"
]

# Vectorize the testing data
test_data_vectorized = vectorizer.transform(test_data)

# Predict the diseases for the testing data
predictions = model.predict(test_data_vectorized)
probabilities = model.predict_proba(test_data_vectorized)

# Print the top 3 predicted diseases and their accuracies
for symptom, prediction, probability in zip(test_data, predictions, probabilities):
    top_3_indices = probability.argsort()[-3:][::-1]
    top_3_diseases = model.classes_[top_3_indices]
    top_3_accuracies = probability[top_3_indices]
    
    print(f"Symptoms: {symptom}")
    for disease, accuracy in zip(top_3_diseases, top_3_accuracies):
        print(f"Predicted Disease: {disease} (Accuracy: {accuracy:.2f})")
    print()
