# Using Big Data to Analyze China's Media and Foreign Affairs <br/> Fall 2019 Capstone Project
#December 8th
**Daily Hours** 2
**Cumulative Hours** 31
Update: I added all the countries in all confidence level in one table. However, I found out on Turkmenistan country. I found out on confidence level 70 and 100 on western sources have the same number and I need to redo those again. 

Issues:
On Georgia, in the first time I tried to get the results I received no numbers and tried again on the second time to reconfimred it and I received the same results. I'm not sure if that is an error or not on GDELT. 
Another problem, I found out I made a mistake that on Turkmenistan country have the same number on confidence level 70 and 100. I will redo them.

#December 7th
**Daily Hours** 3
**Cumulative Hours** 29

Update: Currently adding all the countries in one table. I needed 6 more left to do. After that fix the format correctly. I missed Azerbajan 100 confidence level. So I'm waiting for the results. I should get everything by tomorrow.
#December 5th
**Daily hours** 5

Update:
I'm currently workin on the long table for all countries, for all confidence level. Also it will help me to look for errors if the tables has as same numbers on different confidence level. Also, I created 2 csv file to add those for the heatmap. 


#December 1st
**Daily Hours** 3
**Cumulative Hours** 26

Update:
I created the table for Kyrgyzstan results and as well created the csv file for the heatmap. I'm currently waiting for the results for Banagladesh. 


Update:
I found out I missed 3 countries. The countries are Bhutan, Kyrgyzstan and Banagladesh. I'm not sure if I'll able to finish all confidence level for these countries by Wednesday since getting the results for western sources takes lot of times.

#Friday, November 29th
**Daily Hours** 3
**Cumulative Hours** 23

Update: 
I continue to work on the Chinese sources on all confidence level. So far I completed 7 countries in all sources in all confidence level. I should able to finish all of them by tomorrow night. 

#Thursday, November 14th

**Daily Hours** 5

**Cumulative Hours** 20

Update:
I was hopin I finish all the local sources in confidence level by the next meeting but unfortunately it took longer than I expected. So far I did 10 local countries in all confidence level.
I just need 4 more local countries which are Kyrgyzstan, Turkmenistan, Uzbekistan. As for India and Pakistan, all I need to 0 confidence level. India and Pakistan will take time to get the results. I will let it run overnight. 
I hope I will finish it by midnight tomorrow. 

Issues:
There is no local sources in top 20 for Mongolia. I sitll need to look for Bhutan and Bungladesh. 

#Monday, November 11th

**Daily Hours** 2
**Cumulative hours ** 14-15


I added 3 tables on local countries on Nepal, Afghanistan and Kazakhstan. All of
these run in 30 confidence level. Once I finish all the countries in 30 confidence level. I can move on to 50 confidence level by this Friday if I can. 


#Sunday, November 10th

Last night, I looked over the countries for South and Central Asia to see if there any countries I missed. I found out I missed Sir Lanka(CE), Azerbajan(AJ), Iran (IR), Georgia (GG) and Armenia(AM). I will added the update top 10 sources in seperate file. It will be called
Updatetop10source. I also extended to top 20 sources in case there are more local sources after the top 10 sources. I will continue to work on the latest task for other countries. 
#Saturday, November 9th



Small update as I continue get results for average tone on local countries.

I noticed I made a mistake on Sri Lanka which it's supposed to be CE instead of PK. I'm not sure how that happened. So I fixed the top 10 sources for Sri Lanka on top10 sources file. 
I apologize for the error I made. 

Also I only found two local sources to get the results for Nepal NP.
#Friday, November 1st

**Daily Hours** 2

**Cumulative hours** 11
Update
I added the tables for Chinese, Western and local sources for India. 
I will try to experiment over the weekend if possible. I might do different confidence level if I can. 

#Tuesday, October 29

**Daily Hours** 3

**Cumulative hours** 9

