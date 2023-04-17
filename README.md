# AmesHousing-dataset_Regression-Diagnostics-with-R
Implementing Regression Diagnostics on AmesHousing  dataset in R

I used a data set called AmesHousing that examines features of houses sold in Ames during the 
2006-2010 timeframe. The goal is to use the training data to predict the sale prices of the 
houses. The data set has 2930 rows and 82 variables. there are both numerical and character 
type variables in my data set. 
I want to use Regression Diagnostics to answer the following question:

1- Which parameters affect the sale price of the house? (By which parameters we can predict the 
sale price of the house)?
2-When were the most houses built? 
3-In what condition are the most houses on the market?
4-Does the sale price affected by the quality of material and garage area, living area, 1 st floor area, 
year built, and full bath? 

Interpretations of Exploratory Data Analysis:

I found that the median age of the houses is 49 years, and the average age is around 51 years. 
Around 50% of the age of the house is between 21 and 68 years. In terms of Sale Price, the 
lowest price for the sale was 12p789 while the highest price was 755000 and the houses were 
sold for 180796 on average. Also, the distribution of the price of the houses is right-skewed with 
all the neighborhoods. I found that StoneBr neighborhood with a price of 319000 is the most 
expensive neighborhood and MeadowV with a price of 88250 is the least expensive 
neighborhood. I found that the StoneBr neighborhood with 199273 has the maximum variation 
in the price while NPkVill with 9340 has the least variation in the price of its houses. I saw that 
the most houses have been built in 2005 and between 2007 and 2008 the number of built 
houses decreased. I found that most houses on the market are in average condition and the most 
houses are under 2000 square feet. the mean value is 1500 sqft and the median is 1442 sqft. I 
saw that the highest positive correlation with the sale price is related to the quality of material, 
and the enclosed porch has the lowest negative correlation with the sale price. And masonry 
veneer area in square feet has a correlation coefficient of 0. 51. I found that there is a strong 
positive correlation between price, garage area, 1 st floor, are, and living area. 

Interpretations of Regression Diagnostics:

based on the resulting previous part, I defined the dependent variable sale price and 
independent variables “the quality of material and garage area, living area, 1 st floor area, 
year built, and full bath”. I Specified the Null and Alternative Hypotheses then implemented a 
multiple regression model. I saw My model had an Adjusted R-squared of 79% and the p-value 
was less than 0.05. Therefore, I concluded there is a significant positive relationship between 
the sale price and my predictors’ variables. After that, I applied regression diagnostics. I find 
that my model follows normality, linearity, and Homoscedasticity. Also, it had not 
multicollinearity problem. I saw that the residuals in this regression model are positively 
autocorrelated. to improve my model, I used two approaches, found the unusual observation, 
and then removed them, and used the transformation values approach. by using these 
methods, the Adjusted R-squared increased to 85%. Finally, I applied all subsets 
regression method, and found that my model with 6 predictors performs best

