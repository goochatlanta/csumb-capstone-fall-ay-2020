# Using Big Data to Analyze China's Media and Foreign Affairs <br/> Fall 2019 Capstone Project

## Wednesday, January 8
**Daily Hours:** 20,
**Cumulative Hours:** 85

This entry catches up on a bunch of missing entries from the final few weeks of the project.

Learnings/Breakthroughs:
- `metaTableGenerator.py` has been run again with all of the countries that have been completed. The results are in `masterTable.csv`. Maximillian is still missing a number of countries.
- I added the local sources to each country folder for all of my countries. Each folder has a file called `localsources.txt` that contains a list of all of the local sources used.
- The Heroku app, `csumb-capstone.herokuapp.com`, will remain up as long as Heroku doesn't charge me. It seems like it will remain free indefinitely but I do not know for sure.
- All of my countries are complete.
- Final graded presentation and Capstone Festival presentation both went very well. I'm not sure if we all received the same grade on the project, but regardless I am very happy with how we did.


## Thursday, November 21
**Daily Hours:** 4,
**Cumulative Hours:** 65

Today I created a threaded version of my table generator to allow me to (theoretically) generate tables for three countries at once. I also finished generating the top sources for my top 16 countries.

a modified version of my `tableGenerator.py` script called `threadedTableGenerator.py`

Learnings/Breakthroughs:
- Ran the `getSourcesForEvents` function from `firstQuery.py` on the next 13 countries in my region. 
- Identified my local sources for my next three countries: Ethiopia, Sudan, and Zambia. Ethiopia was the first country I encountered where I had to expand beyond the top 10 sources to find more than one local source. Unlike all of my other countries, I used all of the local sources in the top 20 sources for Ethiopia instead of top 10. Sudan was also challenging because two of the four local sources in the top 10 sources are in Arabic so it was challenging to identify their legitimacy.
- Created a modified version of my `tableGenerator.py` script called `threadedTableGenerator.py`. This version implements threading in Python and uses a MySQL connection pool. As currently written, it runs nine queries at a time. While this may slow down each individual query somewhat, given how little CPU utilization we had on the server, I don't think the impact will be large. It has the potential to generate tables up to 9 times faster.
- I continued working on the app. All seven maps are now implemented in tabs in the new version, `mapapp.py`.


## Monday, November 18
**Daily Hours:** 2,
**Cumulative Hours:** 61

With thorough reading of the Dash documentation, I was able to embed the heatmap in the app.

Learnings/Breakthroughs:
- The heatmap of tone differences is now embedded in the app. It is available under the `Map` tab. This required extensive research in the Dash documentation and lots of trial and error.
- The map is generated with values created from each country's confidence level zero table.

Issues/Problems:
- While map is embedded, it is fairly tiny. I'm not sure why. I will continue to try to fix it.
- Only five countries are represented on the map, which is pretty uninspiring.


## Friday, November 15
**Daily Hours:** 4,
**Cumulative Hours:** 59

I was finally able to generate a table like the one we imagined at NPS. I also made some progress on the app.

Learnings/Breakthroughs:
- Finally built complete table using GKG (`South Africa_GKGtable_conf0.csv` in `South Africa GKG` folder). My code successfully performed the queries but crashed when writing the data to the CSV file due to a missing set of parentheses. Thankfully, however, I wrote it to dump all of the results to the console before attempting to make the CSV file, so I was able to copy and paste the values into the CSV file. After approximately 14 hours of execution time I had a complete GKG table.
- The final table for Zimbabwe, with a confidence level of 100, finished overnight as well.
- Used Plotly's Choropleth mapping capabilities to develop heatmap of difference in tone between Chinese and Western sources. The data used for the map comes from the file `countries_conf0.csv` in my `Python` folder. I calculated each value by subtracting the average tone for Western sources from the average tone for Chinese sources. 

Issues/Problems:
- I can generate the map on its own page using the script `maptest.py`, but I have not figured out how to embed it in the app. I have tried many possible ways without success.



## Thursday, November 14
**Daily Hours:** 3,
**Cumulative Hours:** 55

My GKG table generator was not able to finish overnight. I worked on the app dashboard and made good progress.

Learnings/Breakthroughs:
- Spent time working on the web app for presenting our results. It exists in `app.py`. So far it consists of a slider for choosing the minimum confidence level and tabs for choosing the country. It is fairly minimally formatted so it's not pretty but it works. I used Plotly's Dash framework, which was recommended by Eric.
- I am continuing to generate tables for Zimbabwe and my first GKG table.

