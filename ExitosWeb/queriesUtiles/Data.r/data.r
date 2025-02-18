#Se utliza ctrl+l para limpiar la consola
install.packages("palmerpenguins")
 library(palmerpenguins)
> summary(penguins)
view(penguins)
ggplot(data=penguins,aes(x=flipper_length_mm,y=body_mass_g))+geom_point(aes(color=species))

# The basic concepts of R
#Functions functions are a body of reusable code used to perform specific tasks in R.
#Comments 
#Variables 
#Data types 
#Vectors  a vector is a group of data elements of the same type stored in a sequence in R.
#Pipes A pipe is a tool in R for expressing a sequence of multiple operations. A pipe is represented by a % sign, followed by a &gt; sign, and another % sign.
#Functions begin with function names like print or paste, and are usually followed by one or more arguments in parentheses. 
#An argument is information that a function in R needs in order to run. 
print("Hello world im using R")
?print() #Trae de vuelta la información acerca de la función 
# Keep in mind that functions are case-sensitive, so typing Print with a Capital P brings back an error message.

#Here's an example of a variable 
first_variable <- "this is my variable"     #Este operador <- le asigna su valor a la variable 
second_variable <- 12.5
 
vec_1 <- c(12.5, 45.8, 75.4)
vec_1
#For example, you can use the c() function to store numeric data in a vector. 
c(2.5, 48.5, 101.5)

#To create a vector of integers using the c() function, you must place the letter "L" directly after each number.
c(1L, 5L, 15L)

You can also create a vector containing characters or logicals. 
c(“Sara” , “Lisa” , “Anna”)
c(TRUE, FALSE, TRUE)

You can determine what type of vector you are working with by using the typeof() function. Place the code for the vector inside the parentheses of the function. When you run the function, R will tell you the type. For example: 
typeof(c(“a” , “b”))
#> [1] "character"
typeof(c(1L , 3L))
#> [1] "integer"
Nos dice la cantidad de valores que contiene el vector 
x <- c(33.5, 57.75, 120.05)
length(x)
#> [1] 3
You can also check if a vector is a specific type by using an is function: is.logical(), is.double(), is.integer(), is.character(). In this example, R returns a value of TRUE because the vector contains integers. 
x <- c(2L, 5L, 11L)
is.integer(x)
#> [1] TRUE
y <- c(TRUE, TRUE, FALSE)
is.character(y)
#> [1] FALSE
Naming vectors 
All types of vectors can be named. Names are useful for writing readable code and describing objects in R. You can name the elements of a vector with the names() function. As an example, let’s assign the variable x to a new vector with three elements. 
x <- c(1, 3, 5)
You can use the names() function to assign a different name to each element of the vector. 
names(x) <- c("a", "b", "c")
Now, when you run the code, R shows that the first element of the vector is named a, the second b, and the third c.
x 
#> a b c 
#> 1 3 5
Creating lists 
Lists are different from atomic vectors because their elements can be of any type—like dates, data frames, vectors, matrices, and more. Lists can even contain other lists. 
You can create a list with the list() function. Similar to the c() function, the list() function is just list followed by the values you want in your list inside parentheses: list(x, y, z, …). In this example, we create a list that contains four different kinds of elements: character ("a"), integer (1L), double (1.5), and logical (TRUE). 
list("a", 1L, 1.5, TRUE)
Like we already mentioned, lists can contain other lists. If you want, you can even store a list inside a list inside a list—and so on. 
list(list(list(1 , 3, 5)))

Determining the structure of lists 
If you want to find out what types of elements a list contains, you can use the str() function. To do so, place the code for the list inside the parentheses of the function. When you run the function, R will display the data structure of the list by describing its elements and their types.
Let’s apply the str() function to our first example of a list. 
str(list("a", 1L, 1.5, TRUE)) #Creo que funciona como el dir de python
Let’s use the str() function to discover the structure of our second example.  First, let’s assign the list to the variable z to make it easier to input in the str() function. 
z <- list(list(list(1 , 3, 5)))
Let’s run the function. 
str(z)
Naming lists
Lists, like vectors, can be named. You can name the elements of a list when you first create it with the list() function:

