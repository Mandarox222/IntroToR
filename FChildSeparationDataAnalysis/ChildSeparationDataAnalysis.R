---
title: "ACLU Child Separations"
output: html_notebook
---

```{r message=FALSE, warning=FALSE, error=TRUE}
# loads libraries
library(readr)
library(dplyr)

```

```{r error=TRUE}
# loads data
aclu = read_csv('aclu_separations.csv')
```

```{r error=TRUE}
# inspects data
aclu %>% head()
aclu %>% summary()

```

```{r error=TRUE}
# removes address column
aclu = aclu%>% select(-addr)
head(aclu)


```

```{r error=TRUE}
# views columns of data frame
print(names(aclu))
```

```{r error=TRUE}
# renames columns for readability 
aclu = aclu%>% rename(city = program_city, state = program_state, number_children = n, longitude = lon, latitude = lat)
print(names(aclu))






```

```{r error=TRUE}
# creates new column containing distance from border in latitude

border_latitude <- 25.83
aclu = aclu%>% mutate(lat_change_border = (latitude - border_latitude))
head(aclu)

```

```{r error=TRUE}
# creates new data frame containing only facilities further than 15 degrees latitude away from border
further_away = aclu%>% filter(lat_change_border >15)
further_away
further_away = further_away%>%arrange(desc(lat_change_border))
further_away


```

```{r error=TRUE}
# creates new data frame ordered by number of children

ordered_by_children = aclu%>%arrange(desc(number_children))
ordered_by_children

```

```{r error=TRUE}
# analyzes data for New York

chosen_state = 'NY'
chosen_state_separations = aclu%>% filter(state == chosen_state)
chosen_state_separations = chosen_state_separations %>% arrange(desc(number_children))
chosen_state_separations

```
