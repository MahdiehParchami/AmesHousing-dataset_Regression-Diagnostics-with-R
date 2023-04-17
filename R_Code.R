

setwd("E:/R/")

# install.packages("readr")
library(readr)
df <- read_csv("AmesHousing.csv")


#Structural Analysis
# install.packages("dplyr")
library(dplyr)

glimpse(df)
str(df)
head(df)
tail(df)

# Descriptive Statistics 
summary(df)


# EDA analysis


# install.packages("lubridate")
library(lubridate)

df1 <- df %>%
  mutate(House_Age = year(today()) - df$`Year Built`)

df1$House_Age <- as.numeric(df1$House_Age)
summary(df1$House_Age)
unique(df1$Utilities)
unique(df1$Electrical)
unique(df1$Heating)
unique(df1$`Sale Type`)
unique(df1$Neighborhood)


# fixing space between name of variables
# install.packages("magrittr")
library(magrittr)
df1 %<>% dplyr::rename_all(make.names)

# install.packages("ggplot2")
library(ggplot2)
# Distribution of the Age of the Houses

ggplot( data = df1, aes(x=House_Age)) + geom_histogram(color="#00FF00", fill="#7CFC00") +
  labs(subtitle="Distribution of the Age of the Houses", 
       y="Number of Houses", 
       x="Years since Built", 
       title="Histogram", 
       caption = "Source: AmesHousing") +
  geom_vline(aes(xintercept=quantile(House_Age,0.90)),
             color="#F08080", linetype="dashed", size=1)

# Distribution of house prices regardless of neighborhoods
ggplot( data = df1, aes(x=SalePrice)) + geom_histogram(color="#800080", fill="#BA55D3") +
  labs(subtitle="Distribution of house prices regardless of neighborhoods", 
       y="", 
       x="Price of Houses", 
       title="Histogram", 
       caption = "Source: AmesHousing")

# Median Price in relation to Neighborhoods in Ames,Iowa

df2 <- df1 %>%
  group_by(Neighborhood) %>%
  summarise(Price_Neighborhood = median(SalePrice)) %>%
  arrange(Price_Neighborhood)

ggplot(data = df2, aes(Neighborhood, Price_Neighborhood)) + 
  geom_jitter(aes(color = Neighborhood, size = Price_Neighborhood)) + 
  theme(axis.text.x = element_text(angle = 90)) + 
  theme(legend.position = "none") + 
  ggtitle("Median Price in relation to Neighborhoods in Ames,Iowa") + 
  xlab("Neighborhoods in Ames, Iowa") +
  ylab("Median Price") + 
  theme(plot.title = element_text(size = 10)) + 
  theme(axis.title = element_text(size = 10)) 

# Most and Least Expensive Neighborhoods 
df2[which.max(df2$Price_Neighborhood),]
df2[which.min(df2$Price_Neighborhood),]

# Price Variation per Neighborhood 

df3 <- df1 %>%
  group_by(Neighborhood) %>%
  summarise(Price_Var_Neighborhood = sd(SalePrice)) %>%
  arrange(Price_Var_Neighborhood)


ggplot(data = df3, aes(Neighborhood, Price_Var_Neighborhood)) + 
  geom_jitter(aes(color = Neighborhood, size = Price_Var_Neighborhood)) + 
  theme(axis.text.x = element_text(angle = 90)) + 
  theme(legend.position = "none") + 
  ggtitle("Price Variation in relation to Neighborhoods in Ames,Iowa") + 
  xlab("Neighborhoods in Ames, Iowa") +
  ylab("Price Variation") + 
  theme(plot.title = element_text(size = 10)) + 
  theme(axis.title = element_text(size = 10))

# Neighborhoods with most and least Variation in price #
df3[which.max(df3$Price_Var_Neighborhood),]
df3[which.min(df3$Price_Var_Neighborhood),]

# When were the most houses built

# install.packages("RColorBrewer")
library(RColorBrewer)
# dev.off
barplot(table(df1$Year.Built), 
        main = "When were the most houses built?",
        xlab = "Year",
        ylab = "Number of houses",
        col = brewer.pal(9, "Blues"))

# In what condition are the most houses on the market
barplot(table(df1$Overall.Cond), 
        main = "In what condition are the most houses on the market?", 
        xlab = "Year",
        ylab = "Number of houses",
        col = brewer.pal(10, "RdYlBu"))

