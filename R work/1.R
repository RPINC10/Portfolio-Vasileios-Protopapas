#Main r directory setup 
setwd("~/Business intelligence cwk")
# Loading required packages
library(xlsx)
library(factoextra)
library(NbClust)
library(tidyr)
library(flexclust)
#Reading the winedata
winedata <- read.xlsx("Whitewine_v1.xlsx", sheetIndex = 1)

#Scaling and centralizing the data
winedata <- winedata
#Removes the 12th variable
winedata1 = winedata[,-12]

head(winedata1)

# checking for missing values
sum(is.na(winedata1))
summary(is.na(winedata1))


#Outlier detection by storing all numerical variables in an array structure
col = c("fixed.acidity","volatile.acidity","citric.acid" ,"residual.sugar","chlorides","free.sulfur.dioxide" ,"total.sulfur.dioxide","density","pH","sulphates", "alcohol")
#Using the BoxPlot function to detect any presence of outliers in the data columns.
boxplot(winedata1[,c("fixed.acidity","volatile.acidity","citric.acid" ,"residual.sugar","chlorides","free.sulfur.dioxide" ,"total.sulfur.dioxide","density","pH","sulphates", "alcohol")])

# The box plot identifies all present outliers
# All the outlier data from the numeric variables will now be replaced by NULL values
for (x in c("fixed.acidity","volatile.acidity","citric.acid" ,"residual.sugar","chlorides","free.sulfur.dioxide" ,"total.sulfur.dioxide","density","pH","sulphates","alcohol"))
{
  value = winedata1[,x][winedata1[,x] %in% boxplot.stats(winedata1[,x])$out]
  winedata1[,x][winedata1[,x] %in% value] = NA
}               

#Checking whether the outliers have been replaced by null data or not
as.data.frame(colSums(is.na(winedata1)))

#This is responsible for removing all the null values 
winedata1 = drop_na(winedata1)
as.data.frame(colSums(is.na(winedata1)))

#Output a newly created boxplot without outliers 
boxplot(winedata1)

#Manually finding clusters 1  
wss <- 0
for (i in 1:12){
  wss[i] <-
    sum(kmeans(winedata1, centers=i)$withinss)
}
plot(1:12,
     wss,
     type="b",     ### "b" for both####
     xlab="Number of Clusters",
     ylab="Within groups sum of squares")


#Manually finding clusters in a larger criteria 
set.seed(1234)

nc <- NbClust(winedata1,
              min.nc=2, max.nc=15,
              method="kmeans")

table(nc$Best.n[1,])


barplot(table(nc$Best.n[1,]),    # provide bar charts####
        xlab="Numer of Clusters",
        ylab="Number of Criteria",
        main="Number of Clusters Chosen by 30 Criteria")



# Automatically finding clusters from 3 different methods
fviz_nbclust(winedata1[,-ncol(winedata1)], FUNcluster = kmeans, method = 'wss')
fviz_nbclust(winedata1[,-ncol(winedata1)], FUNcluster = kmeans, method = 'silhouette')
fviz_nbclust(winedata1[,-ncol(winedata1)], FUNcluster = kmeans, method = 'gap_stat')
#From all of the cluster analysis the best are 2,3 and 4

#We now fit wine data to K-Means with k = 3
fit.km <- kmeans(winedata1, 3)
#The original data set will be used to be compared with the 19th column
confuseTable.km <- table(winedata$quality, fit.km$cluster)
confuseTable.km
#Checking specific information relating to the centre clustering
fit.km$centers
randIndex(confuseTable.km)

#We now fit wine data to K-Means with k = 2
fit.km2 <- kmeans(winedata1, 2)
#The original data set will be used to be compared with the 19th column
confuseTable.km <- table(winedata$quality, fit.km2$cluster)
confuseTable.km
#Checking specific information relating to the centre clustering
fit.km2$centers
randIndex(confuseTable.km)

#We now fit wine data to K-Means with k = 4
fit.km3 <- kmeans(winedata1, 4)
#The original data set will be used to be compared with the 19th column
confuseTable.km1 <- table(winedata$quality, fit.km3$cluster)
confuseTable.km1
#Checking specific information relating to the centre clustering
fit.km3$centers
randIndex(confuseTable.km1)