Issues/Problems:
- My GKG table generator script did not fail overnight but took longer than 9 hours so was unable to complete between me going to bed and me needing to leave for class. It appeared to be about 60% complete, however, so it should be able to finish with more time. I restarted it when I got home from class today and do not have to move my laptop until Monday.
- I was able to incorporate Maximillian's tables into the app since he used my code to generate CSVs. Diego's results will need to be reformatted since they are stored in Markdown files and multiple tables are included in each file. His data will need to be copied and pasted into CSV files for my script to parse them.



## Wednesday, November 13
**Daily Hours:** 2,
**Cumulative Hours:** 52

My GKG table generator failed overnight. My first Zimbabwe table generated successfully.

Learnings/Breakthroughs:
- My first Zimbabwe table, using a minimum confidence level of 0, was successfully generated. Zimbabwe has by far the largest number of local sources and articles from local sources.
- Generated Zimbabwe table for a minimum confidence level of 30.

Issues/Problems:
- My GKG table generator script failed overnight. Thankfully I had enabled Python's fault handler which printed a stack trace for the error. I was able to identify that the bug was a dumb mistake caused by me accidentally casting a floating point value as an integer. I have fixed the issue and will run the code again tonight.



## Tuesday, November 12
**Daily Hours:** 2,
**Cumulative Hours:** 50

I built the first attempt at my GKG table generator. It will likely run for a long time and may not succeed.

Learnings/Breakthroughs:
- Wrote GKG table generator. I am currently running it against South Africa with the themes of `EDUCATION`, `GENERAL_GOVERNMENT`, and `AGRICULTURE`. Python debugging is enabled to hopefully help me understand if the code fails.
- Started work on my third country, Zimbabwe. I identified my local sources and started executing my `tableGenerator.py` script with those sources. They are outlined in the table below.

| Chinese Media     | Western Media | Zimbabwean Media        |
|-------------------|---------------|-------------------------|
| xinhuanet.com     | yahoo.com     | bulawayo24.com          |
| chinadaily.com.cn | bbc.co.uk     | allafrica.com           |
| china.org.cn      | foxnews.com   | herald.co.zw            |
| ecns.cn           | nbcnews.com   | thezimbabwemail.com     |
| peopledaily.com.cn| go.com        | thezimbabwedaily.com    |
|                   | cbsnews.com   | chronicle.co.zw         |
|                   | nytimes.com   | zimbabwesituation.com   |
|                   | msn.com       |                         |
|                   | usatoday.com  |                         |
|                   | npr.org       |                         |



## Saturday, November 9
**Daily Hours:** 2,
**Cumulative Hours:** 48

Today I completed my Kenya tables. The results are pretty interesting.

Learnings/Breakthroughs:
- A surprising number of articles remaining at 100% confidence level for local and Chinese sources. 
- While the Chinese sources are not overly positive (an average of approximately 2), the Western sources are very negative (average of approximately -4).



## Friday, November 8
**Daily Hours:** 3,
**Cumulative Hours:** 46

I started the process of building my tables for Kenya.

Learnings/Breakthroughs:
- Getting source counts for Kenya only took a few minutes, which was surprising. The values make sense though so it was successful.
- Selected my local sources for Kenya. They are listed in the table below. I used the same technique as before: I took the top ten sources of any category, removed the Chinese and Western sources, and checked each of the remaining sources to verify that it was a local news media source.
- Started query to generate first table with a confidence level of zero. It will take a while.
- I continued to narrow down the GKG themes that I will be focusing on. In order to filter out the taxonomies, I created a new column in my `SouthAfrica_Loca_conf30_themes.csv` file two columns to the right of the `Count` column. In this column I inserted the formula `=IF(OR(LEFT(A3,4)="TAX_", LEFT(A3,3)="WB_", LEFT(A3,4)="EPU_", LEFT(A3,6)="USPEC_", LEFT(A3,10)="CRISISLEX_"),"",A3)` for every row, letting Excel automatically increment the `A<x>` value. This left me with rows containing a theme only if the theme in the far left column did not start with `TAX_`, `WB_`, `EPU_`, `USPEC_`, or `CRISISLEX_`. In the next column to the right, I inserted the formula `=IF(D3<>"",B3,"")` to display the count from the second column only if the theme did not start with the aforementioned prefixes. I used these same formulas on all three tables (Chinese, Western, and Local) and sorted the remaining themes by count. The second table below reflects the results by showing the top ten themes for each media group. I see some definite themes of interest emerging. `Education`, `Leader`, `General Government`, and `General Health` seem like strong contenders for analysis. The full table, which includes the remaining themes from the top 100 original themes, is located in `South Africa_themes_top100_filtered.csv`.

