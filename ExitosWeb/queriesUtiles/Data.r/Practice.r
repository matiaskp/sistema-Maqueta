---
title: "Lesson 3: R Sandbox Activity"
output: html_document
---

## Background for this activity
Welcome to the sandbox! This activity is going to provide you with the opportunity to preview some of the cool things you can do in `R` that you will be learning in this course. You will learn more about working with packages and data and try out some important functions.  

In this activity, you are going to install and load `R` packages; practice using functions to view, clean, and visualize data; and learn more about using `R markdown` to document your analysis. `R` is a powerful tool that can do a lot of different things; this sandbox activity will help you get more comfortable using `R` while demonstrating some of its functions in action. In later activities, you will also get the opportunity to write your own R code!   

## Step 1: Using `R packages`
`Packages` are a key part of working with `R.`They contain bundles of code called `functions` that allow you to perform a wide range of tasks in `R.` Some of them even contain datasets that you can use to practice the skills you have been learning throughout this course.

Some `packages` are installed by default, but many others can be downloaded from an external source such as the Comprehensive R Archive Network, or CRAN.

In this activity, you will be using a package called `tidyverse.` The `tidyverse` package is actually a collection individual `packages` that can help you perform a wide variety of analysis tasks.

To install the `tidyverse` package, execute the code in the code chunk below by clicking on the green arrow button in the top right corner. When you execute a code chunk in RMarkdown, the output will appear in the .rmd area and your console.

```{r}
install.packages("tidyverse")
```

Once a package is installed, you can load it by running the `library()` function with the package name inside the parentheses, like this:

```{r}
library(tidyverse)
```

Installing and loading the `tidyverse` package may take a few minutes-- be sure to wait for it to finish running before moving on to the next steps!

Once the chunk above has finished running, you will get a report that summarizes what packages were loaded because you ran the `library()` function. The report will also let you know you if there are any `functions` that have a conflict, but you don't need to worry about that for now.  

Now that you have loaded an `R package,` you can start exploring some data. 

# Step 2: Viewing data

Many of the `tidyverse` packages contain sample datasets that you can use to practice your `R` skills. The `diamonds` dataset in the `ggplot2` package is a great example for previewing `R` functions. 

Because you already loaded this package in the last step, the `diamonds` dataset is ready for you to use.

One common function you can use to preview the data is the `head()` function, which displays the columns and the first several rows of data. You can test out how the `head()` function works by running the chunk below:

```{r}
head(diamonds)
```

In addition to `head()` there are a number of other useful functions you can use to summarize or preview the data. For example, the `str()` and `glimpse()` functions will both return summaries of each column in your data arranged horizontally. You can try out these two functions by running the code chunks below:

```{r}
str(diamonds)
```

```{r}
glimpse(diamonds)
```

Another simple function that you may use regularly is the `colnames()` function. It returns a list of column names from your dataset. You can check out this function by running the code chunk below:

```{r}
colnames(diamonds)
```

After running the code chunk, you may have noticed a number in brackets. This number helps you count the number of columns in your dataset. If you have data with lots of columns and `colnames()` prints the results on multiple lines, each line will have a number in brackets at the start of the line indicating what number column that is! So, for example, "carat" is the first column in the `diamonds` dataset. On the second line, there is the number seven in brackets; "price" is the seventh column. 

## Step 3: Cleaning data

One of the most frequent tasks you will have to perform as an analyst is to clean and organize your data. `R` makes this easy! There are many functions you can use to help you perform important tasks easily and quickly. 

For example, you might need to rename the columns, or variables, in your data. There is a function for that: `rename().` You can check out how it works in the chunk below:

```{r}
rename(diamonds, carat_new = carat)
```

Here, the function is being used to change the name of `carat` to `carat_new`. This is a pretty basic change, but `rename()` has many options that can help you do more complex changes across all of the variables in your data.

For example, you can rename more than one variable in the same `rename()` code. The code below demonstrates how:

```{r}
rename(diamonds, carat_new = carat, cut_new = cut)
```

Another handy function for summarizing your data is `summarize().` You can use it to generate a wide range of summary statistics for your data. For example, if you wanted to know what the mean for `carat` was in this dataset, you could run the code in the chunk below:

```{r}
summarize(diamonds, mean_carat = mean(carat))
```

These functions are a great way to get more familiar with your data and start making observations about it. But sometimes, previewing tables isn't enough to understand a dataset. Luckily, `R` has visualization tools built in. 

## Step 4: Visualizing data
With `R,` you can create data visualizations that are simple and easy to understand or complicated and beautiful just by changing a bit of code. `R` empowers you to present the same data in so many different ways, which can help you create new insights or highlight important data findings.  One of the most commonly used visualization packages is the `ggplot2` package, which is loaded automatically when you install and load `tidyverse.` The `diamonds` dataset that you have been using so far is a `ggplot2` dataset.

