library(shiny)
library(e1071)

# Define UI for iris species application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Iris species prediction"),
  
  # Sidebar with sliders to specify values of different parameters  
  sidebarPanel(
    h4('Instruction (documentation):'),
    h5('Choose the length and width of sepals as well as length and width of petals 
       of flowers via the four sliders. The server would take these inputs to predict 
       iris species of the flower based on the sizes of sepals and petals.
       All measurements are in centimeters.'),
    h4('Length and width of sepal and petal'),
    sliderInput("SL", "Sepal Length", min=4.3, max=8, value=6, step=0.1),
    sliderInput("SW", "Sepal Width", min=2, max=4.4, value=3.2, step=0.1),
    sliderInput("PL", "Petal Length", min=1, max=6.9, value=4, step=0.1),
    sliderInput("PW", "Petal Width", min=0.1, max=2.5, value=1.3, step=0.1)
  ),
  mainPanel(
    h3('Prediction result'),
    verbatimTextOutput("species")
    )
))