| Chinese Media     | Western Media | Kenyan Media            |
|-------------------|---------------|-------------------------|
| xinhuanet.com     | yahoo.com     | standardmedia.co.ke     |
| chinadaily.com.cn | bbc.co.uk     | allafrica.com           |
| china.org.cn      | foxnews.com   | coastweek.com           |
| ecns.cn           | nbcnews.com   | nation.co.ke            |
| peopledaily.com.cn| go.com        | businessdailyafrica.com |
|                   | cbsnews.com   | the-star.co.ke          |
|                   | nytimes.com   |                         |
|                   | msn.com       |                         |
|                   | usatoday.com  |                         |
|                   | npr.org       |                         |


| Theme (Local)              | Count (Local) | Theme (Chinese)            | Count (Chinese) | Theme (Western)            | Count (Western) |
|----------------------------|---------------|----------------------------|-----------------|----------------------------|-----------------|
| LEADER                     | 1133          | LEADER                     | 1442            | LEADER                     | 215             |
| GENERAL_GOVERNMENT         | 1087          | UNGP_FORESTS_RIVERS_OCEANS | 808             | GENERAL_GOVERNMENT         | 200             |
| UNGP_FORESTS_RIVERS_OCEANS | 802           | GENERAL_GOVERNMENT         | 700             | UNGP_FORESTS_RIVERS_OCEANS | 137             |
| EDUCATION                  | 527           | EDUCATION                  | 432             | MEDIA_MSM                  | 119             |
| SOC_POINTSOFINTEREST       | 522           | SOC_POINTSOFINTEREST       | 432             | ARMEDCONFLICT              | 116             |
| MANMADE_DISASTER_IMPLIED   | 427           | RELATIONS                  | 312             | SOC_POINTSOFINTEREST       | 105             |
| MEDIA_MSM                  | 413           | AGRICULTURE                | 303             | MANMADE_DISASTER_IMPLIED   | 83              |
| AGRICULTURE                | 357           | GENERAL_HEALTH             | 292             | GENERAL_HEALTH             | 82              |
| GENERAL_HEALTH             | 293           | ECON_EMERGINGECON          | 283             | EDUCATION                  | 70              |
| MEDICAL                    | 274           | MEDIA_MSM                  | 280             | AFFECT                     | 69              |

Issues/Problems:
- Currently I am building one table at a time, which is a very slow process since each table takes ~6 hours. When my first Kenya table finishes, I will attempt to adapt my `tableGenerator.py` script into a class. This will allow me to instantiate multiple table generator objects and run them in threads, which should greatly speed up the process of generating all of the tables. Even if threads do not work, at least I can set it up to build two tables sequentially so that it can run overnight without finishing in the middle of the night and waiting for me to start it again.



## Wednesday, November 6
**Daily Hours:** 1,
**Cumulative Hours:** 43

We met today via Zoom to discuss our progress. Our project is coming along nicely.

Learnings/Breakthroughs:
- My next step will be to repeat my work on my next country, Kenya. I will generate the tables again for it, starting by selecting my local sources.
- I will continue to work on the GKG. I need to remove the types of themes that we aren't interested in, like the `TAX_` and `WB_` themes and see if some clarity appears to the remaining themes.

Issues/Problems:
- We need to decide what form our final project will take. We need something that can be presented at the Capstone Festival and will be more exciting than just CSV tables.



## Sunday, November 3
**Daily Hours:** 2,
**Cumulative Hours:** 42

Taking a break from the data science part of the project, I worked on one of the CSUMB requirements for Capstone. I desgined two variations of a draft logo and submitted them to the team for consideration.

Two variations of the draft logo:
![](logodraft1.png)
![](logodraft2.png)



## Saturday, November 2
**Daily Hours:** 1,
**Cumulative Hours:** 40

Overnight, my queries against the GKG to identify the top themes for each category of source completed. They revealed some very interesting data.

Learnings/Breakthroughs:
- Built CSV files for themes for each category of source. They are `South Africa_Chinese_conf30_themes.csv`, `South Africa_Local_conf30_themes.csv`, and `South Africa_Western_conf30_themes.csv`. 
- The number of articles including the highest-ranked theme in all three files is less than the total number of articles in the corresponding `South Africa_table_conf.csv` cell, which is very good.
- When sorted by number of articles using Excel, these three files indicate that all three sources are discussing very similar themes. Here is the top ten themes for each source with number of articles in parentheses:

| Chinese Media                     | Western Media                    | Local Media                       |
|-----------------------------------|----------------------------------|-----------------------------------|
| TAX_FNCACT (1931)                 | TAX_FNCACT (355)                 | TAX_FNCACT (1936)                 |
| TAX_ETHNICITY (1746)              | TAX_ETHNICITY (280)              | TAX_ETHNICITY (1548)              |
| TAX_WORLDLANGUAGES (1718)         | TAX_WORLDLANGUAGES (280)         | TAX_WORLDLANGUAGES (1480)         |
| TAX_ETHNICITY_CHINESE (1607)      | TAX_WORLDLANGUAGES_CHINESE (215) | TAX_ETHNICITY_CHINESE (1290)      |
| TAX_WORLDLANGUAGES_CHINESE (1607) | LEADER (215)                     | TAX_WORLDLANGUAGES_CHINESE (1286) |
| LEADER (1442)                     | TAX_ETHNICITY_CHINESE (214)      | LEADER (1133)                     |
| USPEC_POLITICS_GENERAL1 (1286)    | USPEC_POLITICS_GENERAL1 (212)    | USPEC_POLITICS_GENERAL1 (1092)    |
| TAX_FNCACT_PRESIDENT (1210)       | GENERAL_GOVERNMENT (200)         | GENERAL_GOVERNMENT (1087)         |
| USPEC_POLICY1 (817)               | TAX_FNCACT_PRESIDENT (189)       | TAX_FNCACT_PRESIDENT (975)        |
| UNGP_FORESTS_RIVERS_OCEANS (808)  | EPU_POLICY (171)                 | USPEC_POLICY1 (890)               |



## Friday, November 1
**Daily Hours:** 2.5,
**Cumulative Hours:** 39

We met this morning via Zoom to discuss our next steps. I continued to generate more tables and work on the GKG.

Learnings/Breakthroughs:
- Completed all confidence level tables for South Africa: 0, 30, 50, 70, and 100. They are available in my `South Africa Tables` folder.
- The next step will be to generate the same tables for my second country, Kenya. I will need to go back and identify my top local sources for Kenya using my older scripts.
- Ran Themes query against the GKG again, this time using the `Themes` attribute instead of `V2Themes`, which should return each theme once per article instead of once per time it appears in an article.
- Created `gkgThemesBySource.py` script to get all of the themes and the number of articles with each theme for each group of sources. It should create three CSV files, one per source category, each listing the themes found in articles from those sources and how many articles included each theme. I'm cautiously optimistic it will work, but problem 1 below will show that I have cause for concern.

Issues/Problems:
- For some reason, my resulting themes CSV (`South Africa_themes.csv`) indicates that the top theme occurred in 390,000 articles, despite the total number of articles across all sources in my `sourceCounts.csv` file being a mere 57,000. Theoretically there should only be 57,000 articles in the themes query as there should be a 1:1 relationship between eventmentions and gkg. I'm not sure what this means. It is still an improvement from my V2Themes query, in which the highest ranking theme appeared 440,000 times.
- I'm still not sure which themes we are interested in. To borrow from my email to Liz: "I’m still having trouble deciding which themes we should use. It seems like there are different categorization systems in use. For example, the documentation does establish that the themes that start with “WB_” come from the World Bank (https://blog.gdeltproject.org/world-bank-group-topical-taxonomy-now-in-gkg/). It seems that themes starting with “TAX_” are taxonomies and are just identifying something that appears in the article, which I think can also be left out. There’s a complete list of themes as of August linked to from here: https://blog.gdeltproject.org/new-august-2019-gkg-2-0-themes-lookup/"



## Thursday, October 31
**Daily Hours:** 0.5,
**Cumulative Hours:** 36.5

My confidence level 30 query completed. Ran again with confidence level 50. With 50 finished, running with 70.

Learnings/Breakthroughs:
- Using a minimum confidence level of 30 instead of zero cut the number of articles nearly in half.
- Using a minimum confidence level of 70 nearly cut the results in half again.


## Wednesday, October 30
**Daily Hours:** 2,
**Cumulative Hours:** 36

We met today via Zoom to discuss our progress. My table generator also produced its first complete table.

Learnings/Breakthroughs:
- After two attempts, both of which ended with segfaults, I determined that the issue was in my threading code. While threads should have sped up the process, I elected to remove them for simplicity, and the code executed correctly. The table is available as `South Africa_table_conf0.csv`.
- During our meeting, we discussed creating tables for different minimum confidence levels, including 0, 30, 50, and 70.
- Started running the code with a confidence level of 30. It will run overnight.



