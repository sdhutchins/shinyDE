library(shiny)
library(shinythemes)

shinyUI(navbarPage(
  title = "shinyDE",
  theme = shinytheme("lumen"),
  # Home Tab
  tabPanel(
    "Home",
    HTML('<!-- Welcome Banner -->
                                 <center><div class="jumbotron"><h1>shinyDE</h1>
                                 <br/>
                                 <p>A shiny app to calculate differential expression (DE) across multiple R packages and return an
                                 overlap list between multiple DE callers.</p></center>'),
    br(),
    br(),
    HTML('<center><h3>Created by:</h3><br/><img src="UM.png" width = "400px", height = "70px"></center>'),
    # Copy the line below to make a file upload manager
    fluidRow(column(12, align = "left", includeHTML("www/home.html")))
  ),
  # Instructions Tab
  tabPanel(
    "Instructions",
    HTML('<!-- Welcome Banner -->
                                 <center><div class="jumbotron"><h1>Instructions</h1>
                                 <br/></center>'),
    br(),
    # Copy the line below to make a file upload manager
    fluidRow(column(12, align = "left", includeHTML("www/instructions.html")))
  ),
  # Differential Expression Analysis Tab
  tabPanel("Differential Expression Analysis", sidebarLayout(
    sidebarPanel(
      tags$div(),


      # radioButtons("dist", "DE Method : ", c("edgeR"="edgeR", "DESeq"="DESeq", "baySeq"="baySeq", "ALL"="ALL")),
      checkboxGroupInput("differential_callers", label = h4("DE Methods:"), choices = list("edgeR" = "edgeR", "DESeq2" = "DESeq2", "baySeq" = "baySeq", "NOISeq" = "NOISeq", "SAMSeq" = "SAMSeq", "DEGseq" = "DEGSeq", "EBSeq" = "EBSeq", "PoissonSeq" = "PoissonSeq")),

      fileInput("file1", "Choose matrix count file to upload:",
        accept = c(
          "text/csv",
          "text/comma-separated-values",
          "text/tab-separated-values",
          "text/plain",
          ".csv",
          ".tsv"
        )
      ),


      actionButton("do", "Run Query"),
      tags$br(),
      tags$br(),
      downloadButton("downloadData", "Download Results"),
      tags$br(),
      tags$br(),
      img(src = "UM.png", width = "225px", height = "40px"),
      width = 2
    ),

    mainPanel(
      tabsetPanel(type = "tabs", tabPanel("Differential Expression Table", value = "mytable1", dataTableOutput("mytable1")), tabPanel("Heatmap", plotOutput("GTEx_Heatmap"), height = "auto", width = "auto"), tabPanel("VennDiagram", plotOutput("venn"), height = "auto", width = "auto"), tabPanel("Ontologies", dataTableOutput("mytable5")))
      # tabsetPanel(type = "tabs", tabPanel("GTEx_Data Table", dataTableOutput("mytable1")), tabPanel("DESeq", dataTableOutput("mytable2")), tabPanel("baySeq", dataTableOutput("mytable3")), tabPanel("Intersecting Table", dataTableOutput("mytable4")), tabPanel("Venn", plotOutput("venn_it")), tabPanel("Heatmap",plotOutput("GTEx_Heatmap")))
    )
  ))
))