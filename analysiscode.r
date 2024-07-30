## Data dictionary
suppressPackageStartupMessages(library(tidyverse))

spotify = read_csv('data/spotify_top_music.csv', show_col_types = FALSE)

spotify
suppressPackageStartupMessages(library(tidyverse))
summary(spotify)



summary(spotify)



spotify %>%
  count(year) %>%
  ggplot(aes(x = year, y = n)) +
  geom_col() +
  labs(title = "Number of Top Songs by Year", x = "Year", y = "Count")


spotify %>%
  count(artist, sort = TRUE) %>%
  top_n(10) %>%
  ggplot(aes(x = reorder(artist, n), y = n)) +
  geom_col() +
  coord_flip() +
  labs(title = "Top 10 Most Popular Artists", x = "Artist", y = "Number of Top Songs")



spotify %>%
  count(`top genre`, sort = TRUE) %>%
  top_n(10) %>%
  ggplot(aes(x = reorder(`top genre`, n), y = n)) +
  geom_col() +
  coord_flip() +
  labs(title = "Top 10 Most Popular Genres", x = "Genre", y = "Number of Top Songs")



spotify %>%
  gather(key = "attribute", value = "value", bpm:pop) %>%
  ggplot(aes(x = year, y = value, color = attribute)) +
  geom_smooth(se = FALSE) +
  facet_wrap(~ attribute, scales = "free_y") +
  labs(title = "Trends in Song Attributes Over the Years", x = "Year", y = "Value")


library(caret)
set.seed(123)

# Prepare the data
spotify_model <- spotify %>%
  select(-title, -artist) %>%
  mutate(`top genre` = as.factor(`top genre`))

# Split the data into training and testing sets
trainIndex <- createDataPartition(spotify_model$`top genre`, p = .8, 
                                  list = FALSE, 
                                  times = 1)
spotifyTrain <- spotify_model[ trainIndex,]
spotifyTest  <- spotify_model[-trainIndex,]

# Train the model
model <- train(`top genre` ~ ., data = spotifyTrain, method = "rpart")

# Make predictions
predictions <- predict(model, spotifyTest)

# Evaluate the model
confusionMatrix(predictions, spotifyTest$`top genre`)
spotify %>%
  count(`top genre`, sort = TRUE) %>%
  ggplot(aes(x = reorder(`top genre`, n), y = n)) +
  geom_col() +
  coord_flip() +
  labs(title = "Distribution of Songs by Genre", x = "Genre", y = "Count")



spotify %>%
  count(artist, sort = TRUE) %>%
  ggplot(aes(x = reorder(artist, n), y = n)) +
  geom_col() +
  coord_flip() +
  labs(title = "Distribution of Songs by Artist", x = "Artist", y = "Count")




popularity_model <- lm(pop ~ bpm + nrgy + dnce + dB + live + val + dur + acous + spch, data = spotify)

# Summary of the model
summary(popularity_model)



ggplot(spotify, aes(x = nrgy, y = pop)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Popularity vs. Energy", x = "Energy", y = "Popularity")



ggplot(spotify, aes(x = dnce, y = pop)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Popularity vs. Danceability", x = "Danceability", y = "Popularity")



ggplot(spotify, aes(x = acous, y = pop)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Popularity vs. Acousticness", x = "Acousticness", y = "Popularity")


library(caret)




# Prepare the data
spotify_model <- spotify %>%
  select(-title, -artist) %>%
  mutate(`top genre` = as.factor(`top genre`))



set.seed(123)  # For reproducibility

# Split the data into training and testing sets
trainIndex <- createDataPartition(spotify_model$`top genre`, p = .8, 
                                  list = FALSE, 
                                  times = 1)
spotifyTrain <- spotify_model[trainIndex,]
spotifyTest  <- spotify_model[-trainIndex,]


# Train the model
model <- train(`top genre` ~ ., data = spotifyTrain, method = "rpart")


# Make predictions
predictions <- predict(model, spotifyTest)


# Evaluate the model
confusionMatrix(predictions, spotifyTest$`top genre`)
