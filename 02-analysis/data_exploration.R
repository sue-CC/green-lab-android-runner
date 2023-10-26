# loading data
data0 = read.table("/Users/suecai/Documents/GreenLab/green-lab-android-runner/01-data-processing/combined.txt", header = TRUE)
head(data0)

# RQ-1: Notification status
# prepare data
chrome_off = data0[data0$browser == "chrome"&data0$notification_status == "off",]
chrome_on = data0[data0$browser == "chrome"&data0$notification_status == "on",]
firefox_off = data0[data0$browser == "firefox"&data0$notification_status == "off",]
firefox_on = data0[data0$browser == "firefox"&data0$notification_status == "on",]

#box plot
chrome_status = list(x= chrome_off$Energy_trapz.J, y = chrome_on$Energy_trapz.J., z = firefox_off$Energy_trapz.J., w = firefox_on$Energy_trapz.J.)
boxplot(chrome_status, names = c("chrome_off", "chrome_on", "firefox_off", "firefox_on"), main = "Boxplot of Chrome and Firefox", xlab = "browsers and notification status", ylab = "Energy_trapz.J")

#RQ2: Imapct of distribution patterns (Chrome)
# prepare data
chrome_idle = data0[data0$browser == "chrome"&data0$notification_status == "on"&data0$frequency == "idle",]
chrome_low_even = data0[data0$browser == "chrome"&data0$notification_status == "on"&data0$frequency == "low"&data0$distribution == "even",]
chrome_low_burst = data0[data0$browser == "chrome"&data0$notification_status == "on"&data0$frequency == "low"&data0$distribution == "burst",]
chrome_high_even = data0[data0$browser == "chrome"&data0$notification_status == "on"&data0$frequency == "high"&data0$distribution == "even",]
chrome_high_burst = data0[data0$browser == "chrome"&data0$notification_status == "on"&data0$frequency == "high"&data0$distribution == "burst",]

#box plot
chrome_notification = list(x= chrome_idle$Energy_trapz.J, y = chrome_low_even$Energy_trapz.J., z = chrome_low_burst$Energy_trapz.J., w = chrome_high_even$Energy_trapz.J., v = chrome_high_burst$Energy_trapz.J.)
boxplot(chrome_notification, names = c("chrome_idle", "chrome_low_even", "chrome_low_burst","chrome_high_even", "chrome_high_burst"), main = "Boxplot of Chrome", xlab = "Notification Patterns", ylab = "Energy_trapz.J")

#RQ2: Imapct of distribution patterns(Firefox)
#prepare data
firefox_idle = data0[data0$browser == "firefox"&data0$notification_status == "on"&data0$frequency == "idle",]
firefox_low_even = data0[data0$browser == "firefox"&data0$notification_status == "on"&data0$frequency == "low"&data0$distribution == "even",]
firefox_low_burst = data0[data0$browser == "firefox"&data0$notification_status == "on"&data0$frequency == "low"&data0$distribution == "burst",]
firefox_high_even = data0[data0$browser == "firefox"&data0$notification_status == "on"&data0$frequency == "high"&data0$distribution == "even",]
firefox_high_burst = data0[data0$browser == "firefox"&data0$notification_status == "on"&data0$frequency == "high"&data0$distribution == "burst",]

#box plot
firefox_notification = list(x= firefox_idle$Energy_trapz.J, y = firefox_low_even$Energy_trapz.J., z = firefox_low_burst$Energy_trapz.J., w = firefox_high_even$Energy_trapz.J., v = firefox_high_burst$Energy_trapz.J.)
boxplot(firefox_notification, names = c("Firefox_idle", "Firefox_low_even", "Firefox_low_burst","Firefox_high_even", "Firefox_high_burst"), main = "Boxplot of Firefox", xlab = "Notification Patterns", ylab = "Energy_trapz.J")