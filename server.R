# James Turrin
# March 2016
# Project for Developing Data Products class

# Calculate savings balance based on user input for current age, anticipated
# retirement age, APR, current savings, and monthly contributions,

# Savings account balance is computed using formula for compound interest:
# A = P(1+r/n)^nt
# A = amount of money accumulated after t years
# P = initial deposit amount in dollars
# r = annual percent return expressed as a decimal
# t = length of time money is accumulating interest (years)
# n = number of times money is compounded per year.

# It is assumed money is compounded monthly, ie. n=12.

principal<-function(age,oldage,savings,annualRate,monthly){
    t<-length(seq(age,oldage,0.083333))
    a<-numeric()
    for(i in 1:t){
        if(i==1){
            a[i]<-savings+savings*(annualRate/100/12)+monthly
            print(i)}
        if(i>1){
            a[i]<-a[i-1]+a[i-1]*(annualRate/100/12)+monthly
            print(i)}
    }
    return(round(a,2))
}

library(ggplot2)
# shiny server:
shinyServer(
    function(input,output){
        amount<-reactive(principal(input$age,input$oldage,input$savings,input$annualRate,input$monthly))
        time<-reactive(seq(input$age,input$oldage,0.083333))
        output$balance<-renderPlot({
             qplot(time(),amount(),xlab="Age",ylab="Savings",
                   main="Account balance through time")
        })
        output$text1<-renderText(paste("Your account will contain $",
                        as.character(max(amount())),"at retirement"))
})
 








 