To build a visualization with `ggplot2` you layer plot elements together with a `+` symbol. You will learn a lot more about using `ggplot2` later in the course, but here is a preview of how easy and flexible it is to make visuals using code:

```{r}
ggplot(data = diamonds, aes(x = carat, y = price)) +
  geom_point()
```

The code above takes the `diamonds` data, plots the carat column on the X-axis, the price column on the Y-axis, and represents the data as a scatter plot using the `geom_point()` command. 

`ggplot2` makes it easy to modify or improve your visuals. For example, if you wanted to change the color of each point so that it represented another variable, such as the cut of the diamond, you can change the code like this:

```{r}
ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point()
```

Wow, that's a busy visual! Sometimes when you are trying to represent many different aspects of your data in a visual, it can help to separate out some of the components. For example, you could create a different plot for each type of cut. `ggplot2` makes it easy to do this with the `facet_wrap()` function:

```{r}
ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point() +
  facet_wrap(~cut)
```

You will learn many other ways of working with `ggplot2` to make functional and beautiful visuals later on. For now, hopefully you understand that it is both flexible and powerful!

## Step 5: Documentation

You have been working in an `R markdown` file, which allows you to put code and writing in the same place. Markdown is a simple language for adding formatting to text documents. For example, all of the section headers have been formatted by adding `##` to the beginning of the line. Markdown can be used to format the text in other ways, such as creating bulleted lists:

- So if you have a list of things
- Or want to write bullets for another reason
- You can do that using markdown

When you have written, executed, and documented your code in an `R markdown` document like this, you can use the `knit` button in the menu bar at the top of the editing pane to export your work to a beautiful, readable document for others. 

## Activity Wrap-up
You have had a chance to explore more `R` tools that you can start using on your own. You learned how to install and load `R packages`; functions for viewing, cleaning, and visualizing data; and using `R markdown`to export your work. Feel free to continue exploring these functions in the rmd file, or use this code in your own RStudio project space. As you practice on your own, consider how `R` is similar and different from the tools you have already learned in this program, and how you might start using it for your own data analysis projects. `R` provides a lot of flexibility and utility that can make it a key tool in a data analyst's tool kit. 

Make sure to mark this activity as complete in Coursera.

---
title: "Lesson 2: Create your own data frame"
output: html_document
---

## Background for this activity
This activity is focused on creating and using data frames in `R`. A data frame is a collection of columns containing data, similar to a spreadsheet or SQL table. Data frames are one of the basic tools you will use to work with data in `R`. And you can create data frames from different data sources.  

There are three common sources for data:

- A`package` with data that can be accessed by loading that `package`
- An external file like a spreadsheet or CSV that can be imported into `R`
- Data that has been generated from scratch using `R` code

Wherever data comes from, you will almost always want to store it in a data frame object to work with it. Now, you can start creating and exploring data frames with the code chunks in the RMD space. To interact with the code chunk, click the green arrow in the top-right corner of the chunk. The executed code will appear in the RMD space and your console.

Throughout this activity, you will also have the opportunity to practice writing your own code by making changes to the code chunks yourself. If you encounter an error or get stuck, you can always check the Lesson2_Dataframe_Solutions .rmd file in the Solutions folder under Week 3 for the complete, correct code.

## Step 1: Load packages

Start by installing the required package; in this case, you will want to install `tidyverse`. If you have already installed and loaded `tidyverse` in this session, feel free to skip the code chunks in this step.

```{r}
install.packages("tidyverse")
```

Once a package is installed, you can load it by running the `library()` function with the package name inside the parentheses:

```{r}
library(tidyverse)
```

## Step 2: Create data frame

Sometimes you will need to generate a data frame directly in `R`. There are a number of ways to do this; one of the most common is to create individual vectors of data and then combine them into a data frame using the `data.frame()` function.

Here's how this works. First, create a vector of names by inserting four names into this code block between the quotation marks and then run it:

```{r}
names <- c("", "", "", "")
```

Then create a vector of ages by adding four ages separated by commas to the code chunk below. Make sure you are inputting numeric values for the ages or you might get an error. 

```{r}
age <- c(, , , )
```

With these two vectors, you can create a new data frame called `people`:

```{r}
people <- data.frame(names, age)
```

## Step 3: inspect the data frame

Now that you have this data frame, you can use some different functions to inspect it.

One common function you can use to preview the data is the `head()` function, which returns the columns and the first several rows of data. You can check out how the `head()` function works by running the chunk below:

```{r}
head(people)
```

In addition to `head()`, there are a number of other useful functions to summarize or preview your data. For example, the `str()` and `glimpse()` functions will both provide summaries of each column in your data arranged horizontally. You can check out these two functions in action by running the code chunks below:

```{r}
str(people)
```

```{r}
glimpse(people)
```

You can also use `colnames()` to get a list the column names in your data set. Run the code chunk below to check out this function:

```{r}
colnames(people)
```

Now that you have a data frame, you can work with it using all of the tools in `R`. For example, you could use `mutate()` if you wanted to create a new variable that would capture each person's age in twenty years. The code chunk below creates that new variable:

