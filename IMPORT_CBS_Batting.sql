USE [Biagini_in_a_Bottle]
GO

/****** Object:  View [dbo].[IMPORT_CBS_Batting]    Script Date: 2021-02-05 2:56:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[IMPORT_CBS_Batting] AS  SELECT 1 AS A

/*
DROP TABLE if exists #CBS_2020_batting_PLAYOFFS																--INSERT NEW NAME
CREATE TABLE  #CBS_2020_batting_PLAYOFFS															--INSERT NEW NAME
(
Avail [nvarchar](500) NULL
,Player [nvarchar](500) NULL
,AB [INT] NULL
,R [INT] NULL
,H [INT] NULL
,[1B] [INT] NULL
,[2B] [INT] NULL
,[3B] [INT] NULL
,HR [INT] NULL
,RBI [INT] NULL
,BB [INT] NULL
,K [INT] NULL
,SB [INT] NULL
,CS [INT] NULL
,[AVG] [float] NULL
,OBP [float] NULL
,SLG [float] NULL
,FPTS [float] NULL

) ON [PRIMARY];

*/
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
bulk INSERT #CBS_2020_batting_PLAYOFFS --INSERT NEW NAME
						FROM 'C:\Users\ziad\Downloads\STATS.csv'				--INSERT NEW NAME
						WITH
						(
						FIRSTROW = 2,
						FIELDTERMINATOR = ',',  
						ROWTERMINATOR = '0x0A',
						--FORMAT='csv',
						FIELDQUOTE='"',
						TABLOCK,
						keepnulls,
						CODEPAGE=65001,
						keepidentity
						)
*/
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
CREATE TABLE  CBS_2020_batting_PLAYOFFS															--INSERT NEW NAME
(
Full_name	[nvarchar](500)	NULL
,Position	[nvarchar](500)	NULL
,Team	[nvarchar](500)	NULL
,AB	[int]	NULL
,R	[int]	NULL
,H	[int]	NULL
,[1B]	[int]	NULL
,[2B]	[int]	NULL
,[3B]	[int]	NULL
,HR	[int]	NULL
,RBI	[int]	NULL
,BB	[int]	NULL
,K	[int]	NULL
,SB	[int]	NULL
,CS	[int]	NULL
,[AVG]	[float]	NULL
,OBP	[float]	NULL
,SLG	[float]	NULL
,FPTS	[float]	NULL
,[Status]	[nvarchar](500)	NULL

) ON [PRIMARY];
*/
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
INSERT INTO	CBS_2020_batting_PLAYOFFS														--INSERT NEW NAME 
SELECT
	  
      trim(SUBSTRING(TRIM(Player),1,CHARINDEX('|',TRIM(Player),1)-4)) AS [Full_name] 		
	  ,trim(
				SUBSTRING(
							TRIM(Player),CHARINDEX('|',TRIM(Player),1)-3,3
						) 
			) 	 
		AS [Position]
	  --,player
      ,TRIM(RIGHT(TRIM(Player),3))		AS [Team]
      ,[AB]
      ,[R]
      ,[H]
      ,[1B]
      ,[2B]
      ,[3B]
      ,[HR]
      ,[RBI]
      ,[BB]
      ,[K]
      ,[SB]
      ,[CS]
      ,[AVG]
      ,[OBP]
      ,[SLG]
      ,[FPTS]
      ,AVAIL AS [Status]

FROM	#CBS_2020_batting_PLAYOFFS																--INSERT NEW NAME
*/
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
GO


