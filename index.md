---
title       : Identifying Factors Affecting Revenue
subtitle    : Project Presentation for Developing Data Product
author      : Qian (Chandler) Wang
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [shiny, interactive, nvd3]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
ext_widgets : {rCharts: [libraries/nvd3]}
---

## Overview

1. Main Purpose: to demonstrate the ability of using Shiny and Slidify comprehensively that can interact with users and conduct quantatitive anlysis in R

2. App Function: Allow manager to do a simple business analysis on identifying potential factors affecting revenue. A linear regression plot will be generated on any two attributes. Furthermore, quantitative correlation test result will be shown. Suggestion on accept/reject hypothesis will be provided based on P-Value. 

3. Components:
        a) User Inputs
        b) Analysis on Server
        c) Feedback

--- 

## User Input

- User Input mainly contains two dropdown list selection. Users can select the variable to be put on the plot. By default, the Y Axis will be Sales. And the X Axis will be Revenue.

- User can change it and refresh the output by clicking the Update View button (meaning submit in this slide). 

<div class="row-fluid">
  <div class="col-sm-4">
    <form class="well"></form>
  </div>
  <div class="col-sm-8">
    <div class="form-group shiny-input-container">
      <label class="control-label" for="y">X Axis</label>
      <div>
        <select id="y"><option value="Sales" selected>Sales</option>
<option value="Revenue">Revenue</option>
<option value="Price_Index">Price_Index</option>
<option value="Income_Level">Income_Level</option>
<option value="Market_Potential">Market_Potential</option></select>
        <script type="application/json" data-for="y" data-nonempty="">{}</script>
      </div>
    </div>
    <div class="form-group shiny-input-container">
      <label class="control-label" for="x">Y Axis</label>
      <div>
        <select id="x"><option value="Sales">Sales</option>
<option value="Revenue" selected>Revenue</option>
<option value="Price_Index">Price_Index</option>
<option value="Income_Level">Income_Level</option>
<option value="Market_Potential">Market_Potential</option></select>
        <script type="application/json" data-for="x" data-nonempty="">{}</script>
      </div>
    </div>
    <div>
      <button type="submit" class="btn btn-primary">
        <i class="fa fa-refresh"></i>
        Update View
      </button>
    </div>
  </div>
</div>

--- 

## Analysis on Server

The server code mainly do the following three things:
-  Load necessary libraries and Freeny data from the Dataset and imput it to an appropriate data frame.

-  A renderPlot function to prepare the plot using ggplot. A linear regression reference line and its confidential interval will be provided. 

-  A renderText function to conduct the correlation test and then generate output from the result list. The output will be different based on the P-Value and whether to accept or reject the correlation assumption.

---

## Sample Output

Restrict the slide number, we only show the correlation test and ouput on Sales vs. Revenue.


```r
freey <- data.frame(cbind(as.numeric(freeny.y), freeny.x))# Impute Data
colnames(freey) <- c("Sales", "Revenue", "Price_Index", "Income_Level", "Market_Potential")
cor.test(freey$Sales, freey$Revenue, conf.level = 0.01) # Analyze
```

```
## 
## 	Pearson's product-moment correlation
## 
## data:  freey$Sales and freey$Revenue
## t = 91.435, df = 37, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 1 percent confidence interval:
##  0.9977853 0.9978037
## sample estimates:
##       cor 
## 0.9977945
```
