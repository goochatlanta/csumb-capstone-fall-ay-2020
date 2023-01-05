# Using Big Data to Analyze China's Media and Foreign Affairs <br/> Fall 2019 Capstone Project

## Wednesday September 18, 2019
**Daily Hours:** 1.5
**Cumulative Hours:** 1.5

The team was introduced to one of the two mentors, Dr. Elizabeth Gooch via a Zoom call. This initial meeting was to establish the goals and scope of the project. After the call, I looked over the data collected by the summer interns working on this project before us. 

Issues/Problems:
- How to create relevent indexes within each database to allow for faster quieries

Learnings/Breakthroughs:
- The scope of the project from my original understanding was lacking. The full project will cover multiple regions across the world, not just China itself.
- The summer interns were able to visualize many interesting graphs and tables from the scope of their project. They have already layed down the ground work for an easy sprint off the starting line.

## Friday September 20, 2019
**Daily Hours:** 1.5
**Cumulative hours:** 3

Created and presented the project proposal to multiple members of the CSUMB Computer Science Department faculty. Afterwards, addressed their concerns and questions and prepared questions to ask Dr. Liz based off their feedback.

Issues/Problems:
- The current name of the project may be too vague. A faculty member suggested that one could see it as an economic project, a communications project, etc. as opposed to the big data analysis project that it is
- Another faculty member thought of the scope as too vast for students of our calibur, however this concern offered no constructive criticism on how to fix said issue and at the moment our team is going to ignore this concern

Learnings/Breakthroughs:
- A faculty member suggested the use of a programming language we are all familiar with as opposed to learning a new one for use in this project. I agree with this statement

## Wednesday September 25, 2019
**Daily Hours:** 2
**Cumulative:** 5

Had another Zoom call with Elizabeth and discussed how the project presentation went with the CSUMB faculty. We discussed their issues and concerns with our project as well as their recommendations such as changing the title of the project. After this, we discussed how to move forward and divide the project between the four of us. My region of interest is Southeast Asian and South Pacific.

Post Script: All queries to gather counts and sources have used the same python script `SoutheastAsiaQueries.py` and `WestAricaQueries.py` but changing the target country to whichever country is of interest

Issues/Problems:
- The search codes according to the database aren't labeled that well causing confusion between what each query actually tells us
- The platform I'm testing queries with, MySQL Workbench, is having problems with connecting to the database meaning no query can be run

Learnings/Breakthroughs:
- Elizabeth mentioned how the data analysis aspect of the project is doable, and not to worry about not concentrating in Data Science
- The search codes are all listed and allowing a query to be searched for easily

## Friday September 27, 2019
**Daily Hours:** 2
**Cumulative:** 7

Another Zoom call with Elizabeth that helped answer some of my questions. They seemed to be the same questions my other groupmates had regarding queries. We also mentioned indexing again and brainstormed what columns we would like to have indexed.

Issues/Problems:
- The actor country codes are of type `text` which I searched the internet on how to index, but couldn't find any information

Learnings/Breakthroughs:
- I got a working query to display news from Thailand using the query `SELECT * from events WHERE Actor1CountryCode = "THA"  limit 10` which resulted in 10 results almost immediately. This seems to me as though finding news from Thailand won't be that difficult

## Sunday September 29, 2019
**Daily Hours:** 2
**Cumulative:** 9

Spent the afternoon casually reading up on the GDELT code book and researching a few projects similar to ours. I found one that was an interesting read, but on the economic side as opposed to the political side. Link: https://www.bbvaresearch.com/wp-content/uploads/2017/10/Tracking-Chinese-Vulnerability-in-Real-Time-Using-Big-Data.pdf As this is online, I saved the pdf in the event it becomes lost

Issues/Problems:
- I realized that I'm still not certain as to what the final outcome is expected to be and how to get there

Learnings/Breakthroughs:
- After reading the research article posted in today's log, I was able to notice trends in how they used GDELT to analyze the data

## Wednesday October 2, 2019
**Daily Hours:** 4
**Cumulative:** 13

Unfortunately we lost a team member due to personal reasons. This will not deter us however. Our team went to the Naval Postgraduate School to meet with Elizabeth Gooch and Erick Eckstrand in person for the first time. The first part of our meeting was Elizabeth helping us understand what she's looking for. We want to look at a specific country in our region using China as an actor and the country of interest as the country code, both China and the country are reporting on an event and how many times, and finally how the United States of America are viewing the same event and how many times. We will do this for every country in our region and form tables of data. From there we can interpret the data and come to numerous conclusions based on several events across several countries and cross referencing them with China. I'm excited to start writing queries now that I know what exactly I'm looking for. I was also given West Africa, Marco's region, since my region included the least amount of countries and West africa may not yield results for every country listed. After meeting with just Elizabeth, We all met up with Erick and he was able to help us dissect the codes used in our database as well as clarifying what some of the codes mean. With this knowledge, running queries will be much easier as well as more accurate to what we are looking for.

Issues/Problems:
- I looked up the articles from my test query: `SELECT * from events WHERE Actor1CountryCode = "THA"  limit 10` and the very first one, while ironically being about China, had barely anything to do with Thailand, and was actually from an Indian news site which didn't have any sources on where they got this information. Article: https://www.sify.com/news/china-threatens-countermeasures-if-us-enforces-fresh-tariffs-news-international-tfxx6Rbhafghb.html