# Histogram of living area
ggplot(df1, aes(x = Gr.Liv.Area)) +
  geom_histogram(color = "black", fill = "green", bins = 50) + 
  
  labs(title = "Distribution of house sizes", x = "Living area (sqft)", y = "Frequency") +
  theme_minimal()

# finding missing values
sum(is.na(df1))
na_count <- sapply(df1, function(x) sum(is.na(x))/ nrow(df1) * 100)
na_count_desc <- sort(na_count, decreasing = TRUE)
na_count_desc


# fill missing values with mean of variables for all numerical variables with missing values

mean(df1$Lot.Frontage, na.rm = TRUE)

df1$Lot.Frontage[is.na(df1$Lot.Frontage)]<-mean(df1$Lot.Frontage,na.rm=TRUE)


mean(df1$Garage.Yr.Blt, na.rm = TRUE)

df1$Garage.Yr.Blt[is.na(df1$Garage.Yr.Blt)]<-mean(df1$Garage.Yr.Blt,na.rm=TRUE)


mean(df1$Mas.Vnr.Area, na.rm = TRUE)

df1$Mas.Vnr.Area[is.na(df1$Mas.Vnr.Area)]<-mean(df1$Mas.Vnr.Area,na.rm=TRUE)

mean(df1$Bsmt.Full.Bath, na.rm = TRUE)

df1$Bsmt.Full.Bath[is.na(df1$Bsmt.Full.Bath)]<-mean(df1$Bsmt.Full.Bath,na.rm=TRUE)

mean(df1$Bsmt.Half.Bath, na.rm = TRUE)

df1$Bsmt.Half.Bath[is.na(df1$Bsmt.Half.Bath)]<-mean(df1$Bsmt.Half.Bath,na.rm=TRUE)


mean(df1$ BsmtFin.SF.1, na.rm = TRUE)

df1$ BsmtFin.SF.1[is.na(df1$ BsmtFin.SF.1)]<-mean(df1$ BsmtFin.SF.1,na.rm=TRUE)

mean(df1$ BsmtFin.SF.2, na.rm = TRUE)

df1$ BsmtFin.SF.2[is.na(df1$ BsmtFin.SF.2)]<-mean(df1$ BsmtFin.SF.2,na.rm=TRUE)

mean(df1$ BsmtFin.SF.2, na.rm = TRUE)

df1$ BsmtFin.SF.2[is.na(df1$ BsmtFin.SF.2)]<-mean(df1$ BsmtFin.SF.2,na.rm=TRUE)
# .............................................

mean(df1$Bsmt.Unf.SF, na.rm = TRUE)

df1$Bsmt.Unf.SF[is.na(df1$Bsmt.Unf.SF)]<-mean(df1$Bsmt.Unf.SF,na.rm=TRUE)


mean(df1$Total.Bsmt.SF, na.rm = TRUE)

df1$Total.Bsmt.SF[is.na(df1$Total.Bsmt.SF)]<-mean(df1$Total.Bsmt.SF,na.rm=TRUE)

mean(df1$Garage.Cars, na.rm = TRUE)

df1$Garage.Cars[is.na(df1$Garage.Cars)]<-mean(df1$Garage.Cars,na.rm=TRUE)

mean(df1$Garage.Area, na.rm = TRUE)

df1$Garage.Area[is.na(df1$Garage.Area)]<-mean(df1$Garage.Area,na.rm=TRUE)
# check for duplicatation

duplicated(df1)

# Correlation matrix
df2 <- print(select_if(df1, is.numeric))

corr <- round(cor(df2), 1)

#turn into a 3-column table
corr <- as.data.frame(as.table(corr))


#select significant values  
corr1 <- subset(corr, (abs(Freq) >= 0.5))

#sort by highest correlation
corr2 <- corr1[order(-abs(corr1$Freq)),] 



# corr Plot with corrplot

library(corrplot)
#turn corr back into matrix in order to plot with corrplot
mtx_corr <- reshape2::acast(corr2, Var1~Var2, value.var="Freq")

corrplot(mtx_corr, is.corr=FALSE, tl.col="black", na.label=" ", tl.cex = 0.7)

# corrplot(mtx_corr,type = "upper",order = "hclust" ,
# col = COL2('PiYG'))

# corr Plot with ggplot

# install.packages("ggcorrplot")
library(ggcorrplot)
ggcorrplot(mtx_corr, tl.cex = 7 , title = "Correlation Plot", method  =  "circle")

#-------------------------------------------------------------------------------

