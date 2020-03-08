library(cluster)
library(dplyr)
library(ggplot2)
library(readr)
library(Rtsne)

# Load Data
df <- read.csv("patient3.csv")

#Computer Gower Distance
gower_dist <- daisy(df, metric = "gower")
gower_mat <- as.matrix(gower_dist)

# Check
# df[which(gower_mat == max(gower_mat[gower_mat != max(gower_mat)]), arr.ind = TRUE)[1, ], ]
# df[which(gower_mat == max(gower_mat[gower_mat != max(gower_mat)]), arr.ind = TRUE)[1, ], ]

# Finding best number of clusters
sil_width <- c(NA)
for(i in 2:100){  
  pam_fit <- pam(gower_dist, diss = TRUE, k = i, cluster.only = FALSE)  
  sil_width[i] <- pam_fit$silinfo$avg.width
}
plot(1:100, sil_width,
     xlab = "Number of clusters",
     ylab = "Silhouette Width")
lines(1:100, sil_width)

# Summary of clusters
k <- 65
pam_fit <- pam(gower_dist, diss = TRUE, k, keep.diss = TRUE, cluster.only = FALSE)
pam_results <- df %>%
  mutate(cluster = pam_fit$clustering) %>%
  group_by(cluster) %>%
  do(the_summary = summary(.))

pam_fit$silinfo

# Visualization
tsne_obj <- Rtsne(gower_dist, is_distance = TRUE)
tsne_data <- tsne_obj$Y %>%
  data.frame() %>%
  setNames(c("X", "Y")) %>%
  mutate(cluster = factor(pam_fit$clustering))
ggplot(aes(x = X, y = Y), data = tsne_data) +
  geom_point(aes(color = cluster))