```{r}
mutate(people, age_in_20 = age + 20)
```


## Step 4: Try it yourself

To get more familiar with creating and using data frames, use the code chunks below to create your own custom data frame. 

First, create a vector of any five different fruits. You can type directly into the code chunk below; just place your cursor in the box and click to type. Once you have input the fruits you want in your data frame, run the code chunk.

```{r}

```

Now, create a new vector with a number representing your own personal rank for each fruit. Give a 1 to the fruit you like the most, and a 5 to the fruit you like the least. Remember, the scores need to be in the same order as the fruit above. So if your favorite fruit is last in the list above, the score `1` needs to be in the last position in the list below. Once you have input your rankings, run the code chunk.

```{r}

```

Finally, combine the two vectors into a data frame. You can call it `fruit_ranks`. Edit the code chunk below and run it to create your data frame.

```{r}

```

After you run this code chunk, it will create a data frame with your fruits and rankings.  

## Activity Wrap Up
In this activity, you learned how to create data frames, view them with summary functions like `head()` and `glimpse()`, and then made changes with the `mutate()` function. You can continue practicing these skills by modifying the code chunks in the rmd file, or use this code as a starting point in your own project console. As you explore data frames, consider how they are similar and different to the tables you have worked with in other data analysis tools like spreadsheets and SQL. Data frames are one of the most basic building blocks you will need to work with data in `R`. So understanding how to create and work with data frames is an important first step to analyzing data.  

Make sure to mark this activity as complete in Coursera.


---
title: "Lesson 2: Importing and working with data"
output: html_document
---

## Background for this activity / Introduction
By now, you have some experience manually entering data in `R` to create a data frame. As a data analyst, it will also be common for you to import data from external files into your `R` console and use it to create a data frame to analyze it. In this activity you will learn how to import data from outside of `R` using the `read_csv()` function. Then, once you have imported a data file, you will use `R` functions to manipulate and interact with that data.

You can start importing and exploring data with the code chunks in the RMD space. To interact with the code chunk, click the green arrow in the top-right corner of the chunk. The executed code will appear in the RMD space and your console. 

Throughout this activity, you will also have the opportunity to practice writing your own code by making changes to the code chunks yourself. If you encounter an error or get stuck, you can always check the Lesson2_Import_Solutions .rmd file in the Solutions folder under Week 3 for the complete, correct code.

## The scenario

In this scenario, you are a junior data analyst working for a hotel booking company. You have been asked to clean a .csv file that was created after querying a database to combine two different tables from different hotels. In order to learn more about this data, you are going to need to use functions to preview the data's structure, including its columns and rows. You will also need to use basic cleaning functions to prepare this data for analysis.

## Step 1: Load packages

Start by installing your required package. If you have already installed and loaded `tidyverse` in this session, feel free to skip the code chunks in this step.

```{r}
install.packages("tidyverse")
```

Once a package is installed, we can load it by running the `library()` function with the package name inside the parentheses:

```{r}
library(tidyverse)
```

## Step 2: Import data

One of the most common file types data analysts import into `R` is comma separated values files, or .csv files. The `tidyverse` library package `readr` has a number of functions for "reading in" or importing data, including .csv files and other external sources. 

In the chunk below, use the `read_csv()` function to import data from a .csv in the project folder called "hotel_bookings.csv" and save it as a data frame called `bookings_df`. 

If this line causes an error, copy in the line setwd("projects/Course 7/Week 3") before it. 

The results will display as column specifications:

```{r}
bookings_df <- read_csv("hotel_bookings.csv")
```

Now that you have the `bookings_df`, you can work with it using all of the  `R` functions you have learned so far. 

## Step 3: Inspect & clean data

One common function you can use to preview the data is the `head()` function, which returns the columns and first several rows of data. Check out the `head()` function by running the chunk below:

```{r}
head(bookings_df)
```

In addition to `head()` there are a number of other useful functions to summarize or preview your data frame. For example, the `str()` and function will provide summaries of each column in your data arranged horizontally. Check out the `str()` function by running the code chunk below:

```{r}
str(bookings_df)
```

To find out what columns you have in your data frame, try running the the `colnames()` function in the code chunk below:

```{r}
colnames(bookings_df)
```

If you want to create another data frame using `bookings_df` that focuses on the average daily rate, which is referred to as `adr` in the data frame, and  `adults`, you can use the following code chunk to do that:

```{r}
new_df <- select(bookings_df, `adr`, adults)
```

To create new variables in your data frame, you can use the `mutate()` function. This will make changes to the data frame, but not to the original data set you imported. That source data will remain unchanged. 

```{r}
mutate(new_df, total = `adr` / adults)
```

# Step 4: Import your own data

