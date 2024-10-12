# workbook3.R

# Topic: Anscombe's Quartet

## download this script and the data to your computer
## create a project folder and put the script and the data in
## (creating a project automatically sets the RStudio working directory to the project folder)
## after this block, every comment requests that you enter some instructions


# Remember to load the tidyverse library
library(tidyverse)
library(glue)  # add glue fro later function

# load the data in the csv file into R (as a dataframe)
df <- read.csv("data/anscombe.csv")

# you can see the top of a large dataframe using the head command
head(df)

# you can look at a single column (also known as "indexing") by using the $ notation
x1 <- df$x1

# find the mean of one of the columns
x1_mean <- mean(df$x1)

# find the standard deviation of one of the columns
x1_sd <- sd(df$x1)

# find the correlation of one of the pairs
cor_x1_y1 <- cor(df$x1, df$y1)

# ADVANCED: find the mean and sd of ALL columns
df %>% summarise(across(X:y4, mean))
df %>% summarise(across(X:y4, sd))

## Now plot the data!

# use ggplot to make a scatterplot
# separate column names for x and y columns
df_x <- c("x1","x2","x3","x4")
df_y <- c("y1","y2","y3","y4")

# Loop through count of x and y values
for (i in 1:4) {  
  
  # assign labels and values to variables
  x_label <- df_x[i]
  y_label <- df_y[i]
  x_values <- df[,x_label]
  y_values <- df[,y_label]
  
  # ggplot based on iteration
  ggplot(data = df, mapping = aes(x=x_values, y=y_values)) + 
    
    # add colour using index column X
    geom_point(color=df$X,
               
               # Increase size of points
               size=3) +  
    
    # add title using glue function and iteration
    labs(title = glue('{x_label} by {y_label}'),   
         
         # add in appropriate x and y labels
         x=df_x[i], y=df_y[i],  
         
         # glue mean, sd, and correlation into subtitle
         subtitle = glue("Mean: x={mean(x_values)}, y={mean(df[,df_y[i]])}\
                         Standard Deviation: x={sd(x_values)}, y={sd(y_values)}\
                         Correlation: {cor(x_values, y_values)}")) +  
    
    # set xlim and ylim from 0 to axis max +1
    xlim(0,max(df[,df_x[i]])+1) + ylim(0,max(df[,df_y[i]])+1) 
  
  ggsave(glue("figs/{x_label}_{y_label}_graph.png"))
}

# hint: this will require two lines, one of which will involve the geom_point function

# give the plot a title

# make the points a different colour

# make the points larger

# define the x and y range

# put the mean and st and correlation in the subtitle
# hint: you will need to convert them to text with the toString() function
# hint2: you will need join the text together using the paste() function

# save the figure as a png file in the \figs folder

# ADVANCED: write a loop to look at the four pairs and make a plot of each

# hint: you'll probably want two lists of variables which you iterate over

# hint: you may need to look up writing "for loops" in R
# hint2: the sprintf command is a good way of getting variables into text strings (to put the mean and sds in the subtitle for example)


# share your project
# hint: you could download all the files as a zip and email it, or just share the google folder


# someone else runs your script