## Tuesday, October 29
**Daily Hours:** 2,
**Cumulative Hours:** 34

Work continues on my table generator script, which is running into trouble.

Learnings/Breakthroughs:
- Cleaned up base query for table generator. I think it is correct. Tests in Workbench seem valid, but the 30 second limit prevents all but very small scale tests.

Issues/Problems:
- Table generator still takes a long time to run, but that is to be expected. Overnight run ended in a Segmentation Fault, which I didn't think was even possible in Python. A segfault indicates an illegal memory access, which Python is written to mostly prevent. I added some code to help locate where the error occurs and the generator is running again. According to some quick research online, it may be that the database is returning too many values (in this case, MentionDocTone values, which are floats) to fit in the memory allowed per Python process. Increasing the memory my computer is allowing Python to occupy could help the situation. It could also be an issue with my code, so I did a thorough review of all parts of the code which involve memory access but did not find an error.



## Monday, October 28
**Daily Hours:** 4,
**Cumulative Hours:** 32

Perpetually bad at accepting defeat, I continued my efforts on the GKG table over the weekend. While visiting my family in Sonoma County, I consulted with Dave Volk, a family friend and Broadcom database developer. Using pen and paper to work by flashlight as PG&E had cut power to his house, we worked on optimizing my query and discussed ways to speed it up. I also worked on the code to generate the non-GKG table for South Africa.

Learnings/Breakthroughs:
- Created index on the `DocumentIdentifier` attribute in the GKG using a prefix index of 50 characters. With the index created, the optimized version of my query using inner joins (`SELECT V2Themes FROM events e INNER JOIN eventmentions m ON e.GLOBALEVENTID = m.GLOBALEVENTID AND e.ActionGeo_CountryCode = 'SF' AND (e.Actor1CountryCode = 'CHN' OR e.Actor2CountryCode = 'CHN') AND m.Confidence >= 30 INNER JOIN gkg g ON m.MentionIdentifier = g.DocumentIdentifier;`) was able to complete in a few hours. The file `South Africa_themes.csv` lists each theme encountered and the number of times it occurred.
- Created script `tableGenerator.py` which creates the table discussed in last week's Zoom call. This table uses just events and eventmentions and includes the number of articles, average tone, and standard deviation in tone for each of the three categories of news sources. Running it overnight to see if it works.

Issues/Problems:
- Interpreting the results of my themes query will be my next challenge. I need to understand what each type of theme is and whether or not it should be included. I might also have to revise the query to only count a theme once per article, instead of once per time it is identified in an article by GDELT. This will be a question for Liz I think.



## Friday, October 25
**Daily Hours:** 1,
**Cumulative Hours:** 26

Today we discussed our goals moving forward with the project.

Learnings/Breakthroughs:
- We will be abandoning the GKG in favor of the themes identified in the Events table. For each country, we will be looking to identify the number of articles, average tone, and standard deviation in tone between the local media, western media, and Chinese media.
- Our goal is to each produce one complete table by next week.



## Wednesday, October 23
**Daily Hours:** 1,
**Cumulative Hours:** 25

Today we met briefly via Zoom to discuss our progress.

Issues/Problems:
- GKG query took far too long to be feasible. We will need to consider using the backup option of using the themes identified in the Events table.



## Monday, October 21
**Daily Hours:** 0.5,
**Cumulative Hours:** 24

I had to take my laptop to school, so I had to kill the themes query. 

Issues/Problems:
- Despite 116 hours of processing, I never got results back on my themes query. We will need to rethink how we determine the top themes. The less specific themes in the Events table might have to be the themes we use instead of the better themes in the GKG table.


## Friday, October 18
**Daily Hours:** 1,
**Cumulative Hours:** 23.5

We met with Eric briefly via Zoom this morning to discuss MySQL. 

Issues/Problems:
- My query to determine the top themes in articles about China in South Africa, `SELECT V2Themes FROM gkg WHERE DocumentIdentifier in (SELECT MentionIdentifier FROM eventmentions WHERE GLOBALEVENTID in (SELECT GLOBALEVENTID FROM events WHERE (Actor1CountryCode = 'CHN' OR Actor2CountryCode = 'CHN') AND ActionGeo_CountryCode = 'SF’))`, had been running for 36 hours without returning. Eric and I agreed to give it until Monday before concluding that it would not return in any reasonable time frame.

Learnings/Breakthroughs:
- Despite this massive query, CPU utilization on the server was only about 3% and memory usage was similar. Our MySQL server seems plenty powerful enough for this project. It is possible that this query requires just too many comparisons.