Now you can find your own .csv to import! Using the RStudio Cloud interface, import and save the file in the same folder as this R Markdown document. To do this, go to the Files tab in the lower-right console. Then, click the Upload button next to the + New Folder button. This will open a popup to let you browse your computer for a file. Select any .csv file, then click Open. Now, write code in the chunk below to read that data into `R`:

```{r}

```
You can check the solutions document for this activity to check your work.

## Activity Wrap Up
Now that you know how to import data using the `read_csv()` function, you will be able to work with data that has been stored externally right in your `R` console. You can continue to practice these skills by modifying the code chunks in the rmd file, or use this code as a starting point in your own project console. As you become more familiar with the process of importing data, consider how importing data from a .csv file changed the way you accessed and interacted with the data. Did you do anything differently? Being able to import data from external sources will allow you to work with even more data, giving you even more options for analyzing data in `R`.  

Make sure to mark this activity as complete in Coursera.

---
title: "Lesson 3: Cleaning data"
output: html_document
---

## Background for this activity

In this activity, youâ€™ll review a scenario, and focus on cleaning real data in R. You will learn more about data cleaning functions and perform basic calculations to gain initial insights into your data.

Throughout this activity, you will also have the opportunity to practice writing your own code by making changes to the code chunks yourself. If you encounter an error or get stuck, you can always check the Lesson2_Clean_Solutions .rmd file in the Solutions folder under Week 3 for the complete, correct code. 

## The scenario

In this scenario, you are a junior data analyst working for a hotel booking company. You have been asked to clean a .csv file that was created after querying a database to combine two different tables from different hotels. In order to learn more about this data, you are going to need to use functions to preview the data's structure, including its columns and rows. You will also need to use basic cleaning functions to prepare this data for analysis.  

## Step 1: Load packages

In order to start cleaning your data, you will need to  by install the required packages. If you have already installed and loaded `tidyverse`, `skimr`, and `janitor` in this session, feel free to skip the code chunks in this step.

```{r}
install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")
```

Once a package is installed, you can load it by running the `library()` function with the package name inside the parentheses:

```{r}
library(tidyverse)
library(skimr)
library(janitor)
```

## Step 2: Import data

The data you have been asked to clean is currently an external .csv file. In order to view and clean it in `R`, you will need to import it. The `tidyverse` library `readr` package has a number of functions for "reading in" or importing data, including .csv files. 

In the chunk below, you will use the `read_csv()` function to import data from a .csv file in the project folder called "hotel_bookings.csv" and save it as a data frame called `bookings_df`:

If this line causes an error, copy in the line setwd("projects/Course 7/Week 3") before it. 

```{r}
bookings_df <- read_csv("hotel_bookings.csv")
```

## Step 3: Getting to know your data

Before you start cleaning your data, take some time to explore it. You can use several functions that you are already familiar with to preview your data, including the `head()` function in the code chunk below:

```{r}
head(bookings_df)
```

You can also summarize or preview the data with the `str()` and `glimpse()` functions to get a better understanding of the data by running the code chunks below:

```{r}
str(bookings_df)
```

```{r}
glimpse(bookings_df)
```

You can also use `colnames()` to check the names of the columns in your data set. Run the code chunk below to find out the column names in this data set:

```{r}
colnames(bookings_df)
```

Some packages contain more advanced functions for summarizing and exploring your data. One example is the `skimr` package, which has a number of functions for this purpose. For example, the `skim_without_charts()` function provides a detailed summary of the data. Try running the code below:

```{r}
skim_without_charts(bookings_df)
```

## Step 4: Cleaning your data

Based on the functions you have used so far, how would you describe your data in a brief to your stakeholder? Now, let's say you are primarily interested in the following variables: 'hotel', 'is_canceled', and 'lead_time'. Create a new data frame with just those columns, calling it `trimmed_df` by adding the variable names to this code chunk:

```{r}
trimmed_df <- bookings_df %>% 
  select( , , )
```

Remember to check the solutions doc if you are having trouble filling out any of these code chunks. 

You might notice that some of the column names aren't very intuitive, so you will want to rename them to make them easier to understand. You might want to create the same exact data frame as above, but rename the variable 'hotel' to be named 'hotel_type' to be crystal clear on what the data is about

Fill in the space to the left of the '=' symbol with the new variable name:

```{r}
trimmed_df %>% 
  select(hotel, is_canceled, lead_time) %>% 
  rename( = hotel)
```

Another common task is to either split or combine data in different columns. In this example, you can combine the arrival month and year into one column using the unite() function:

```{r}
example_df <- bookings_df %>%
  select(arrival_date_year, arrival_date_month) %>% 
  unite(arrival_month_year, c("arrival_date_month", "arrival_date_year"), sep = " ")
```

## Step 5: Another way of doing things

You can also use the`mutate()` function to make changes to your columns. Let's say you wanted to create a new column that summed up all the adults, children, and babies on a reservation for the total number of people. Modify the code chunk below to create that new column:  

```{r}
example_df <- bookings_df %>%
  mutate(guests = )

head(example_df)
```

