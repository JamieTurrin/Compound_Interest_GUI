# James Turrin
# March 2016
# Project for Developing Data Products class

# This will create a GUI so the user may enter current age, anticipated age of
# retirement, and current savings (in $$), so that the server.R program may
# calculate how much money (and at what APR) is needed for them to retire
# with their dream savings.

library(shiny)

shinyUI(pageWithSidebar(    # create main page with sidebar
    
    headerPanel("Retirement Savings Account Calculator"),   # header panel w/label
    
    sidebarPanel(        # create sidebar to gather info from user
        numericInput("age","Current age",30,min=0,max=60,step=1),
        numericInput('oldage',"Anticipated retirement age",65,min=50,max=90,step=1),
        numericInput('savings','Current savings in dollars',1000,min=0,max=500000,
                    step=1000),
        numericInput('annualRate','Annual Percent Return',1,min=1,max=20,step=0.2),
        sliderInput("monthly","Monthly contribution to savings",value=100,min=0,
                    max=500,step=20),
        submitButton('Submit')),
    
    mainPanel(     # main page
        plotOutput('balance'),
        textOutput('text1'))  # plot output
    ) )

