## Wednesday, October 16
**Daily Hours:** 3,
**Cumulative Hours:** 22.5

After a few days of neglecting this project due to work and school, I resumed my efforts by identifying the sources I will be using for my first country, South Africa.

Issues/Problems:
- Attempted to identify my top sources in South Africa. Identifying the top western media sources was more challenging than I expected. Liz's meeting review notes mentioned a json file created by Chris with the top sources, but the only relevant file I could find in Chris's repository includes Xinhua. When I read through his blog, however, I understood how he decided on those sources, and that the top 10 follow Xinhua in the json file.
- I'm not sure what to do about `allafrica.com` which came in at number 2 on my list of top sources talking about China in South Africa (`sourceCounts.csv`). It is primarily a news aggregator for all of Africa but they do some of their own reporting. They have a South African bureau, and they aggregate sources from South Africa among their 140 news organizations. I'm not sure if it should be included.
- Another potentially problematic source is `sharenet.co.za`. They're an investment resource company, not a news agency.
- MySQL does not support the `SPLIT()` function and only MySQL version 8 and later support `REGEX_REPLACE` so processing the themes in the GKG table, which are in the form `theme1,offset;theme2,offset;theme3,offset;...`, is going to be very challenging. We might be able to use user-defined functions but I'm not sure. We could also see about updating our version of MySQL or using the themes identified in the Events table. Another option could be to handle the splitting in Python, which is how I think I will proceed.

Learnings/Breakthroughs:
- Identified top media sources for South Africa. They are displayed in the table below. The Chinese sources are all of the Chinese sources that appeared in the top 10 sources in my `sourceCounts.csv` document. The top 10 US sources came from Chris's efforts, which are based on the study linked in the meeting review document.
- Using Python to perform the splitting, I was able to identify the count of each theme when using a limit 10 on the query. It took a long time, but it reflects the theme counts in the first 10 articles in the GKG involving China in South Africa. While this information is useless, it confirmed that my query and Python code are correct. Removed the limit and started the query. After 3 hours, I had to kill the query to go home. I will start it again at home.

| Chinese Media     | Western Media | South African Media   |
|-------------------|---------------|-----------------------|
| xinhuanet.com     | yahoo.com     | iol.co.za             |
| chinadaily.com.cn | bbc.co.uk     | allafrica.com ???     |
| china.org.cn      | foxnews.com   | news24.com            |
| ecns.cn           | nbcnews.com   | sharenet.co.za ???    |
| peopledaily.com.cn| go.com        | engineeringnews.co.za |
|                   | cbsnews.com   |                       |
|                   | nytimes.com   |                       |
|                   | msn.com       |                       |
|                   | usatoday.com  |                       |
|                   | npr.org       |                       |



## Wednesday, October 9
**Daily Hours:** 1.5,
**Cumulative Hours:** 19.5

Today I ran my first queries against the `eventmentions` table. 

Issues/Problems:
- Using `events` to get `GLOBALEVENTID` and then putting those values into `eventmentions` takes a very long time.

Learnings/Breakthroughs:
- Started with query `SELECT MentionSourceName from eventmentions where GLOBALEVENTID in (SELECT GLOBALEVENTID FROM events WHERE (Actor1CountryCode = 'CHN' OR Actor2CountryCode = 'CHN') AND ActionGeo_CountryCode = 'SF') limit 1;` and got the source of the first article about an event involving China in South Africa. The query took 5-10 minutes to execute but eventually returned.
- Followed that query with `SELECT MentionSourceName, count(*) as sourceMentionCount FROM eventmentions WHERE GLOBALEVENTID in (SELECT GLOBALEVENTID FROM events WHERE (Actor1CountryCode = 'CHN' OR Actor2CountryCode = 'CHN') AND ActionGeo_CountryCode = '" + shortCountryCode + "') GROUP BY MentionSourceName ORDER BY sourceMentionCount DESC;` in a script that writes the output to a CSV file. I expect this query to take a very long time to run. When it is done, it should produce a list of sources with a count of articles involving China in South Africa by each source, sorted by the number of articles per source.
- Query did not take quite as long as I expected, maybe 15 minutes, and got some very interesting results. The top two sources are South African, but the sources ranked 3rd, 4th, 5th, and 7th are Chinese. In total, 4,748 sources published articles involving China in South Africa.

## Monday, October 7
**Daily Hours:** 2.5,
**Cumulative Hours:** 18

Today I expanded my Python script to get the average number of sources per event for each target country, in addition to the number of events. The CSV file with the results has been updated. I also created a second function in my script to compare queries.