Today I've got a chance to work on the latest task. The first thing I did is look 
for tutorial on how to join two tables into one. The first script I've done was 
`select(select count(*), count(NumSources) FROM events WHERE (Actor1CountryCode 
= 'CHN' OR Actor2CountryCode = 'CHN') AND ActionGeo_CountryCode = 'IN') SELECT 
AVG(MentionDocTone), STDEV(MentionDocTone) from eventmentions)`but after a while
I thought it won't work that way. 

The second thing I've done is use the script that counts the number of sources 
and add the count of the MentionSourceName column, average of the tone 
column and finally the standard deviation in tone. The result is `(545945, 545945, -1.2300500343483294, 2.768127792527951)`. 
Ignoring the first one, 545945 is the count of the MentionSource Column, the negative number is the average MentionDocTone and last one for 2.768127792527951 is the standard deviation in tone.
The script was `SELECT count(*), count(MentionSourceName), AVG(MentionDocTone), STDDEV(MentionDocTone) from eventmentions where GLOBALEVENTID in (SELECT GLOBALEVENTID FROM events WHERE (Actor1CountryCode = 'CHN' OR Actor2CountryCode = 'CHN') AND ActionGeo_CountryCode = 'IN') limit 10;`
It took me 20 minutes to get the result I got from above. 

I added the mentionsourcename however the result I got was empty. I couldn't figured out what was the problem. I will ask either Max or Sutter tomorrow in person to discuss the issues I have. 


Issues/Problems:
I'm not sure the negative numbers for AVG(MentionSource). Again I need to talk to Sutter or Max if they got the similar results. 

#Tuesday, October 22
**Daily Hours**2,
**Cumulative Hours** 6

Quick update
I updated the top 10 sources in each region. Also I wanted to check if I can get the results using `SELECT V2Themes FROM gkg WHERE DocumentIdentifier in (SELECT MentionIdentifier FROM eventmentions WHERE GLOBALEVENTID in (SELECT GLOBALEVENTID FROM events WHERE (Actor1CountryCode = 'CHN' OR Actor2CountryCode = 'CHN') AND ActionGeo_CountryCode = 'SF’))`
Sutter is using but in Spyder software. 

Issues/Problems:
- wanted to see if I can get the top theme using spyder software. However I waited more than 30 minutes and I assume it is the same thing for me.  

Learning/breakthroughs:
- 

#Tuesday, October 8
**Daily Hours**2,
**Cumulative Hours** 4

I count and calculate the average of NumSources. I only look at the population and the economy by rank.
Here is a link
https://www.worldatlas.com/articles/the-population-and-economy-of-the-south-asian-countries.html

Issues/Problems:
-When I tried to run on MySQL to look for Sri Laka but it kept giving me error 2013 which I kept losing connection. 

Learning/breakthroughs:
-I did the countries by rank in population and Economy. I will continue to do more AVG(NumSources) and update on the count file. I will try to generate the top 10 list that are reporting on site tomorrow morning. 

## Tuesday, October 3
**Daily Hours:** 1,
**Cumulative Hours:**2 

short update

Issues/Problems:
- I'm having difficulty finding the country I'm supposed to look for but I found it. 
Learnings/Breakthroughs:
- I found the country I'm going to work on. I found South Asia which I wrote `Select Actor1CountryCode FROM events where actor1countrycode = "SAS" limit 10`. Tomorrow I will look at the confidence scores. If I recall, I believe we can start at 30 percent. I will look into that together mention and the events. I will try to play around creating the data graphics like bars charts and other similar charts using the GDELT database.  
# Using Big Data to Analyze China's Media and Foreign Affairs <br/> Fall 2019 Capstone Project

## Tuesday, October 1
**Daily Hours:** 1,
**Cumulative Hours:**1 

 

Issues/Problems:
- I have yet to find some issues. The only issues I'm having is finding the country that I need to work on. I tried this `Select actor1countrycode FROM events where actor1countrycode like '%South and Central Asia%' limit 50` but gives me error code 2013 which it says lost connection. 

Learnings/Breakthroughs:
- I look over the database by using `SELECT * FROM events limit 10` One of the columns that caught my attention is actor1Code which I as
