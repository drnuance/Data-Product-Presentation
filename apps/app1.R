
library(rCharts)
data(freeny)
require(rCharts)
         


output$nvd3plot <- renderChart({
        freey <- data.frame(cbind(as.numeric(freeny.y), freeny.x))
        # seems that aes_string's power is limited in processing space " ".        
        colnames(freey) <- c("Sales", "Revenue", "Price_Index", "Income_Level", "Market_Potential")
#         if (input$y == "Sales" & input$x == "Revenue") {
#                 n1 <- nPlot(Sales ~ Revenue, data = freey, type='lineChart')
#         }
        n1 <- nPlot(Sales ~ Revenue, data = freey, type='lineChart')
        n1$set(dom = 'nvd3plot')
        n1

})
