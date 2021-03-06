# Biodiversity in National Parks
Final group project for UC Berkeley Extension Data Analytics Bootcamp

## Group Members
- Carmen Castanette
- Kevin Green
- Olivia Hughes
- Su-Lin Terhell
- Holley Voegtle

## Overview 
For our group project, we are looking at biodiversity in National Parks. We came to a consensus to choose this data set because we are all passionate about the environment.  
The selected dataset contains three csv files- one including species data, another containing data on the parks themselves and the third including annual visitation to the parks. 
More specifically, the species csv has information on classification of certain animals, which parks they can be found in, and how common they are among other things. 
The parks csv contains information on coordinates and acreage of the parks as well as which respective states they are located in. 
We also cleaned up the data and created an additional csv that included native vs non-native species.

### Purpose 
The initial question we investigated was to see if the increase in visitors to a park would increase non-native species. Further investigation of the data also looked to see if there were any correlations to parameters such as location of the park and the presence of non-native species, grouped categories such as mammals, reptiles, plants, etc, and finally a correlation matrix. 

### Resources
 - Data: 
	- https://www.kaggle.com/nationalparkservice/park-biodiversity/code 
	- https://irma.nps.gov/STATS/SSRSReports/National%20Reports/Annual%20Visitation%20By%20Park%20(1979%20-%20Last%20Calendar%20Year)

- Software and Technologies: 
	- Amazon Web Services
	- Postgres SQL
	- Python
	- SciKit Learn
	- [More to be added as project evolves]


## Analysis
As with most data that is open source, our data needed to be extracted, transformed, and loaded (ETL). A number of DataFrames were created in Jupyter notebook (Python) and the use of Postgres was utilized for these DataFrames. From there linear regressions were tested and graphs were created. 

## Summary
As were are analyzing our data, we plan to present the information found through the use of a dashboard in Tableau as well as an interactive map to allows the user to see the location of the parks and the presence of native and non-native species. 