Great. Now it's time to calculate some summary statistics! Calculate the total number of canceled bookings and the average lead time for booking - you'll want to start your code after the %>% symbol. Make a column called 'number_canceled' to represent the total number of canceled bookings. Then, make a column called 'average_lead_time' to represent the average lead time. Use the `summarize()` function to do this in the code chunk below:

```{r}

example_df <- bookings_df %>%


head(example_df)
```

If you are having trouble completing any of the code chunks in these activities, remember that you can reference the RMarkdown documents in the 'Solutions' for help. 

## Activity Wrap Up
Now you have some experience cleaning and analyzing data in `R`; you used basic cleaning functions like `rename()` and `clean_names()` and performed basic calculations on real data. You can continue to practice these skills by modifying the code chunks in the rmd file, or use this code as a starting point in your own project console. One of the reasons `R` is such a powerful tool for data analysis is because you can perform so many different tasks in one place. With the functions you have been learning in this course, you can import data, create and view data frames, and even clean data without leaving your console.  

Make sure to mark this activity as complete in Coursera.

---
title: "Lesson 3: Changing your data"
output: html_document
---

## Background for this activity
In this activity, youâ€™ll review a scenario, and focus on manipulating and changing real data in R. You will learn more about functions you can use to manipulate your data, use statistical summaries to explore your data, and gain initial insights for your stakeholders. 

Throughout this activity, you will also have the opportunity to practice writing your own code by making changes to the code chunks yourself. If you encounter an error or get stuck, you can always check the Lesson3_Change_Solutions .rmd file in the Solutions folder under Week 3 for the complete, correct code. 

## The Scenario
In this scenario, you are a junior data analyst working for a hotel booking company. You have been asked to clean a .csv file that was created after querying a database to combine two different tables from different hotels. You have already performed some basic cleaning functions on this data; this activity will focus on using functions to conduct basic data manipulation.

## Step 1: Load packages

Start by installing the required packages. If you have already installed and loaded `tidyverse`, `skimr`, and `janitor` in this session, feel free to skip the code chunks in this step. This may take a few minutes to run, and you may get a pop-up window asking if you want to proceed. Click yes to continue installing the packages. 

```{r install packages}
install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")
```

Once a package is installed, you can load it by running the `library()` function with the package name inside the parentheses:

```{r load packages}
library(tidyverse)
library(skimr)
library(janitor)
```

## Step 2: Import data

In the chunk below, you will use the `read_csv()` function to import data from a .csv in the project folder called "hotel_bookings.csv" and save it as a data frame called `hotel_bookings`. 

If this line causes an error, copy in the line setwd("projects/Course 7/Week 3") before it. 

Type the file name in the correct place to read it into your R console: 

```{r load dataset}
hotel_bookings <- read_csv("")
```

## Step 3: Getting to know your data

Like you have been doing in other examples, you are going to use summary functions to get to know your data. This time, you are going to complete the code chunks below in order to use these different functions. You can use the `head()` function to preview the columns and the first several rows of data. Finish the code chunk below and run it:

```{r head function}
head()
```
### Practice Quiz 

1. How many columns are in this dataset?
A: 45
B: 100
C: 32
D: 60

2. The 'arrival_date_month' variable is chr or character type data.  
A: True
B: False

Now you know this dataset contains information on hotel bookings. Each booking is a row in the dataset, and each column contains information such as what type of hotel was booked, when the booking took place, and how far in advance the booking took place (the 'lead_time' column).

In addition to `head()` you can also use the `str()` and `glimpse()` functions to get summaries of each column in your data arranged horizontally. You can try these two functions by completing and running the code chunks below:

```{r str function}
(hotel_bookings)
```

You can see the different column names and some sample values to the right of the colon. 

```{r glimpse function}
glimpse()
```

You can also use `colnames()` to get the names of the columns in your dataset. Run the code chunk below to get the column names:

```{r colnames function}
colnames(hotel_bookings)
```

## Manipulating your data

Let's say you want to arrange the data by most lead time to least lead time because you want to focus on bookings that were made far in advance. You decide you want to try using the `arrange()` function; input the correct column name after the comma and run this code chunk: 

```{r arrange function}
arrange(hotel_bookings, )
```


But why are there so many zeroes? That's because `arrange()` automatically orders by ascending order, and you need to specifically tell it when to order by descending order, like the below code chunk below:

```{r arrange function descending} 
arrange(hotel_bookings, desc(lead_time))
```

Now it is in the order you needed. You can click on the different pages of results to see additional rows of data, too.  

## Practice Quiz
What is the highest lead time for a hotel booking in this dataset?
A: 737
B: 709
C: 629
D: 0

Notice that when you just run `arrange()` without saving your data to a new data frame, it does not alter the existing data frame. Check it out by running `head()` again to find out if the highest lead times are first: 

```{r head function part two}
head(hotel_bookings)
```

