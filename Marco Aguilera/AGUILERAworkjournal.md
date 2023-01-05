# Chinas Media and Foreign Affairs Capstone Project Fall 2019
**Region of Interest:** West Africa

## Date: Sptember 18, 2019
**Daily Hours:** 1, **Cumulative Hours:** 1

On this day we finally met with one our mentors, Elizabeth Gooch. We talked about our approach to the project and had her answer questions that clarified somethings for us.

### Issues/Problems
* We were confused on how we would work with GDELT in general
* What kind of connetions are we looking for?

### Learnings/Breakthroughs
* We learned a bit more about tracking our progess throughout the project
* Also learned more about the connections we want to make with countries in certain regions
* Learned a little more about the previous group that attempted this project

---
## Date: September 20, 2019
**Daily Hours:** 2, **Cumulative Hours:** 3

We presented our project to faculty and staff for approval. The presentation went very well and we received some really good feedback. Some of that feedback included reconsidering our project title to be more CS related, possibly narrowing down our scope as far as regions, and using tools we have used before like python to tackle our project.

### Issues/Problems
* It was suggested that we should reconsider the name of our project to be more CS related
* Possibly narrowing down the regions we have and collectively work on one
* Using different technologies might hurt our ability to work together

### Learnings/Breakthroughs
* Dr. Bude Su brought to our attention Chinese translations have been historically inaccurate, which will be something to take into consideration

---
## Date: September 24, 2019
**Daily Hours:** 1, **Cumulative Hours:** 4

I looked at Chris Mayers and Sebastian Ruiz work from this past summer. They developed a lot of graphs comparing popular trends, themes, US Tone distributions and many others. They also seem to focus on some specific countries like Ethiopia and Kenya. From reading Sebastians blog, it seems like it takes many hours just to collect and produce meaningful graphs. For example in his analysis of Chinese and Kenyan articles, it took him 7 hours to just seperate data.

---
## Date: September 26, 2019
**Daily Hours:** 3, **Cumulative Hours** 7

I spent a portion of Thursday night figuring out the countries codes for the countries in my region, and the rest of the time running and trying to optimize my queries.

### Issues/Problems
* The queries that I was trying to run were timing out for some reason after only 30 seconds
* The data types used on the Actor1/Actor2CountryCode(Text) are not able to be used to create an index due to unspecified length
* Altering the data types to accommodate indexing is having issues

### Learnings/Breakthroughs
* I created a new table called test_table to test some of the changes that might need to be made to the events table
* The test_table has the first 10000000 rows of the events table
* I was able to change the data type of Actor1CountryCode from text to a varchar, and create an index on it
* For some reason I am not able to do the same for Actor2CountryCode
* It seems like we might need to get over the hurddle of indexing first before we can really run some big queries
* The timing out of queries was partially due to the time out settings on the mysql workbench, but it was also due to a deadlock happeing
