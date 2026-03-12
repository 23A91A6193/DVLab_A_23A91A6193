data(mtcars)
str(mtcars)
head(mtcars)

# Basic heatmap
heatmap(as.matrix(mtcars))

# Heatmap with title
heatmap(as.matrix(mtcars), main = "Heatmap of mtcars Dataset")

# Custom color heatmap
colors <- colorRampPalette(c("blue", "yellow", "red"))(50)
heatmap(as.matrix(mtcars), col = colors, main = "Custom Color Heatmap")

# Correlation heatmap using base R
corr_matrix <- cor(mtcars)
heatmap(
  corr_matrix,
  col = colorRampPalette(c("blue", "white", "red"))(50),
  main = "Correlation Heatmap of mtcars"
)

# Convert mtcars to long format
install.packages("reshape2")
library(reshape2)
mtcars$Car <- rownames(mtcars)
mtcars_long <- melt(mtcars, id.vars = "Car")
View(mtcars_long)

# ggplot heatmaps
library(ggplot2)

# Simple heatmap
ggplot(mtcars_long, aes(x = variable, y = Car, fill = value)) +
  geom_tile()

# Heatmap with custom gradient
ggplot(mtcars_long, aes(x = variable, y = Car, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "red") +
  theme_minimal() +
  labs(title = "Heatmap of mtcars Dataset")

# Heatmap with viridis colors
ggplot(mtcars_long, aes(x = variable, y = Car, fill = value)) +
  geom_tile() +
  scale_fill_viridis_c() +
  theme_minimal() +
  labs(title = "Viridis Heatmap of mtcars Dataset")

# Correlation matrix in long format
corr_matrix <- cor(mtcars[, sapply(mtcars, is.numeric)])
corr_long <- melt(corr_matrix)

# Correlation heatmap
ggplot(corr_long, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0) +
  theme_minimal() +
  labs(title = "Correlation Heatmap of mtcars")

# Correlation heatmap with values
ggplot(corr_long, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  geom_text(aes(label = round(value, 2))) +
  scale_fill_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0) +
  theme_minimal() +
  labs(title = "Correlation Heatmap with Values")