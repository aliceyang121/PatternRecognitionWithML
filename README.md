# PatternRecognitionWithML

## Inspiration

## What it does

## How I built it

## Challenges I ran into

## Accomplishments that I'm proud of


## What I learned
Initially, we started with an idea of using neural networks such as the Multi-layer Perceptron classifier; we created measures of similarity between different rows of data, and trained the neural network with similarity data from pairs of rows, with the network learning how to determine whether a pair of rows belonged to the same patient. We created measures of similarity for each measure by extracting the longest common substring between the data for a certain measure, such as the first name, for two rows, and inserted it in a 2D "similarity" array as part of the training data. However, we learned that classification algorithms perform sub-optimally with the provided dataset, as it was not balanced and contained far more rows that corresponded to non-matched pairs. This lead to low sensitivity and F1 score, since the algorithm was biased towards classifying pairs as non-matches, which resulted in a high number of false negatives (incorrectly classifying pairs as non-matches). Attempts to balance the training dataset were made, such as creating a new training dataset with 50% matches and 50% non-matches. However, there are no set guidelines on the ratio of matches to non-matches in a training dataset, so we decided to not use this original idea to avoid discrepancies. 


## What's next for Pattern Recognition with Machine Learning
Our Pattern Recognition program could be applied in a multitude of areas in both the medical and non-medical communities. However, there are also improvements that can be made. A Principle Component Analysis (PCA) could be applied to first filter the dataset before it was fed to the PAM clustering algorithm. The PCA would reduce the dimensionality of datasets consisting of many variables correlated with each other, either heavily or lightly, while still retaining the variation present in the dataset. 

Patient matching arose from the transition of paper medical records to electronic health records (EHRs) that help clinicians order medications, document treatment decisions, and review laboratory results. Digital records introduce numerous efficiencies and provide medical professionals with in depth information to base decisions on. However, the sharing of medical data has led to an increased need for accurate patient matching algorithms, as the records for a client can vary across different medical health care providers, or even across different visits to the same provider as humans are prone to slight errors in providing information. The successful exchange of health data relies on this capacity to successfully search each individuals’ records in disparate locations, and know that it corresponds to the same person. 
Deficiencies in matching patients to their records can lead to safety problems, lost records, and other costly mistakes. Our patient matching algorithm offers a high accuracy in matching clients, thus reducing the flaws in current systems. 

Pattern recognition extends beyond patient matching. For example, a previously trained neural network could be implemented in spelling correction. A pre-trained network would be able to accurately predict what word the user is attempting to spell if it was given a training dataset of misspelled words, and the corresponding correct spelling. This is incredibly similar to the dataset we employed in creating this pattern recognition algorithm, and could easily be applied. 
