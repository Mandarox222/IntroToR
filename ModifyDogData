---
title: "Modifying Data Frames in R"
output: html_notebook
---

```{r message=FALSE, warning=FALSE}
# load libraries
library(readr)
library(dplyr)
```

```{r message=FALSE}
# load data frame
dogs <- read_csv('dogs.csv')
```

```{r}
# inspect data frame
head(dogs)
```

```{r}
# add new columns, drop existing columns and arrange
dogs = dogs%>% transmute(breed = breed, height_average_feet = (height_low_inches+height_high_inches)/2/12, popularity_change_15_to_16 = rank_2016-rank_2015)
head(dogs)
dogs = dogs %>% arrange(desc(popularity_change_15_to_16))





```
