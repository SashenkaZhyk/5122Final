#

library(shiny)
library(data.table)
library(dplyr)
library(ggplot2)
library(knitr)
library(stringr)
library(DT)
library(shinythemes)

orders <- fread('C:/Users/zhyks/Desktop/Assigments/Final/instacart2017/Data Folder/orders.csv')
products <- fread('C:/Users/zhyks/Desktop/Assigments/Final/instacart2017/Data Folder/products.csv')
order_products <- fread('C:/Users/zhyks/Desktop/Assigments/Final/instacart2017/Data Folder/order_products__train.csv')
order_products_prior <- fread('C:/Users/zhyks/Desktop/Assigments/Final/instacart2017/Data Folder/order_products__prior.csv')
aisles <- fread('C:/Users/zhyks/Desktop/Assigments/Final/instacart2017/Data Folder/aisles.csv')
departments <- fread('C:/Users/zhyks/Desktop/Assigments/Final/instacart2017/Data Folder/departments.csv')

orders <- orders %>% mutate(order_hour_of_day = as.numeric(order_hour_of_day), eval_set = as.factor(eval_set))
products <- products %>% mutate(product_name = as.factor(product_name))
aisles <- aisles %>% mutate(aisle = as.factor(aisle))
departments <- departments %>% mutate(department = as.factor(department))



# Define UI for application that draws a histogram
ui <- fluidPage(theme = shinytheme("united"),
   
   # Application title
   titlePanel("Instacart Market Basket Analysis"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        h4("What is Instacart?"),
        p("Instacart saves you trip to the market — Instacart delivers 
          groceries in as little as an hour! It connects you with Personal 
          Shoppers in your area to shop and deliver groceries from your favorite stores."),
        h4("Shopping with Instacart is easy!"),
        p("1. Shop your favorite local grocery stores using your computer, iPhone, iPad or Android device"),
        p("2. Schedule a delivery.Have your groceries delivered in as little as an hour!
          You can also have them delivered later in the day or week."),
        p("3.Get groceries delivered to you!")
        ),
      
      mainPanel( img(src = "instacart.png", height = 140, width = 400),
        tabsetPanel(
           tabPanel(
        title ="About" ,
        h1("Exploratory Analysis of Instacart"),
                p("This application is intended to aid 
                  inventory logistics planning based on the prior customer purchase history."),
                br(),
                h2("Dataset Characteristics"),
                p("The dataset consists of information about 3.4 million grocery orders,
                  distributed across 6 csv files.")),
          tabPanel(
            title ="Products"
            ),
          tabPanel(
            title ="Orders" )
        )
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
 
}
# Run the application 
shinyApp(ui = ui, server = server)

