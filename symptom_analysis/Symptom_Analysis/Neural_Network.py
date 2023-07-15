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
    "Red inflamed patches,Hot spots,Pain in the infected area,Red streaks on the skin",
    "Limping, Muscle loss, Difficulty sitting"
]

# Vectorize the testing data
test_data_vectorized = vectorizer.transform(test_data)

# Predict the diseases for the testing data
predictions = model.predict(test_data_vectorized)

# Print the predictions
for symptom, prediction in zip(test_data, predictions):
    print(f"Symptoms: {symptom}")
    print(f"Predicted Disease: {prediction}")
    print()