list("Chicago” = 1, “New York” = 2, “Los Angeles” = 3)

Loading tidyverse and lubridate packages
If you haven't already installed tidyverse, you can use the install.packages() function to do so: 
install.packages("tidyverse") 
Next, load the tidyverse and lubridate packages using the library() function. First, load the core tidyverse to make it available in your current R session: 
library(tidyverse)
Then, load the lubridate package: 
library(lubridate)
Types
In R, there are three types of data that refer to an instant in time:

A date ("2016-08-16")
A time within a day (“20:11:59 UTC")
And a date-time. This is a date plus a time ("2018-03-31 18:15:48 UTC")
today()
#> [1] "2021-01-20"
To get the current date-time you can run the now() function. Note that the time appears to the nearest second. 
now()
#> [1] "2021-01-20 16:25:05 UTC"

When working with R, there are three ways you are likely to create date-time formats: 
From a string
From an individual date
From an existing date/time object
R creates dates in the standard yyyy-mm-dd format by default. 
Let's go over each. 
Converting from strings 
ymd("2021-01-20")
When you run the function, R returns the date in yyyy-mm-dd format. 
#> [1] "2021-01-20"
It works the same way for any order. For example, month, day, and year. R still returns the date in yyyy-mm-dd format.
mdy("January 20th, 2021")
#> [1] "2021-01-20"
Or, day, month, and year. R still returns the date in yyyy-mm-dd format.
dmy("20-Jan-2021")
#> [1] "2021-01-20"
These functions also take unquoted numbers and convert them into the yyyy-mm-dd format.
ymd(20210120)
#> [1] "2021-01-20"

Creating date-time components
The ymd() function and its variations create dates. To create a date-time from a date, add an underscore and one or more of the letters h, m, and s (hours, minutes, seconds) to the name of the function:
ymd_hms("2021-01-20 20:11:59")
#> [1] "2021-01-20 20:11:59 UTC"

mdy_hm("01/20/2021 08:01")
#> [1] "2021-01-20 08:01:00 UTC"

You can use the function as_date() to convert a date-time to a date. For example, put the current date-time—now()—in the parentheses of the function. 

as_date(now())
#> [1] "2021-01-20"

If you need to manually create a data frame in R, you can use the data.frame() function. The data.frame() function takes vectors as input. In the parentheses, enter the name of the column, followed by an equals sign, and then the vector you want to input for that column. In this example, the x column is a vector with elements 1, 2, 3, and the y column is a vector with elements 1.5, 5.5, 7.5. 

data.frame(x = c(1, 2, 3) , y = c(1.5, 5.5, 7.5))

If you run the function, R displays the data frame in ordered rows and columns. 

   x y

1  1 1.5

2  2 5.5

3  3 7.5

In most cases, you won’t need to manually create a data frame yourself, as you will typically import data from another source, such as a .csv file, a relational database, or a software program.

Files 
Use the dir.create function to create a new folder, or directory, to hold your files. Place the name of the folder in the parentheses of the function. 
dir.create ("destination_folder")
Use the file.create() function to create a blank file. Place the name and the type of the file in the parentheses of the function. Your file types will usually be something like .txt, .docx, or .csv.  
file.create (“new_text_file.txt”) 
file.create (“new_word_file.docx”) 
file.create (“new_csv_file.csv”) 
If the file is successfully created when you run the function, R will return a value of TRUE (if not, R will return FALSE). 
file.create (“new_csv_file.csv”)
[1] TRUE 
Copying a file can be done using the file.copy() function. In the parentheses, add the name of the file to be copied. Then, type a comma, and add the name of the destination folder that you want to copy the file to. 
file.copy (“new_text_file.txt” , “destination_folder”)
You can delete R files using the unlink() function. Enter the file’s name in the parentheses of the function.
unlink (“some_.file.csv”)

Matrices 
matrix(c(3:8), nrow = 2)
You can also choose to specify the number of columns (ncol = ) instead of the number of rows (nrow = ). 
matrix(c(3:8), ncol = 2)

#Instalar R tools para poder usar 
data("ToothGrowth")
View(ToothGrowth)
filtered_tg <- filter(ToothGrowth,dose==0.5)
View(filtered_tg)
#This also can be written as 
arrange(filter(ToothGrowth, dose==0.5), len)
#Also as 
filtered_toothgrowth <- ToothGrowth %>%
  filter(dose==0.5) %>% 
  arrange(len)
View(filtered_toothgrowth)

Data Frames 
library(ggplot2)
data("diamonds")
View(diamonds)
head(diamonds)
str(diamonds)
colnames(diamonds)
library(tidyverse)
mutate(diamonds)
mutate(diamonds, carat_2=carat*100)
//////////////
names <- c("Rafa","Joaquín","Mati","Iara")
age <- c(19,20,19,17)
people <- data.frame(names,age)
View(people)
mutate(people, age_in_20=age+20)

library(tidyverse)
View(diamonds)
as_tibble(diamonds)

read_csv(): comma-separated values (.csv) files
read_tsv(): tab-separated values files
read_delim(): general delimited files
read_fwf(): fixed-width files
read_table(): tabular files where columns are separated by white-space
read_log(): web log files

data() #Para ver los conjuntos de datos disponibles en R
“readr_example(“mtcars.csv”). 
read_csv(readr_example("mtcars.csv"))


library(readxl)
readxl_example()
read_excel(readxl_example("type-me.xlsx"))
excel_sheets(readxl_example("type-me.xlsx"))
read_excel(readxl_example("type-me.xlsx"), sheet = "numeric_coercion")



install.packages("here")
library("here")
install.packages("skimr")
library("skimr")
install.packages("janitor")
library("janitor")
install.packages("dplyr")
library("dplyr")
install.packages("palmerpenguins")
library("palmerpenguins")
skim_without_charts(penguins)
glimpse(penguins)
head(pennguins)
head(penguins)
penguins %>% 
  select(species)
#El mismo código pero con el - hace que aparezca todo excepto eso
penguins %>% 
  select(-species)
#Changing the name of penguins 
penguins %>% 
  rename(island_new=island)
#this will automatically make our column names lower or upper case
rename_with(penguins, tolower)

rename_with(penguins, toupper)
#This ensures that everything es well written 
clean_names(penguins)

#is currently on asc order and if we want desc order we put arrange(-bill_length_mm)
penguins %>% 
  arrange(bill_length_mm)
#Saving it as a data frame
penguins2 <- penguins %>% 
  arrange(-bill_length_mm)
View(penguins2)
#El drop_na no me funciona
penguins %>% group_by(island) %>% 
  drop_na() %>%
  summarize(mean_bill_length_mm=mean(bill_length_mm))
#Filtering data
penguins %>% 
  filter(species=="Adelie")

id <- c(1:10)
name <- c("John Mendes", "Rob Stewart", "Rachel Abrahamson", "Christy Hickman", "Johnson Harper", "Candace Miller", "Carlson Landy", "Pansy Jordan", "Darius Berry", "Claudia Garcia")

job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")

employee <- data.frame(id, name, job_title)
#Se utiliza para separar los datos de las columnas (hay que instalar todos los paquetes primero)
print(employee)
separate(employee,name,into=c('first_name','last_name'),sep=' ')
#Los une 
unite(employee, "name", job_title, sep=' ')

penguins %>% 
  mutate(body_mass_kg=body_mass_g/1000, flipper_length_mm=flipper_length_mm/1000)


install.packages("Tmisc")
library(Tmisc)
data(quartet)
View(quartet)
quartet %>% 
  group_by(set) %>% 
  summarize(mean(x),sd(x),mean(y),sd(y),cor(x,y))
#Nuevamente tengo el problema de que ahora no me encuentra la funcion "set"
ggplot(quartet,aes(x,y)+geom_point()+geom_smooth(method=lm,se=FALSE)+facet_wrap(-set))

install.packages("datasauRus")
library("datasauRus")
#No me funciona porque no encuentra "dataset" pero deberia mostrar una visualizacion
ggplot(datasaurus_dozen,aes(x=x,y=y,colour=dataset))+geom_point()+theme_void()+theme(legend.position = "none")+facet_wrap(-dataset,ncol=3) 
#Para saber que tan biased es tu data
install.packages("SimDesign")
library("SimDesign")
actual_temp <- c(68.3,70,72.4,71,67,70)
predicted_temp <- c(67.9,69,71.5,70,67,69)
bias(actual_temp,predicted_temp)


install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")

library(tidyverse)
library(skimr)
library(janitor)

setwd("projects/Course 7/Week 3")
#Me funciono dandole a import dataset
hotel_bookings <- read_csv("hotel_bookings.csv")

head(hotel_bookings)
str(hotel_bookings)
glimpse(hotel_bookings)
colnames(hotel_bookings)
#arrange the data by most lead time to least lead time
hotel_bookings_v2 <- arrange(hotel_bookings, desc(lead_time))
head(hotel_bookings_v2)
#the maximum and minimum lead times. in this case, you need to specify which dataset and which column using the $ symbol between their names.
max(hotel_bookings$lead_time)
min(hotel_bookings$lead_time)
#average lead time
mean(hotel_bookings$lead_time)
#what the average lead time before booking is for just city hotels.
hotel_bookings_city <- filter(hotel_bookings, hotel_bookings$hotel=="City Hotel")
head(hotel_bookings_city)
mean(hotel_bookings_city$lead_time)
#Now, your boss wants to know a lot more information about city hotels, including the maximum and minimum lead time. They are also interested in how they are different from resort hotels.
hotel_summary <- 
  hotel_bookings %>%
  group_by(hotel) %>%
  summarise(average_lead_time=mean(lead_time),
            min_lead_time=min(lead_time),
            max_lead_time=max(lead_time))
head(hotel_summary)

library(ggplot2)
library(palmerpenguins)
data("penguins")
View(penguins)
ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))
ggplot(data=penguins) + geom_bar(mapping = aes(x=species))

