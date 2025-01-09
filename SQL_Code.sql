SELECT *
FROM City
LIMIT 5;
SELECT Name, Population
FROM Country
WHERE Population = (SELECT MIN(Population) FROM Country WHERE Population > 0);
SELECT COUNT(DISTINCT Language) AS LanguagesStartingWithE
FROM CountryLanguage
WHERE Language LIKE 'E%';
SELECT *
FROM City
WHERE District LIKE 'a%h';
SELECT Code, Continent, Population
FROM Country
ORDER BY Population DESC
LIMIT 3;
SELECT Name, Continent
FROM Country
WHERE GovernmentForm LIKE '%Republic%';
SELECT AVG(LifeExpectancy) AS AvgLifeExpectancyAsia
FROM Country
WHERE Continent = 'Asia';
SELECT c.Name, c.Region, cl.Language
FROM Country c
JOIN CountryLanguage cl ON c.Code = cl.CountryCode
WHERE c.Name = 'India';
SELECT Name, GNP,
    CASE
        WHEN GNP > 60000 THEN 'Developed'
        WHEN GNP BETWEEN 35000 AND 60000 THEN 'Developing'
        WHEN GNP BETWEEN 10000 AND 34999 THEN 'Underdeveloped'
        ELSE 'Poor'
    END AS GNPCategory
FROM Country;
SELECT CountryCode, Percentage
FROM CountryLanguage
WHERE Language = 'English' AND Percentage > (
    SELECT AVG(Percentage)
    FROM CountryLanguage
    WHERE Language = 'English'
);
SELECT ID, Name, CountryCode, Population,
    SUM(Population) OVER (PARTITION BY CountryCode) AS TotalPopulation,
    AVG(Population) OVER (PARTITION BY CountryCode) AS AvgPopulation,
    MAX(Population) OVER (PARTITION BY CountryCode) AS MaxPopulation
FROM City;
SELECT Name, SurfaceArea
FROM Country
ORDER BY SurfaceArea DESC
LIMIT 5;