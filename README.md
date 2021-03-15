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
The initial question we investigated was to see if the increase in visitors to a park would increase the non-native species found there. Further investigation of the data also looked to see if there were any correlations to parameters such as location of the park and the presence of non-native species, grouped categories such as mammals, reptiles, plants, etc, and finally a correlation matrix. 

### Resources
- Data: 
	- https://www.kaggle.com/nationalparkservice/park-biodiversity/code 
	- https://irma.nps.gov/STATS/SSRSReports/National%20Reports/Annual%20Visitation%20By%20Park%20(1979%20-%20Last%20Calendar%20Year)

- Presentation: 

	 - https://docs.google.com/presentation/d/13Fxq3_L9WtVU9MQCDZ9MckQbnxAd2lvvS9wCFA8NcTg/edit?usp=sharing

- Software, Technologies, and Tools Utilized: 
	- Amazon Web Services
	- PostgreSQL
	- Tableau
	- Python
	- JavaScript
	- HTML
	- CSS
	- Jupyter Notebooks
	- SciKit Learn
	- GitHub


## Analysis

As with most data that is open source, our data needed to be extracted, transformed, and loaded (ETL). A number of DataFrames were created in Jupyter notebook (Python) and the use of Postgres was utilized for these DataFrames. From there linear regressions were tested and graphs were created. 

### Database:

For our database, we utilized Amazon Web Services to host a Postgres Relational Database Service (RDS). Various tables were loaded into Postgres using SQL through PGAdmin including our final machine learning table.  This allowed all team members to access the database server through PGAdmin as tables were updated and added throughout the course of the project.

### Machine Learning

#### Pre-Processing Data:

The three csv's that were acquired from kaggle and loaded into our PostgresRDS needed to be transformed and merged into a final dataframe to feed the machine learning model. Below is an outline of steps that had to be completed for the final dataframe to come together:

	- Load in tables from Postgres for initial dataframes
	- 50 Entries needed rows shifted left that were entered incorrectly into Kaggle
		- This was found when exploring the 'Nativeness' attribute in the species.csv
		- Rows were corrected and replaced in the main dataframe
	- The visitation table needed to have the 'Park Name' field adjusted to remove abbreviations to join dataframes on.
	- Sequoia and King's Canyon National Parks needed to have their data merged into a single dataframe entry.
	- The 'Park Name' Column was set as the index for all three dataframes.
	- All dataframes were checked for null values.
	- Native and Non-Native Species were totalled for each park using the "groupby" function.
	- A field for Total Species for each park was calculated by summing the total Non-Native, total Native, and total Unknown columns
	- A field for NonNative_Ratio was created by dividing the number of non-native species by the total species in each park.
	- Species in each park were grouped by "Category" and added as a row for each park.
	- The species_df, parks_df, and visitation_df were merged to create a final dataframe
	- The final biodiversity_clean_df was loaded into our Postgres RDS to be used in the machine learning Jupyter Notebook.

To explore the possibilities with the dataset, a pearson correlation matrix was generated and graphed using a seaborn heatmap. The matrix is displayed below: 

![Correlation_Matrix](https://user-images.githubusercontent.com/64506842/111089495-8a33a000-8502-11eb-87b2-e32c7a2f383d.png)

#### Model Selection:

Our group wanted to investigate the relationship between the number of visitors that each National Park received and how many non-native (invasive) species were found there. We initially hypothesized that an increase in park visitation would also increase the number of non-native species found in the park.  We decided on a linear regression model with our X variable being the average number of park visitors over 10 years and our y variable being the total number of non-native species found in the park.  

## Summary
As were are analyzing our data, we plan to present the information found through the use of a dashboard in Tableau as well as an interactive map to allows the user to see the location of the parks and the presence of native and non-native species. 



