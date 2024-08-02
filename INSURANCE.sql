USE [PRACTICE]
GO

SELECT [Policy]
      ,[Expiry]
      ,[Location]
      ,[State]
      ,[Region]
      ,[InsuredValue]
      ,[Construction]
      ,[BusinessType]
      ,[Earthquake]
      ,[Flood]
  FROM [dbo].['Insurance Policies$']

--1. Kindly return data for insurance policies for Masonry construction that is valued for more than 600,000 and has Flood included in the policy.
 SELECT * 
 FROM [dbo].['Insurance Policies$']
 WHERE [Construction] = 'Masonry'
 AND [InsuredValue] > 600000 
 AND [Flood] = 'Y'
--2. Return data for insurance policies in East and Midwest with Earthquake cover for fire resist and Metal clad
SELECT *
FROM [dbo].['Insurance Policies$']
WHERE [Earthquake] = 'Y'
	  AND [Construction] = 'Metal Clad'

--3. Please provide data for insurance policies for Apartment and Farming with expiration in April 2021 within New York.
SELECT * 
FROM [dbo].['Insurance Policies$']
WHERE [BusinessType] IN ('Apartment','Farming')
	  AND [Expiry] BETWEEN '2021-04-01' AND '2021-04-30'
	  AND [State] = 'NY'
--4. What is the total insured value for Flood in the East
SELECT SUM([InsuredValue])
FROM [dbo].['Insurance Policies$']
WHERE [Region] = 'East'
	  AND [Flood] = 'Y'
--5. How many customers insured their apartment and their insurance policy expires in February 2021
SELECT COUNT([Policy])
FROM [dbo].['Insurance Policies$']
WHERE [Expiry] BETWEEN '2021-02-01' AND '2021-02-28'
	  AND [BusinessType] = 'Apartment'
SELECT * FROM [dbo].['Insurance Policies$']