#  Scatter Plot for highest
gg <-ggplot(df2, aes(x=Overall.Qual, y=SalePrice)) + geom_point(aes(col= SalePrice, size = Overall.Qual))+
  xlim(c(1, 10)) + 
  ylim(c(1,900000)) + 
  labs(subtitle="Correlation slae price Vs overall quality of material", 
       y="SalePrice", 
       x="Overall.Qual", 
       title="Scatterplot", 
       caption = "Source: AmesHousing")
plot(gg)

#  select lowerest correlation
df3 <- df2 %>% 
  select(SalePrice , Pool.Area,Screen.Porch,Bedroom.AbvGr,Enclosed.Porch,Kitchen.AbvGr,Overall.Cond)

# Scatter Plot for lowest positive

gg1 <-ggplot(df2, aes(x=Pool.Area, y=SalePrice)) + geom_point(aes(col= SalePrice, size = Pool.Area))+
  xlim(c(1, 1000)) + 
  ylim(c(1,900000)) + 
  labs(subtitle="Correlation slae price Vs Pool area", 
       y="SalePrice", 
       x="Pool area", 
       title="Scatterplot", 
       caption = "Source: AmesHousing")
plot(gg1)


# Scatter Plot for lowest negative

gg2 <-ggplot(df2, aes(x=Enclosed.Porch, y=SalePrice)) + geom_point(aes(col= SalePrice, size = Enclosed.Porch))+
  xlim(c(1, 600)) + 
  ylim(c(1,500000)) + 
  labs(subtitle="Correlation slae price Vs Enclosed.Porch", 
       y="SalePrice", 
       x="Enclosed.Porch", 
       title="Scatterplot", 
       caption = "Source: AmesHousing")
plot(gg2)

#Selecting variables
df4 = df2 %>% select(SalePrice, Garage.Area, X1st.Flr.SF, Gr.Liv.Area)

# Plot

library(RColorBrewer)

pairs(df4, 
      main = "Relations between continuous variables in Ames housing data", 
      pch = 21, 
      bg = c("plum1"), 
      labels = c("Price","Garage Area","1st Floor Area","Living Area"),
      lower.panel = NULL, 
      font.labels = 2, 
      cex.labels = 1,
      cex.main=1) 

#-------------------------------------------------------------------------------

# Implementing Regression

fit <- lm(SalePrice ~ Overall.Qual + Gr.Liv.Area + X1st.Flr.SF + Garage.Area + Year.Built + Full.Bath , data = df2)
summary(fit)
# par(mfrow=c(2,2))
dev.off()
plot(fit, col= "green")


# -----------------------------------------------------------------------------


#  check for Multicollinearity
library(car)

vif(fit) 
sqrt(vif(fit)) >2

# check for independent values
library(car)
durbinWatsonTest(fit)


# check for LINEARITY
crPlots(fit , col = "#FF69B4")


# check for HOMOSCEDASTICITY
ncvTest(fit)

# check for the unusual observations:
# install.packages("olsrr")
library(olsrr)
ols_plot_resid_lev(fit)

# Removing unusual observations
df3 <- df2[-c(2182, 2181, 1499, 1761, 1768),]



#  Implementing Regression after unusual observations

fit1 <- lm(SalePrice ~ Overall.Qual + Gr.Liv.Area + X1st.Flr.SF + Garage.Area + Year.Built + Full.Bath , data = df3)
summary(fit1)
# par(mfrow=c(2,2))
# dev.off()
plot(fit1, col= "green")

fit2 <- lm(SalePrice ~ I(Overall.Qual^3) + Gr.Liv.Area + X1st.Flr.SF + Garage.Area + Year.Built + Full.Bath , data = df3)
summary(fit2)
# par(mfrow=c(2,2))
# dev.off()
plot(fit2, col= "green")

AIC(fit1,fit2)

# All Subsets Regression
library(leaps)
models <- regsubsets(SalePrice ~ Overall.Qual + Gr.Liv.Area + X1st.Flr.SF + Garage.Area + Year.Built  + Full.Bath, data = df3, nvmax = 6)

# plot a table of models showing variables in each model ordered by the selection statistic (adjusted R2)

dev.new(width=200, height=200, unit="px")
plot(models,scale="adjr2", col= "plum")


res.sum <- summary(models)
data.frame(
  Adj.R2 = which.max(res.sum$adjr2),
  CP = which.min(res.sum$cp),
  BIC = which.min(res.sum$bic)
)

