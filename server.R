library(shiny)
library(caret)
library(e1071)
data(iris)
inTrain <- createDataPartition(y=iris$Species,p=0.7,list=FALSE)
training <- iris[inTrain,]
modFit <- train(Species~., method="rpart",data=training)


# Define server logic for the iris species UI 
shinyServer(function(input, output) {
  newData <- reactive({data.frame(Sepal.Length=as.numeric(input$SL),Sepal.Width=as.numeric(input$SW),
                                  Petal.Length=as.numeric(input$PL),Petal.Width=as.numeric(input$PW))})
  output$species <- renderPrint({predict(modFit,newData())})
  ##output$species <- renderPrint({"input$SL"}) 
})
  
  