Issues/Problems:
- A comparison of the same target country using China as Actor1 and Actor2 and the target as ActionGeo versus using China as Actor 1 or 2 and the target as the other shows that there is a discrepancy between the counts. I'm not sure what this means. Which value is greater is not consistent.
- Oddly, using this query reverses the order of my top three countries.

Learnings/Breakthroughs:
- Queries run much faster the second time around. The server must implement caching.
- The average number of sources per event for all of my countries is very close to 1. I'm not sure if this is significant.
- Sorting the results of my script gives me my top three countries:
1. South Africa (31290 events)
2. Kenya (19945 events)
3. Zimbabwe (15907 events)


## Friday, October 4
**Daily Hours:** 2,
**Cumulative Hours:** 15.5

We had a brief Zoom meeting with Liz this morning to discuss our project. I discovered that my data type change and index creation queries had completed so I was able to do some more work.

Issues/Problems:
- Queries are still slow, though much faster.

Learnings/Breakthroughs:
- `Actor1CountryCode`, `Actor2CountryCode`, and `ActionGeo_CountryCode` are now indexed. 
- With the indices in place, I was able to run a `count` query on the number of articles with China as either Actor1 or Actor2 and the country code of a target country as the `ActionGeo_CountryCode`.
- After running one query, I adapted my `firstQuery.py` script to query the count for each of my target countries. The script outputs the result to a CSV file, `counts.csv`, for future use.



## Wednesday, October 2
**Daily Hours:** 4,
**Cumulative Hours:** 13.5

We met with Liz and Erick at NPS today for a very productive discussion of our progress and goals. I feel that I have a much better understanding of our objectives and of our next steps, which I will outline briefly.
1. For each country in our region, we will run queries against the events table with the target country as the `ActionGeo_CountryCode` and China as `Actor1CountryCode` or `Actor2CountryCode` to determine the count of events in the target country involving China.
2. We will use these counts to determine the country with the most events involving China, which is where we will start our research.
3. For our first target country, we will use all three tables to determine the top themes for articles involving the country and China.
4. We will work to complete the following table:

| Theme   | Chinese Media | Western Media | Local Media  |
|---------|---------------|---------------|--------------|
| Theme 1 | Tone + Count  | Tone + Count  | Tone + Count |
| Theme 2 | Tone + Count  | Tone + Count  | Tone + Count |
| Theme 3 | Tone + Count  | Tone + Count  | Tone + Count |


Issues/Problems:
- Still need to create lots of indices to handle queries
- Queries will be very convoluted and possibly slow
- `ActionGeo_CountryCode` is frequently blank or irrelevant. I ran the query `select * from events where ActionGeo_CountryCode != "" limit 1;` to find the first event with a non-blank `ActionGeo_CountryCode`, and it is an article about Trump dodging the Vietnam draft with bone spurs which GDELT mistakenly geotags in Vietnam.

Learnings/Breakthroughs:
- We will use list of top 15 most influential western media sources
- We will use confidence value of 30% or higher to start
- We will query events table to find events, then use event ID to find eventmentions, then use mention identifier as document identifier in GKG to get full analysis
- Set `Actor1CountryCode` back to type `text` for consistency with GDELT. That process is still ongoing.
- Attempted again to run a fully-formed count query to test the number of articles in Botswana involving China, `SELECT count(*) FROM events WHERE (Actor1CountryCode = 'CHN' OR Actor2CountryCode = 'CHN') AND ActionGeo_CountryCode = 'BC'`. It times out in Workbench and I let Python run for 20 minutes before killing the process on the server. These types of queries will require indexing `Actor1CountryCode`, `Actor2CountryCode`, and `ActionGeo_CountryCode`.
- Issued command to create index on `ActionGeo_CountryCode`, which is currently waiting for change of `Actor1CountryCode` back to text to finish.



## Tuesday, October 1
**Daily Hours:** 1,
**Cumulative Hours:** 9.5

I worked on the project briefly this afternoon, including more research on indexes. I also attempted to index the `Actor2CountryCode` column.

Issues/Problems:
- `Actor1CountryCode` is now type `varchar(11)`, while `Actor2CountryCode` is still type `text`. Somebody must have tried to change the datatype of `Actor1CountryCode`, which I'm not sure we were supposed to do.

Learnings/Breakthroughs:
- Did some research and learned that attributes of type `text` **can** be indexed if a prefix length is specified. Tried creating an index on `Actor2CountryCode` (which is still type `text`) with a prefix size of 3, since all of the countries have 3 character codes. The command did not return an error, and a quick query of `SELECT * FROM     INFORMATION_SCHEMA.PROCESSLIST WHERE db = 'gdelt' LIMIT 0, 1000;` reveals that it is still building the index. I suspect it will take a while. I just hope it works. Will check back later.



