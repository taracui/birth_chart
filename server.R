shinyServer(function(input, output, session){
  
  df_data <- reactive({
    subset(df1, year %in% input$year)
  })
  
  output$plot1 <- renderPlot({
    plot1 <- ggplot(df_data(), aes(race, percent, fill = type)) +
        geom_bar(position = "dodge", stat = "identity") + 
        ylab("Percent of Events\n") +
        xlab("Race/Ethnicity") +
        scale_fill_discrete(name = "Event Type") +
        theme(axis.text.x = element_text(size = 14, angle = 45, hjust = 1), 
              axis.text.y = element_text(size = 14),
              axis.title = element_text(size = 16, face = "bold", vjust = .3),
              legend.title = element_text(size = 14, face = "bold"),
              legend.text = element_text(size = 14),
              plot.title = element_text(size = 18, face = "bold"),
              strip.text = element_text(size = 16, face = "bold"))
    if(length(input$year) == 1){
      plot1 + ggtitle(as.character(input$year)) 
    } else{
      plot1 + facet_wrap(~year)
    }
  })
  output$df <- renderDataTable({
    df <- df_data()
    names(df) <- c("Year", "Race", "Type of Birth Event", "Total Births for Race", "# of Birth Events by Type", "% of Birth Events by Type")
    return(df)
  }, options = list(pageLength = 10, autoWidth = FALSE))
  
  output$df_download <-downloadHandler(
    filename <- function(){
      return("LACountybirths.csv")
    },
    content <- function(filename){
      df <- df_data()
      names(df) <- c("Year", "Race", "Type of Birth Event", "Total Births for Race", "# of Birth Events by Type", "% of Birth Events by Type")
      write.csv(df, file = filename, row.names = FALSE)
    }
  )
  })