Learnings/Breakthroughs:
- In regards to the issue from today, I learned that using the `Actor1CountryCode` won't take you to their specific news site, it just shows all mentions of them
- There is a way to filter a query to only come back with specific URLs allowing for us to know the articles are coming from. i.e. .ke (Kenya) or .th (Thailand)

## Thursday October 3, 2019
**Daily Hours:** 1
**Cumulative:** 14

Today I attempted to run the Python script that Sutter wrote only to discover a problem with my computer not having Python3 installed. Spent an hour trying to fix the problem but couldn't.

Issues/Problems:
- My computer doesn't run Python

## Friday October 4, 2019
**Daily Hours:** 2
**Cumulative:** 16

After a quick zoom call with Elizabeth giving her an update on our progress since Wednesday, Diego, Sutter and I talked about any problems we were having that the others have already solved. I had brought up my problem but again I was unable to fix it and thus not able to run any of the queries.

Learnings/Breakthroughs:
- Sutter's indexing and changing of the `Actor1CountryCode` data type to a `varchar()` were completed
- Any queries using `Actor1CountryCode`, `Actor2CountryCode`, and `ActionGeo_CountryCode` will run faster

## Wednesday October 9, 2019
**Daily Hours:** 1
**Cumulative Hours:** 17

We zoomed Elizabeth today to let her know Sutter has started running queries against the `eventmentions` table, and that I have a meeting with a CSUMB faculty member planned for tomorrow

## Thursday October 10, 2019
**Daily Hours:** 10
**Comulative:** 27

I had my meeting with Professor Greg Rainwater in regards to my difficulties on running Python 3 on my laptop. It was discovered that my terminal, Windows Powershell, was listing `Python 2.7.14` after a `python --version` query. He recommended that I uninstall Python 2 from my machine all together. After a quick trip to the uninstall software setting in my computer and then a confused search through every file in the PC via the File Explorer search function, it was determined that I don't have Python 2 installed on my machine at all. I uninstalled Python 3 and redownloaded it from https://www.python.org/downloads/release/python-374/ . Still, Powershell didn't recognize Python 3 as existing, even with a `python3 --version` within the Program Files folder containing Python 3. It also didn't recognize `pip` as a command line term making downloading new packages impossible. After recognizing how much this doesn't make immediate sense, Professor Rainwater recommended to just abandon Windows all together and download a virual machine running Linux as it is vastly better than Windows. After downoading the Oracle VM Virtual Machine using an Ubuntu ISO downloaded from http://releases.ubuntu.com/18.04.3/ubuntu-18.04.3-desktop-amd64.iso?_ga=2.19897018.341056216.1570769106-1500582106.1570769106 , installing `Atom` and downloading the necessary packages for running Python. I was able to run my first unsuccessful query. Some of the countries had strange names within countryCodeConversion.py that did not match what I was querying and I didn't think to double check the names within the dictionaries contained within this file until much trial and error.

##Friday October 25, 2019
**Daily Hours:** 0
**Comulative:** 27

Missed the Zoom call due to medical reasons and will need to be caught up

##Tuesday October 29, 2019
**Daily Hours:** 2
**Cumulative:** 29

I went through the list of sources gathered for Nigeria. Gathered the top 10 sources for the target countries. Using `https://www.allyoucanread.com/` I doublechecked as to wheter or not these sources were legit news organizations from the region. I will be using this website to doublecheck for all countries in my regions.

Issues:
- As the number of sources decrease from the thousands, that's where the American sources were found.

Learnings/Breakthroughs:
- CNN and Fox News were not in the top 10 reputable sources in America talking about Nigeria and China they also had the same number of articles written

##Thursday October 31, 2019
**Daily Hours:** 4 (Not counting waiting for queries to finish)
**Cumulative:** 33

After gathering the top sources of Nigeria and Philippines I ran them both as a query. In the Python folder I've uploaded the code that gave me the results for the tone and standard deviation for articles in both countries. Since my queries have finished, I'm going to attempt to gather additional information from Vietnam (called Viet Nam in the database) and attempt to run a table query that will be complete when I wake up.

Learnings/Breakthroughs:
- It appears as though Western sources haven't liked anything China has been doing in any country outside of their own. Both Nigeria and Philippines had a -2+ score in tone
- Nigeria actually favoured China (I'm assuming based on the roads being built that China is paying for) whereas Philippines have a negative tone
- In the Philippenes, China has a mostly neutral score of `0.39419553190735446` but both Western And Philippenes news outlets still view China's actions as negative

## Friday November 1, 2019
**Daily Hours: ** 2
**Cumulative: ** 35

After checking whether or not any articles came back with a 100% confidence level given by GDELT 2.0, we decided it would be best to include these results. Afer running the Nigerian query with a 100 Confidence, it returned similar results to a 0 Confidence level though Chinese and Western sources decreased by one absolute value each whereas the local sources remained generally the same.

Issues:
- The queries from here on out take roughly 5-6 hours to complete so In a waking day Im only able to complete 4 queries with the 4th one running while I sleep.

Learnings/Breakthroughs:
- The results from each query tested with a 0, 30, 50, 70 and 100 Confidence level are all generally showing the same results with 100 being the outlier.

## Saturday November 2, 2019 - Wednesday November 6, 2019
**Daily Hours: ** 1 per day of just taking the time to run each query and document the results
**Cumulative: ** 40

I've spent the better part of a week running queries for Nigeria and Philippines at 0, 30, 50, 70 and 100 confidence levels.