---
title: "Aggregates in R"
output: html_notebook
---

```{r message = FALSE, error=TRUE}
# loads packages
library(readr)
library(dplyr)
```

```{r message = FALSE, error=TRUE}
# loads data
ad_clicks <- read_csv("ad_clicks.csv")
```

```{r error=TRUE}
# inspects df
head(ad_clicks)
```

```{r error=TRUE}
# finds number of views based on ad source
views_by_utm = ad_clicks %>% group_by(utm_source) %>% summarize(count = n())
views_by_utm



```

```{r error=TRUE}
# finds number of clicks based on ad source
clicks_by_utm = ad_clicks %>% group_by(utm_source,ad_clicked) %>% summarize(count = n())
clicks_by_utm



```

```{r error=TRUE}
# finds percentage of clicks based on ad source

percentage_by_utm = clicks_by_utm %>% group_by(utm_source)%>% mutate(percentage = count/sum(count))
percentage_by_utm
percentage_by_utm = percentage_by_utm%>%filter(ad_clicked == TRUE)
percentage_by_utm

```

```{r error=TRUE}
# shows number of people in each group

experiment_split = ad_clicks %>% group_by(experimental_group)%>% summarize(count = n())
experiment_split


```

```{r error=TRUE}
# finds which group had higher number of clicks

clicks_by_experiment = ad_clicks %>% group_by(ad_clicked, experimental_group) %>% summarize (count = n())
clicks_by_experiment


```

```{r error=TRUE}
# df containing only group A:
a_clicks = ad_clicks%>%filter(experimental_group == 'A')



# df containing only group B:
b_clicks = ad_clicks%>%filter(experimental_group == 'B')


```

```{r error=TRUE}
# finds group A's clicks by day:
a_clicks_by_day = a_clicks %>% group_by(day,ad_clicked)%>%summarize(count = n())
a_clicks_by_day




# finds group B's clicks by day:
b_clicks_by_day = b_clicks %>% group_by(day,ad_clicked)%>%summarize(count = n())
b_clicks_by_day



```

```{r error=TRUE}
# creates df showing percentage of clicks by day for group A:

a_percentage_by_day = a_clicks_by_day %>% group_by(day) %>% mutate(percentage = count/sum(count))%>%filter(ad_clicked ==TRUE)
a_percentage_by_day




# creates df showing percentage of clicks by day for group B:

b_percentage_by_day = b_clicks_by_day %>% group_by(day) %>% mutate(percentage = count/sum(count))%>% filter(ad_clicked == TRUE)
b_percentage_by_day


```