## Friday, September 27
**Daily Hours:** 1.5,
**Cumulative Hours:** 8.5

We met with Liz again via Zoom this morning to discuss our progress. We have all encountered the same issues with queries and building indices.

Issues/Problems:
- `Actor1CountryCode` and `Actor2CountryCode` seem to be attributes of type `text`, which cannot be indexed because it cannot be compared.
- `Y`, which should represent Year, cannot be used for easy comparison because it is also type `text` instead of `int`.

Learnings/Breakthroughs:
- Checked indices for Events table and discovered `Actor1CountryCode` and `Actor2CountryCode` are not indexed. Tried to create an index for `Actor1CountryCode` to see if that helps the `count()` query to return. I think it will solve the issue if I can figure out how to create it properly.



## Thursday, September 26
**Daily Hours:** 1,
**Cumulative Hours:** 7

Today I worked some more on my initial query. 

Issues/Problems:
- I could not get `SELECT count(*) from events WHERE Actor1CountryCode="BWA"` (or any country code) to return. Python would sit indefinitely and MySQL Workbench would drop the connection to the server after 30 seconds.
- Tried to create index on `Actor1CountryCode`. Command returned immediately, but when I checked the processes, no index was being created, and when I checked the indices on the table, my index was not there.
- Checked the return value for the index creation command, `Error Code: 1170. BLOB/TEXT column 'Actor1CountryCode' used in key specification without a key length`. I will have to research what this means.

Learnings/Breakthroughs:
- Checked indices for Events table and discovered `Actor1CountryCode` and `Actor2CountryCode` are not indexed. Tried to create an index for `Actor1CountryCode` to see if that helps the `count()` query to return. I think it will solve the issue if I can figure out how to create it properly.



## Wednesday, September 25
**Daily Hours:** 3,
**Cumulative Hours:** 6

Today we met with Liz, our mentor, and discussed our project presentation and the issues presented by the faculty. We went over our division amongst ourselves of the regions of interest and discussed how we select which countries within each region will be worth researching.

Issues/Problems:
- Events table has an Actor 1 code and an Actor 2 code. Is there some significance to the order?
- To find events involving China and CountryX, will we need to perform two queries, one `1: China 2: CountryX` and the other `1: CountryX 2: China`?
- Need to build country code conversion tool
- My first query program queried the database for the count of articles related to a country. Unfortunately, that query takes a very long time and I didn't test it in Workbench first so the server got stuck on the query. I had to manually kill the queries on the server and the Python process on my computer.

Learnings/Breakthroughs:
- We will start by looping through each of the countries in our region and querying the events table with that country's code and China's code as parameters for the Actor fields. This will help us see which countries have China-related events occurring.
- As we continue our research, we will narrow down our list of potential countries.
- We agreed that we will all use Python for data processing and R for visualization
- Country codes, or at least the standard for them which can be researched elsewhere, can be found in the GDELT codebook.
- MySQL Workbench provides a GUI for access to the NPS MySQL database, which will make designing and testing queries considerably easier.
- Built Python conversion class for converting from country code to country name and back. It can be imported into any project for ease of use.


## Friday, September 20
**Daily Hours:** 1.5,
**Cumulative Hours:** 3

Today we presented our project proposal to a faculty panel. The faculty seemed fairly confident in our ability to complete our project and our presentation went very smoothly.

Issues/Problems:
- Dr. Byun suggested renaming our project from "China's Media and Foreign Affairs" to something that specifies that we will be using Computer Science methods.
- Dr. Su was concerned that we are not prepared for this project as none of us are studying data science. Dr. Bruns, a professor of data science, dismissed her concerns.

Learnings/Breakthroughs:
- Dr. Bruns advised we all agree on a standard language or languages to simplify collaboration.



## Wednesday, September 18
**Daily Hours:** 1.5,
**Cumulative Hours:** 1.5

Today we met with our mentor, Dr. Liz Gooch, via Zoom. We discussed the project at length in order to understand our goals.

Issues/Problems:
- How do we index the GDELT tables to make queries practical?

Learnings/Breakthroughs:
- We will each be focusing on one section of the world.
- We will be analyzing China-related events occuring in our sections of the world
- We will be able to work with the language of our choice, but our technical advisor, Erick Erckstrand, will encourage us to move outside of our comfort zone and try some new technology.