#Installing Rtools package
writeLines('PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"', con = "~/.Renviron")
Sys.which("make")
install.packages("jsonlite", type = "source")

install.packages("magrittr") # package installations are only needed the first time you use it
install.packages("dplyr")    # alternative installation of the %>%
library(magrittr) # needs to be run every time you start R and want to use %>%
library(dplyr)    # alternatively, this also loads %>%

#Adding color to species 
ggplot(data = penguins) + geom_point(mapping = aes(x=flipper_length_mm, y= body_mass_g,color=species))
#Adding shapes to species 
ggplot(data = penguins) + geom_point(mapping = aes(x=flipper_length_mm, y= body_mass_g,shape=species))
#Both the at the same time 
ggplot(data = penguins) + geom_point(mapping = aes(x=flipper_length_mm, y= body_mass_g,color=species,shape=species))
#Adding size to the previous code
ggplot(data = penguins) + geom_point(mapping = aes(x=flipper_length_mm, y= body_mass_g,color=species,shape=species,size=species))
#Making it transparent
ggplot(data = penguins) + geom_point(mapping = aes(x=flipper_length_mm, y= body_mass_g,alpha=species))
#Turning it to a specific color "purple"
ggplot(data=penguins) + geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g),color="purple")

library("ggplot2")
library("palmerpenguins")
ggplot(data=penguins) + geom_smooth(mapping = aes(x=flipper_length_mm, y=body_mass_g))

