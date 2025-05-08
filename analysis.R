library(ggplot2)

pokemon <- read.csv("pokemon.csv")
head(pokemon)
nrow(pokemon) # Result: 1008 total pokemon

cbPalette <- c("#E69F00", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# 1. Pick a continuous numeric variable from the data set to analyze: Attack
# 2. Histogram of attack values
attackPokemon <- ggplot(pokemon, aes(x = Attack)) + 
  geom_histogram(binwidth = 10, fill = cbPalette[6], color = "black") +
  labs(title = "Distribution of Pokemon Attack Values", x = "Attack", y = "Frequency") +
  theme_minimal()
attackPokemon

# 3. Mean and deviation of this data
meanAttack <- mean(pokemon$Attack)
print(meanAttack)
# Result: 77.16766

sdAttack <- sd(pokemon$Attack)
print(sdAttack)
# Result: 29.75579

# 4.1. Count of how many pokemon fall between 1 sd of the mean
pokemon1SD <- subset(pokemon, Attack > (meanAttack - sdAttack) & Attack < (meanAttack + sdAttack))
countPokemon1SD <- nrow(pokemon1SD)
print(pokemon1SD)
print(countPokemon1SD)
# Result: 669

# 4.2. Count of how many pokemon fall between 2 sd of the mean
pokemon2SD <- subset(pokemon, Attack > (meanAttack - 2 * sdAttack) & Attack < (meanAttack + 2 * sdAttack))
countPokemon2SD <- nrow(pokemon2SD)
print(pokemon2SD)
print(countPokemon2SD)
# Result: 980

# 4.3. Count of how many pokemon fall between 3 sd of the mean
pokemon3SD <- subset(pokemon, Attack > (meanAttack - 3 * sdAttack) & Attack < (meanAttack + 3 * sdAttack))
countPokemon3SD <- nrow(pokemon3SD)
print(pokemon3SD)
print(countPokemon3SD)
# Result: 1007

# 5. Does the data appear to be normally distributed:

# Answer: In my opinion, the data does not appear to be normally distributed. 
# The histogram shows a right-skewed distribution, with a long tail on the right side. 
# This indicates that there are some pokemon with very high attack values, which is 
# not typical of a normal distribution. Also, in a normal distribution, we expect
# about 68% of the data to fall within 1 standard deviation of the mean, but
# in this case, only 669 out of 1008 pokemon fall within that range, which is only about 66.3%.

# 6. Randomly sample a subset of 200 pokemon with replacement
samplePokemon <- sample(pokemon$Attack, 200, replace = TRUE)
samplePokemon
# Result: 200 randomly sampled pokemon attack values

# 6.1. Histogram of the sample to check for normality
attackSample <- ggplot(data.frame(samplePokemon), aes(x = samplePokemon)) + 
  geom_histogram(binwidth = 10, fill = cbPalette[6], color = "black") +
  labs(title = "Distribution of Sampled Pokemon Attack Values", x = "Attack", y = "Frequency") +
  theme_minimal()
attackSample

# 6.2. Mean and deviation of the sample
meanSample <- mean(samplePokemon)
print(meanSample)
# Result: 74.33

sdSample <- sd(samplePokemon)
print(sdSample)
# Result: 27.63912

# 7. Does this subset accurately represent the true population of pokemon:

# Answer: In my opinion, this sample data does not accurately represent the true 
# population of pokemon.
# This is because the sample size is relatively small (200 pokemon) compared to the total 
# population of 1008 pokemon.
# Also, the sample mean and standard deviation are different from the population mean and 
# standard deviation, and the histogram of the sample data also shows a slightly different 
# distribution than the histogram of the population data (it looks a bit more right skewed - but
# in general it changes every time I sample the pokemon population.)
# Thus, a larger sample size would be needed to get a more accurate representation of the population.
# I think a sample size of around 550-600 pokemon would be more appropriate to get a better 
# representation of the population.
