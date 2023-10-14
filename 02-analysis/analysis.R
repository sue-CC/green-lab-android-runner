data0 = read.table("/Users/suecai/Desktop/Green Lab/combined.txt", header = TRUE)
head(data0)
attach(data0)
# RQ1
#notif_on = data0[data0$notification_status == "on" & data0$distribution == "burst"& data0$frequency == "high"& data0$browser =="chrome", ]
notif_on = data0[data0$notification_status == "on",]
notif_off = data0[data0$notification_status == "off",]


#Normality check when notification is ON
par(mfrow=c(1,2))
hist(notif_on$Energy_trapz.J.,main = "Histogram - Notification ON")
qqnorm(notif_on$Energy_trapz.J., main = "Q-Q plot - Notification ON")
shapiro.test(notif_on$Energy_trapz.J.)

#Normality check when notification is OFF
par(mfrow=c(1,2))
hist(notif_off$Energy_trapz.J.,main = "Histogram - Notification OFF")
qqnorm(notif_off$Energy_trapz.J., main = "Q-Q plot - Notification OFF")
shapiro.test(notif_off$Energy_trapz.J.)

#data exploration
summary(notif_on$Energy_trapz.J.)
sd(notif_on$Energy_trapz.J.)
summary(notif_off$Energy_trapz.J.)
sd(notif_off$Energy_trapz.J.)
## box plot with two different 
par(mfrow=c(1,2))
boxplot(notif_on$Energy_trapz.J., main = "Notifcation ON")
boxplot(notif_off$Energy_trapz.J., main = "Notification OFF")



#RQ1-1
# generate data sets with different browsers
chrome_off = data0[data0$browser == "chrome"&data0$notification_status == "off",]
chrome_on = data0[data0$browser == "chrome"&data0$notification_status == "on",]
firefox_off = data0[data0$browser == "firefox"&data0$notification_status == "off",]
firefox_on = data0[data0$browser == "firefox"&data0$notification_status == "on",]
# data exploration
summary(chrom$Energy_trapz.J.)
sd(chrome$Energy_trapz.J.)
summary(firefox$Energy_trapz.J.)
sd(firefox$Energy_trapz.J.)
## box plot with two different browsers
par(mfrow=c(1,2))
hist(chrome_off$Energy_trapz.J., main = "chrome off")
hist(chrome_on$Energy_trapz.J., main = "chrome on")


hist(firefox_off$Energy_trapz.J., main = "firefox off")
hist(firefox_on$Energy_trapz.J., main = "firefox on")

qqplot(firefox_on$Energy_trapz.J.)
plot(density(firefox_on$Energy_trapz.J.), main = "Firefox on")
plot(density(firefox_off$Energy_trapz.J.), main = "Firefox off")

boxplot(chrome_off$Energy_trapz.J., main = "Chrome")
boxplot(firefox_off$Energy_trapz.J., main = "Firefox")
par(mfrow=c(1,2))
hist(chrome$Energy_trapz.J., main = "Chrome")
hist(firefox$Energy_trapz.J., main = "Firefox")



RQ2-1
# generate data sets
idle = data0[data0$frequency == "idle",]
low = data0[data0$frequency == "low",]
high = data0[data0$frequency == "high",]
# data exploration
summary(idle$Energy_trapz.J.)
sd(idle$Energy_trapz.J.)
summary(low$Energy_trapz.J.)
sd(low$Energy_trapz.J.)
summary(high$Energy_trapz.J.)
sd(high$Energy_trapz.J.)
# box plot
par(mfrow=c(1,3))
boxplot(idle$Energy_trapz.J., main = "idle")
boxplot(low$Energy_trapz.J., main = "low")
boxplot(high$Energy_trapz.J., main = "high")
# histogram plot
hist(idle$Energy_trapz.J., main = "idle")
hist(low$Energy_trapz.J., main = "low")
hist(high$Energy_trapz.J., main = "high")


RQ2-2
# generate data sets
even = data0[data0$distribution == "even"&data0$browser == "firefox",]
burst = data0[data0$distribution == "burst"&data0$browser == "firefox",]
distribution = list(x = even$Energy_trapz.J., y = burst$Energy_trapz.J.)
# data exploration
summary(idle$Energy_trapz.J.)
sd(idle$Energy_trapz.J.)
summary(even$Energy_trapz.J.)
sd(even$Energy_trapz.J.)
summary(burst$Energy_trapz.J.)
sd(burst$Energy_trapz.J.)
# box plot
#par(mfrow=c(1,3))
boxplot(distribution, names = c("even", "burst"))
boxplot(idle$Energy_trapz.J., main = "idle")
boxplot(even$Energy_trapz.J., main = "even")
boxplot(burst$Energy_trapz.J., main = "burst")
# histogram plot
hist(idle$Energy_trapz.J., main = "idle")
hist(even$Energy_trapz.J., main = "even")
hist(burst$Energy_trapz.J., main = "burst")

