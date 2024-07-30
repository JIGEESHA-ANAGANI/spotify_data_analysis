Spotify Top Music Analysis and Genre Prediction

This repository contains R scripts for analyzing and predicting trends in Spotify's top music dataset. The analysis includes:

    Exploratory Data Analysis (EDA):
        Visualizations of the number of top songs per year.
        Identification of the top 10 most popular artists and genres.

    Model Building:
        Preparation of the dataset for genre prediction using classification models.
        Splitting the data into training and testing sets.
        Training a decision tree model (rpart) to predict the genre of songs based on various attributes.

    Model Evaluation:
        Performance evaluation of the genre prediction model using confusion matrices.

    Regression Analysis:
        Regression modeling to explore relationships between song attributes (e.g., energy, danceability, acousticness) and popularity.
        Visualization of these relationships using scatter plots with fitted regression lines.
Files:

    spotify_top_music.csv: Dataset used for analysis.
    spotify_analysis.R: R script containing the analysis and modeling code.

How to Use:

    Clone the repository to your local machine.
    Install required R packages (tidyverse, caret).
    Run spotify_analysis.R to reproduce the analysis and modeling steps.
    View results in the generated plots and review model performance metrics.

Requirements:

    R (version 3.5 or higher)
    R packages: tidyverse, caret

Note:

    Adjust file paths as needed if the dataset (spotify_top_music.csv) is located in a different directory.