This will be true of all the functions you will be using in this activity. If you wanted to create a new data frame that had those changes saved, you would use the assignment operator, <- , as written in the code chunk below to store the arranged data in a data frame named 'hotel_bookings_v2':

```{r new dataframe}
hotel_bookings_v2 <-
  arrange(hotel_bookings, desc(lead_time))
```

Run `head()`to check it out: 

```{r new dataframe part two}
head(hotel_bookings_v2)
```

You can also find out the maximum and minimum lead times without sorting the whole dataset using the `arrange()` function. Try it out using the max() and min() functions below:

```{r}
max(hotel_bookings$lead_time)
```

```{r}
min(hotel_bookings$lead_time)
```

Remember, in this case, you need to specify which dataset and which column using the $ symbol between their names. Try running the below to see what happens if you forget one of those pieces:

```{r}
min(lead_time)
```

This is a common error that R users encounter. To correct this code chunk, you will need to add the data frame and the dollar sign in the appropriate places. 

Now, let's say you just want to know what the average lead time for booking is because your boss asks you how early you should run promotions for hotel rooms. You can use the `mean()` function to answer that question since the average of a set of number is also the mean of the set of numbers:

```{r mean}
mean(hotel_bookings$lead_time)
```

You should get the same answer even if you use the v2 dataset that included the `arrange()` function. This is because the `arrange()` function doesn't change the values in the dataset; it just re-arranges them.

```{r mean part two}
mean(hotel_bookings_v2$lead_time)
```

## Practice Quiz 
What is the average lead time?
A: 100.0011
B: 45.0283
C: 14.0221
D: 104.0114

You were able to report to your boss what the average lead time before booking is, but now they want to know what the average lead time before booking is for just city hotels. They want to focus the promotion they're running by targeting major cities. 

You know that your first step will be creating a new dataset that only contains data about city hotels. You can do that using the `filter()` function, and name your new data frame 'hotel_bookings_city':

```{r filter}
 <- 
  filter(hotel_bookings, hotel_bookings$hotel=="City Hotel")
```

Check out your new dataset:

```{r new dataset}
head(hotel_bookings_city)
```

You quickly check what the average lead time for this set of hotels is, just like you did for all of hotels before:

```{r average lead time city hotels}
mean(hotel_bookings_city$lead_time)
```

Now, your boss wants to know a lot more information about city hotels, including the maximum and minimum lead time. They are also interested in how they are different from resort hotels. You don't want to run each line of code over and over again, so you decide to use the `group_by()`and`summarize()` functions. You can also use the pipe operator to make your code easier to follow. You will store the new dataset in a data frame named 'hotel_summary':

```{r group and summarize}
hotel_summary <- 
  hotel_bookings %>%
  group_by(hotel) %>%
  summarise(average_lead_time=mean(lead_time),
            min_lead_time=min(lead_time),
            max_lead_time=max(lead_time))
```

Check out your new dataset using head() again:

```{r}
head(hotel_summary)
```


## Activity Wrap Up
Being able to manipulate data is a key skill for working in `R`. After this activity, you should be more familiar with functions that allow you to change your data, such as `arrange()`, `group_by()`, and `filter()`. You also have some experience using statistical summaries to make insights into your data. You can continue to practice these skills by modifying the code chunks in the rmd file, or use this code as a starting point in your own project console. As you practice, consider how performing tasks is similar and different in `R` compared to other tools you have learned throughout this program. 


---
title: 'Lesson 3: Aesthetics and Visualizations'
output: html_document
---

## Background for this activity
In this activity, youâ€™ll review a scenario, and continue to apply your knowledge of data visualization with ggplot2. You will learn more about the aesthetic features of visualizations and how to customize them by specific criteria. 

Throughout this activity, you will also have the opportunity to practice writing your own code by making changes to the code chunks yourself. If you encounter an error or get stuck, you can always check the Lesson3_Aesthetics_Solutions .rmd file in the Solutions folder under Week 4 for the complete, correct code. 

## The Scenario
In this example, you are a junior data analyst working for the same hotel booking company from earlier. Last time, you created some simple visualizations with `ggplot2` to give your stakeholders quick insights into your data. Now, you are are interested in creating visualizations that highlight different aspects of the data to present to your stakeholder. You are going to expand on what you have already learned about `ggplot2` and create new kinds of visualizations like bar charts.  

## Step 1: Import your data
If you haven't exited out of RStudio since importing this data last time, you can skip these steps. Rerunning these code chunks won't affect your console if you want to run them just in case, though.  

Run the code below to read in the file 'hotel_bookings.csv' into a data frame: 

If this line causes an error, copy in the line setwd("projects/Course 7/Week 4") before it. 

```{r load data}
hotel_bookings <- read.csv("hotel_bookings.csv")
```

## Step 2: Refresh Your Memory

By now, you are pretty familiar with this data set. But you can refresh your memory with the `head()` and `colnames()` functions. Run two code chunks below to get at a sample of the data and also preview all the column names:

```{r look at data}
head(hotel_bookings)
```

