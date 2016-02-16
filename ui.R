shinyUI(fluidPage(

tags$head(
  tags$style(HTML("@import url(https://fonts.googleapis.com/css?family=Lato:300);",
                  "@import url(https://fonts.googleapis.com/css?family=Lato:700);",
                  ".checkbox{font-family:'Lato'; font-size: 13px; font-weight: 700; color: black;}"))
          ),

fluidRow(
  column(12, align = "center",
  headerPanel(
    h1(br(),"LA County Preterm and Very Preterm Birth Events (2010 - 2013)", 
     style = "font-family:'Lato';
       font-weight: 300; line-height: 1.1; 
       color: black")))), br(), hr(),

fluidRow(
  column(2,
         wellPanel(align = "left",
                   p(class = "text-small", 
                            style = "font-family:'Lato';
                                      font-weight: 300; line-height: 1.1; 
                                      color: black; font-size: 14px;",
                                      "Premature births are a public health issue that disproportionately
                                        affects certain racial/ethnic minority populations. This application uses 
                                        publicly available data from the California Department of Public Health to
                                        visualize premature birth trends by race/ethnicity over a four year period. 
                                        To access the original data source, please click ",
                                        a(href="https://cdph.data.ca.gov/Diseases-and-Conditions/Preterm-and-Very-Preterm-Births-by-Race-Ethnicity-/gwer-r224", 
                                        target="_blank", "here.")), hr(), 
                   checkboxGroupInput("year", choices = c(2010, 2011, 2012, 2013), 
                                      selected = 2010,
                                      p(style = "font-family:'Lato'; font-size: 14px; 
                                      color: black;", "Select Year(s)")))),
  column(10, align = "center",
         mainPanel(
           plotOutput("plot1", height = 525, width = 1150)
         ))),
  
   
fluidRow(
      column(2),
      column(9, br(), br(),
               wellPanel(
                 h3("Data Table", 
                  style = "font-family:'Lato';
                  font-weight: 300; line-height: 1.1; 
                  color: black", downloadButton("df_download", label = "Download Data")),
               dataTableOutput("df"))
             ),
      column(1)
      )))

 

