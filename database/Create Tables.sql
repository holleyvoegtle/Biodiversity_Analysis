-- Create parks table from https://www.kaggle.com/nationalparkservice/park-biodiversity?select=parks.csv
CREATE TABLE parks (
	"Park Code" VARCHAR(4) PRIMARY KEY NOT NULL,
	"Park Name" VARCHAR(120),
	"State" VARCHAR(10),
	"ACRES" INT,
	"Latitude" NUMERIC,
	"Longitude" NUMERIC
)
-- housekeeping
SELECT * FROM parks;

DROP TABLE parks;

-- Create species table from https://www.kaggle.com/nationalparkservice/park-biodiversity?select=species.csv
CREATE TABLE species (
	"Species ID" VARCHAR(40) PRIMARY KEY NOT NULL,
	"Park Name" VARCHAR(120),
	"Category" VARCHAR(100),
	"Order" VARCHAR(100),
	"Family" VARCHAR(100),
	"Scientific Name" VARCHAR(1000),
	"Common Names" VARCHAR(1000),
	"Record Status" VARCHAR(100),
	"Occurance" VARCHAR(100),
	"Nativeness" VARCHAR(100),
	"Abundance" VARCHAR(100),
	"Seasonality" VARCHAR(100),
	"Conservation Status" VARCHAR(100)
);

-- housekeeping
SELECT * FROM species;

DROP TABLE species;

-- create parks visitation table from https://irma.nps.gov/STATS/SSRSReports/National%20Reports/Annual%20Visitation%20By%20Park%20(1979%20-%20Last%20Calendar%20Year)
-- this includes the number of visitors for each of the last 10 years as well as the average yearly visitors per park.
CREATE TABLE visitation(
	"Park Name" VARCHAR(100) PRIMARY KEY NOT NULL,
	"2010" INT,
	"2011" INT,
	"2012" INT,
	"2013" INT,
	"2014" INT,
	"2015" INT,
	"2016" INT,
	"2017" INT,
	"2018" INT,
	"2019" INT,
	"Average" INT
)

-- housekeeping
SELECT * FROM visitation;

DROP TABLE visitation;

-- create a table that separates the species categories in the park into native or not native 
CREATE TABLE nativeornot
AS
SELECT "Park Name", "Category", count("Category"), "Nativeness"
FROM species
WHERE "Nativeness" = 'Native' 
	OR "Nativeness" = 'Not Native' 
Group by species."Park Name",species."Category",species."Nativeness"
ORDER BY species."Park Name",species."Category",species."Nativeness";

-- housekeeping
SELECT * FROM nativeornot;

DROP TABLE nativeornot;

-- Joining the parks and visitors table on park name to add the Average Visitation by park column
CREATE TABLE avgtoo
AS
SELECT parks."Park Name"
	,parks."State"
	,parks."ACRES"
	,parks."Latitude"
	,parks."Longitude"
	,visitation."Average" as "Average Visitation"
FROM parks
INNER JOIN visitation
ON parks."Park Name" = visitation."Park Name";

-- housekeeping
SELECT * FROM avgtoo;

DROP TABLE avgtoo;

-- Explore if it is usefull to join the nativeornot table to include park acres and average visitation
SELECT nativeornot."Park Name"
	,nativeornot."Category"
	,nativeornot."count"
	,nativeornot."Nativeness"
	,avgtoo."ACRES"
	,avgtoo."Average Visitation"
FROM nativeornot
JOIN avgtoo
ON nativeornot."Park Name" = avgtoo."Park Name";

-- creat table to only include park name and total count of native and non-native species
CREATE TABLE parkcounts
AS
SELECT "Park Name", count("Category"), "Nativeness"
FROM species
WHERE "Nativeness" = 'Native' 
	OR "Nativeness" = 'Not Native' 
Group by species."Park Name",species."Nativeness"
ORDER BY species."Park Name",species."Nativeness";

-- housekeeping
SELECT * FROM parkcounts;

DROP TABLE parkcounts;