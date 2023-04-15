# botNetBanner
THIS ASSUMES wget and jq are installed, if not, further assumed you can and will install those 2 things. 

Ban amazon EC2 instances (or others if you so choose). I found hundreds of these ip's visiting a site every wednesday @ 3am spiking traffic, and exponentially increasing bounce rate. I tried robot.txt, htaccess, useragent filtering and other configs to no avail. The easiest and most effective way is to block the source from access versus determining a useragent or other facts that are extremely dynamic. 

Effectively this a reverse/negative SEO tactic (it actually works). Google claims bounce rate isn't related to rankings but.... first hande knowledge and experience proves otherwise, rankings dropped ~ 5 points and slowly like the whole boiling frog scenario. The only way to know and spot this to to filter analytics from geographical region......BROADMAN OREGON or ASHBURN VA.....AMAZAON DATACENTER LOCATIONS..... at specific and reoccuring times. The $$$ marketing consultant we had, provided no useful or valid input or idea on the who what when or how. Hence my foray into google analytics source, city report. 

clone, make executable and schedule it as a cron job and poof bye bye botnet. Thank you amazon for a comprehensive list of your servers and ip's 

light reading
https://www.reddit.com/r/PPC/comments/4ci1yb/bot_traffic_from_boardman_or/

zombie traffic
https://www.seroundtable.com/google-zombie-traffic-21083.html