```{r look at column names}
colnames(hotel_bookings)
```

## Step 3: Install and load the 'ggplot2' package (optional)

If you haven't already installed and loaded the `ggplot2` package, you will need to do that before you can use the `ggplot()` function. You only have to do this once though, not every time you call `ggplot()`.

You can also skip this step if you haven't closed your RStudio account since doing the last activity. If you aren't sure, you can run the code chunk and hit 'cancel' if the warning message pops up telling you that have already downloaded the `ggplot2` package.

Run the code chunk below to install and load `ggplot2`. This may take a few minutes!

```{r loading and installing ggplot2, echo=FALSE, message=FALSE}
install.packages('ggplot2')
library(ggplot2)
```

## Step 4: Making a Bar Chart

Your stakeholder is interested in developing promotions based on different booking distributions, but first they need to know how many of the transactions are occurring for each different distribution type.

You can tell `ggplot()` what type of chart you want to create by using the `geom_` argument. 

Previously, you used `geom_point` to make a scatter plot comparing lead time and number of children. Now, you will use `geom_bar` to make a bar chart in this code chunk: 

```{r example chart}
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel))
```
Previously, you created scatter plots with ggplot2. This code chunk creates a bar chart with 'distribution_channel' on the x axis and 'count' on the y axis. There is data for corporate, direct, GDS, TA/TO, and undefined distribution channels. 

## Practice quiz
Use the bar chart you created to answer this question: what distribution type has the most number of bookings? Note your answer for the practice quiz question in Coursera afterwards.

A: TA/TO
B: Direct
C: GDS
D: Corporate

## Step 5: Diving deeper into bar charts

After exploring your bar chart, your stakeholder has more questions. Now they want to know if the number of bookings for each distribution type is different depending on whether or not there was a deposit or what market segment they represent. 

Try modifying the code below to answer the question about deposits by adding 'fill=deposit_type' after 'x = distribution_channel':

```{r pressure, echo=FALSE}
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel, ))
```
This code chunk also creates a bar chart with 'distribution_channel' on the x-axis and 'count' on the y axis. But it also includes data from 'deposit_type' column as color-coded sections of each bar. There is a legend explaining what each color represents on the right side of the visualization. 

Now try adding 'fill=market_segment' to this code chunk instead of 'fill=deposit_type':

```{r pressure, echo=FALSE}
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel, ))
```
This bar chart is similar to the previous chart, except that 'market_segment' data is being recorded in the color-coded sections of each bar. 

## Step 6: Facets galore

After reviewing the new charts, your stakeholder asks you to create separate charts for each deposit type and market segment to help them understand the differences more clearly.

You know that the `facet_` function can do this very quickly.

Add 'deposit_type' after the '~' symbol in the code chunk below to create a different chart for each deposit type:
```{r creating a plot}
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~ )
```

This code chunk creates three bar charts for 'no_deposit', non_refund', and 'refundable' deposit types. You notice that it's hard to read the x-axis labels here, so you add one piece of code at the end that rotates the text to 45 degrees to make it easier to read. 

Try it out below:
```{r creating a plot with rotated labels}
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type) +
  theme(axis.text.x = element_text(angle = 45))
```
This code chunk creates a similar bar chart to the previous chunk, but now the labels on the x axis with the different distribution channels are clearer.

You can use the same syntax to create a different chart for each market segment:
```{r creating a plot}
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~market_segment) +
  theme(axis.text.x = element_text(angle = 45))
```

The `facet_grid` function does something similar. The main difference is that `facet_grid` will include plots even if they are empty. Run the code chunk below to check it out:

```{r creating a plot}
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_grid(~deposit_type) +
  theme(axis.text.x = element_text(angle = 45))
```
Now you should have three bar charts-- but notice that the 'Refundable' chart has much less data plotted than the other two. 

Now, you could put all of this in one chart and explore the differences by deposit type and market segment.

Run the code chunk below to find out; notice how the ~ character is being used before the variables that the chart is being split by: 
```{r creating a plot}
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type~market_segment) +
  theme(axis.text.x = element_text(angle = 45))
```

These charts are probably overwhelming and too hard to read, but it can be useful if you are exploring your data through visualizations.  

## Activity Wrap Up
The `ggplot2` package allows you to create a variety of visualizations in `R`, from simple scatter plots to complicated, multi-faceted bar charts. You can practice these skills by modifying the code chunks in the rmd file, or use this code as a starting point in your own project console. As you continue exploring aesthetic arguments in `ggplot2`, consider how you might use visualizations to gain insights and make observations about other kinds of data in the future. 


---
title: "Lesson 4: Annotations Solutions"
output: html_document
---

## Annotating and saving solutions

This document  contains the solutions for the annotating and saving activity. You can use these solutions to check your work and ensure that your code is correct or troubleshoot your code if it is returning errors. If you haven't completed the activity yet, we suggest you go back and finish it before reading the solutions.

