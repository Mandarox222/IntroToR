---
title: "Cleaning US Census Data"
output: html_notebook
---

```{r message=FALSE, warning=FALSE, error=TRUE}
# loads libraries

library(dplyr)
library(readr)
library(tidyr)

```

```{r message=FALSE, warning=FALSE, error=TRUE}
# loads CSVs
files = list.files(pattern = 'states_.*csv')
df_list = lapply(files,read_csv)
us_census = bind_rows(df_list)

```

```{r error=TRUE}
# inspects data
names(us_census)
str(us_census)
head(us_census)

```

```{r error=TRUE}
# drops X1 column
us_census = us_census %>% select(-X1)
head(us_census)

```

```{r error=TRUE}
# removes % from race columns

us_census = us_census %>%mutate(Hispanic = gsub('\\%','',Hispanic))%>%
mutate(White = gsub('\\%','',White))%>%
mutate(Black = gsub('\\%','',Black))%>%
mutate(Native = gsub('\\%','',Native))%>%
mutate(Asian = gsub('\\%','',Asian))%>%
mutate(Pacific = gsub('\\%','',Pacific))
head(us_census)





```

```{r error=TRUE}
# remove $ from Income column

us_census = us_census %>% mutate(Income = gsub ('\\$','',Income))
head(us_census)
```

```{r error=TRUE}
# separate GenderPop column
us_census = us_census %>% separate(GenderPop,c('male_pop','female_pop'),'_')
head(us_census)


```

```{r error=TRUE}
# clean male and female population columns
us_census = us_census %>% mutate(male_pop = gsub('\\M','',male_pop)) %>% mutate(female_pop = gsub('\\F','',female_pop))
head(us_census)



```

```{r error=TRUE}
# update column data types to numeric

us_census = us_census %>% mutate(Hispanic = as.numeric(Hispanic), White = as.numeric(White),Black = as.numeric(Black), Native = as.numeric(Native), Asian = as.numeric(Asian), Pacific = as.numeric(Pacific), Income = as.numeric(Income), male_pop = as.numeric(male_pop), female_pop = as.numeric(female_pop))
head(us_census)









```

```{r error=TRUE}
# update values of race columns to decimal values

us_census = us_census %>% mutate(Hispanic = Hispanic*.01, White = White*.01, Black = Black*.01, Native = Native * .01, Asian = Asian*.01, Pacific = Pacific*.01)
head(us_census)







```

```{r error=TRUE}
# check for duplicate rows
us_census %>% duplicated() %>% table()


```

```{r error=TRUE}
# remove duplicate rows
us_census = us_census %>% distinct()

```

```{r error=TRUE}
# check for duplicate rows

us_census %>% duplicated() %>% table()

```

```{r error=TRUE}
# clean data frame
head(us_census)
```
