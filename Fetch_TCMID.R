
rm(list = ls())

# open cmd
# a sample:
# java -Dwebdriver.chrome.driver="E:\Selenium\chromedriver.exe" -jarE:\Selenium\selenium-server-standalone-3.8.1.jar

library(RSelenium)  
library(rvest)
library(XML)
library(Rwebdriver)

# remDr <- remoteDriver(browserName = "chrome")
# remDr$open()
# 
# # the main url
# url <- "http://www.megabionet.org/tcmid/search/"
# remDr$navigate(url)
# 
# webpage <- htmlParse(file = remDr$getPageSource()[[1]][1])
# 
# webpage <- read_html(remDr$getPageSource()[[1]][1])
# 
# 
# # xpath1 <- '//*[@id="Info_12"]'
# # btn1 <- remDr$findElement(using = 'xpath', value = xpath1)
# # btn1$clickElement()
# # element_css_find(value = "s2")
# # button1 <- element_xpath_find(value = "//*[@id = 'Herb']")
# # element_click(ID = button1)
# 
# xpath2 <- '//*[@id="id_chinese_Name"]'
# btn2 <- remDr$findElement(using = 'xpath', value = xpath2)
# 
# text <- list("DI LONG")
# btn2$sendKeysToElement(text)
# 
# button1 <- element_xpath_find(value = "/html/body/")
# element_click(ID = button1)
# 
# Info_12
# 
# button1 <- element_xpath_find(value = '//*[@id = "Info_12"]')


start_session(root = "http://localhost:4444/wd/hub/", browser = "chrome")
post.url(url = "http://www.megabionet.org/tcmid/search/")
get.url()
page_title()

btn <- element_xpath_find(value = '//*[@id = "Channel12"]')
element_click(ID = btn)

button1 <- element_xpath_find(value = '//*[@id = "Info_12"]//input')
element_click(ID = button1[1])
keys('DI LONG')
element_click(ID = button1[3])

allhandles <- window_handles()
window_change(allhandles[2])

window_close()
window_change(allhandles[1])

# page_back()
# page_forward()
# page_refresh()

allhandles <- window_handles()
window_change(allhandles[2])

pageSource <- page_source()
search_results <- readHTMLTable(pageSource, which = 1)

num <- which(search_results$V1 == "DI LONG")
value <- paste("//table/tr[",num[1],"]")

value <- "//*[@class = 'table table-striped table-bordered table-hover']/tr[3]//a"

button2 <- element_xpath_find(value = value)
element_click(ID = button2)

page_back()
page_forward()