If you experience errors, remember that you can search the internet and the RStudio community for help:
https://community.rstudio.com/#

## Step 1: Import your data

The data in this example is originally from the article Hotel Booking Demand Datasets (https://www.sciencedirect.com/science/article/pii/S2352340918315191), written by Nuno Antonio, Ana Almeida, and Luis Nunes for Data in Brief, Volume 22, February 2019.

The data was downloaded and cleaned by Thomas Mock and Antoine Bichat for #TidyTuesday during the week of February 11th, 2020 (https://github.com/rfordatascience/tidytuesday/blob/master/data/2020/2020-02-11/readme.md).

You can learn more about the dataset here:
https://www.kaggle.com/jessemostipak/hotel-booking-demand

Run the code below to read in the file 'hotel_bookings.csv' into a data frame: 

```{r}
hotel_bookings <- read.csv("hotel_bookings.csv")
```

## Step 2: Refresh Your Memory

By now, you are pretty familiar with this data set. But you can refresh your memory with the `head()` and `colnames()` functions. Run two code chunks below to get at a sample of the data and also preview all the column names:

```{r look at data}
head(hotel_bookings)
```

```{r look at column names}
colnames(hotel_bookings)
```

## Step 3: Install and load the 'ggplot2' package (optional)

If you haven't already installed and loaded the `ggplot2` package, you will need to do that before you can use the `ggplot()` function. You only have to do this once though, not every time you call `ggplot()`.

You can also skip this step if you haven't closed your RStudio account since doing the last activity. If you aren't sure, you can run the code chunk and hit 'cancel' if the warning message pops up telling you that have already downloaded the `ggplot2` package.

Run the code chunk below to install and load `ggplot2`. This may take a few minutes!

```{r loading and installing ggplot2, echo=FALSE, message=FALSE}
install.packages('ggplot2')
library(ggplot2)
```

## Step 4: Annotating your chart

As a refresher, here is the chart you created before:
```{r faceting a plot}
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel)
```

The first step will be adding a title; that is often the first thing people will pay attention to when they encounter a data visualization for the first time. To add a title, you will add `labs()` at the end of your `ggplot()` command and then input a title there:

```{r faceting a plot with a title}
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  labs(title="Comparison of market segments by hotel type for hotel bookings")
```


You also want to add another detail about what time period this data covers. To do this, you need to find out when the data is from. 

You realize you can use the `min()` function on the year column in the data:

```{r earliest year}
min(hotel_bookings$arrival_date_year)
```
 
And the `max()` function:
```{r latest year}
max(hotel_bookings$arrival_date_year)
```

But you will need to save them as variables in order to easily use them in your labeling; the following code chunk creates two of those variables: 
```{r latest date}
mindate <- min(hotel_bookings$arrival_date_year)
maxdate <- max(hotel_bookings$arrival_date_year)
```

Now, you will add in a subtitle using `subtitle=` in the `labs()` function. Then, you can use the `paste0()` function to use your newly-created variables in your labels. This is really handy, because if the data gets updated and there is more recent data added, you don't have to change the code below because the variables are dynamic:

```{r city bar chart with timeframe}
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  labs(title="Comparison of market segments by hotel type for hotel bookings",
       subtitle=paste0("Data from: ", mindate, " to ", maxdate))
```

You decide to switch the `subtitle`  to a `caption` which will appear in the bottom right corner instead.

```{r city bar chart with timeframe as caption}
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  labs(title="Comparison of market segments by hotel type for hotel bookings",
       caption=paste0("Data from: ", mindate, " to ", maxdate))
```

Now you want to clean up the x and y axis labels to make sure they are really clear. To do that, you can add to the `labs()` function and use `x=` and `y=`. Feel free to change the text of the label and play around with it:

```{r city bar chart with x and y axis}
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  labs(title="Comparison of market segments by hotel type for hotel bookings",
       caption=paste0("Data from: ", mindate, " to ", maxdate),
       x="Market Segment",
       y="Number of Bookings")
```

## Step 5: Saving your chart

The `ggsave()` function was used to save the last plot that was generated, so if you have run something after running the code chunk above, then run that code chunk again. 

Then run the following code chunk to save that plot as a .png file named `city_payment_chart`, which makes it clear to your stakeholders what the .png file contains. Now you should be able to find this file in your 'Files' tab in the bottom right of your screen. Check it out!

```{r save your plot}
ggsave('hotel_booking_chart.png')
```

## Practice quiz
What are the default dimensions that `ggsave()` saved your image as?

A: 5x5
B: 10x10
C: 7x7
D: 25x25

Answer: C. The default dimensions  of this ggsave() image are 7x7. You can see these dimensions listed after you run the code chunk. 

If you wanted to make your chart bigger and more rectangular to fit the slide show presentation, you could specify the height and width of your .png in the `ggsave()` command. Edit the code chunk below to create a 16x8 .png image: 

```{r save your plot}
ggsave('hotel_booking_chart.png',
       width=16,
       height=8)
```