#Using combined visuals by ading a + at the end 
ggplot(data=penguins) + geom_smooth(mapping = aes(x=flipper_length_mm, y=body_mass_g)) + 
geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g,color=species,shape=species))

#Using diferent lines for species
ggplot(data=penguins) + geom_smooth(mapping = aes(x=flipper_length_mm, y=body_mass_g,linetype=species))
#Using more diferent types of data visualization
ggplot(data=penguins) + geom_jitter(mapping = aes(x=flipper_length_mm, y=body_mass_g))
#Using now the diamonds dataset that comes with ggplot2
ggplot(data = diamonds) + geom_bar(mapping = aes(x=cut,fill=cut))
#more bar graph
ggplot(data = diamonds) + geom_bar(mapping = aes(x=cut,fill=clarity))

#Using the face wrap function to see diferent kind of graph per species
ggplot(data=penguins) + geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species)) +
  facet_wrap(~species)
#Face wrap with the diamonds dataset
ggplot(data=diamonds) + geom_bar(mapping=aes(x=color,fill=cut)) +
  facet_wrap(~cut)
#Facet grid shows relations between things
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species))+
  facet_grid(sex~species)

#Putting titles to the graph
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species))+
  labs(title="Palmer penguins:Body mass vs Flipper length", subtitle="Sample of three penguin species",caption="data collected by DR...") +
  annotate("text",x=220,y=3500, label="The gentoos are the largest")


#Seleccionando el set de datos y filtrandolo de mayor a menor
library(ggplot2)
library(tidyverse)
Renta_2 <- arrange(Renta_de_productos, desc(Total))
head(Renta_2)
#Filtrando el codigo perteneciente a repuestos usados
RENTA_PROD <- (Renta_de_productos %>% 
                 Filter(CODIGO!="IP118"))
#Filtrando los 10 mejores productos
top_10_productos <- head(RENTA_PROD[,1:3], 10)
#Sacando productos para visualizar por codigo
top_10 <- top_10_productos %>% select(Codigo,Total)
#Visualizacion
ggplot(data=top_10)+geom_col(mapping=aes(x=Total,y=Codigo,color=Codigo,fill=Codigo))+
  labs(title="Top 10 productos más vendidos por precio",subtitle="FV168 es el código más vendido por precio")
  



