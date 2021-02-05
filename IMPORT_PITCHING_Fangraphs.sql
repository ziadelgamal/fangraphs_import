USE [Biagini_in_a_Bottle]
GO

/****** Object:  View [dbo].[IMPORT_PITCHING_Fangraphs]    Script Date: 2021-02-05 2:56:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










CREATE VIEW [dbo].[IMPORT_PITCHING_Fangraphs] AS 

SELECT 1 AS A
/*

/*note: make sure fangraphs table matches this schema - 
https://www.fangraphs.com/leaders.aspx?pos=all&stats=pit&lg=all&qual=0&type=c,3,4,5,11,7,8,13,36,37,40,43,48,6,45,62,59,42,9,10,12,24,44,322,113,110,221,222,223,76,91,78,92,84,95,82,94,324,325,326&season=2020&month=0&season1=2020&ind=0&team=0&rost=0&age=0&filter=&players=0&startdate=2020-01-01&enddate=2020-12-31
-- archive https://www.fangraphs.com/leaders.aspx?pos=all&stats=pit&lg=all&qual=0&type=c,3,4,5,11,7,8,13,36,37,40,43,48,6,45,62,59,42,9,10,12,24,44,322,113,110,221,222,223,76,91,78,92,84,95,82,94&season=2020&month=0&season1=2020&ind=0&team=0&rost=0&age=0&filter=&players=0&startdate=2020-01-01&enddate=2020-12-31&sort=38,d
also change % to decimals by find and replace - make sure to keep it in the header*/

DROP TABLE if exists #Stats_Fangraphs_2020_Pitching_Sept_21		;				--INSERT NEW NAME
CREATE TABLE  #Stats_Fangraphs_2020_Pitching_Sept_21					--INSERT NEW NAME
(
	[name]		[nvarchar](500)	NULL
	,[Team]			[nvarchar](500)	NULL
	,[Age]			[int]	NULL
	,[W]			[int]	NULL
	,[L]			[int]	NULL
	,[SV]			[int]	NULL
	,[G]			[int]	NULL
	,[GS]			[int]	NULL
	,[IP]			[float]	NULL
	,[K/9]			[float]	NULL
	,[BB/9]			[float]	NULL
	,[HR/9]			[float]	NULL
	,[BABIP]		[float]	NULL
	,[GB%]			[float]	NULL
	,[ERA]			[float]	NULL
	,[FIP]			[float]	NULL
	,[xFIP]			[float]	NULL
	,[WAR]			[float]	NULL
	,[WHIP]			[float]	NULL
	,[CG]			[int]	NULL
	,[ShO]			[int]	NULL
	,[BS]			[int]	NULL
	,[SO]			[int]	NULL
	,[LOB%]			[float] NULL
	,[EV]			[float]	NULL
	,[SwStr%]			[float]	NULL
	,[Contact%]			[float]	NULL
	,[Soft%]			[float]	NULL
	,[Med%]			[float]	NULL
	,[Hard%]			[float]	NULL
	,[FBv] [float]
	,[wFB] [float]
	,[SLv] [float]
	,[wSL] [float]
	,[CHv] [float]
	,[wCH] [float]
	,[CBv] [float]
	,[wCB] [float]
	,[barrel]		[int]	NULL
	,[barrel%]		[float]	NULL
	,[maxEV]		[float]	NULL
	,[playerid]		[nvarchar](500)	NULL
) ON [PRIMARY];
*/
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
bulk INSERT #Stats_Fangraphs_2020_Pitching_Sept_21												--INSERT NEW NAME
						FROM 'C:\Users\ziad\Downloads\FanGraphs Leaderboard (12).csv'		--INSERT NEW NAME
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

							/*if from excel csv		*/			(
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

	/*	(
						FIRSTROW = 2,
						FIELDTERMINATOR = '","',  
						ROWTERMINATOR = '"\n"',
						--FORMAT='CSV',
						FIELDQUOTE='"',
						TABLOCK,
						keepnulls,
						CODEPAGE=65001,
						keepidentity
						)*/
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
DROP TABLE if exists Stats_Fangraphs_2020_Pitching_Sept_21							--INSERT NEW NAME
CREATE TABLE  Stats_Fangraphs_2020_Pitching_Sept_21							--INSERT NEW NAME
(
	[full_name]		[nvarchar](500)	NULL
	,[Team]			[nvarchar](500)	NULL
	,[Age]			[int]	NULL
	,[IP]			[float]	NULL
	,[K]			[int]	NULL
	,[K/9]			[float]	NULL
	,[ERA]			[float]	NULL
	,[WHIP]			[float]	NULL
	,[WAR]			[float]	NULL
	,[W]			[int]	NULL
	,[L]			[int]	NULL
	,[SV]			[int]	NULL
	,[BS]			[int]	NULL
	,[G]			[int]	NULL
	,[GS]			[int]	NULL
	,[BB/9]			[float]	NULL
	,[HR/9]			[float]	NULL
	,[BABIP]		[float]	NULL
	,[GB%]			[float]	NULL
	,[LOB%]			[nvarchar](500)	NULL
	,[FIP]			[float]	NULL
	,[xFIP]			[float]	NULL
	,[CG]			[int]	NULL
	,[ShO]			[int]	NULL
	,[EV]			[float]	NULL
	,[SwStr%]			[float]	NULL
	,[Contact%]			[float]	NULL
	,[Soft%]			[float]	NULL
	,[Med%]			[float]	NULL
	,[Hard%]			[float]	NULL
		,[FBv] [float]
	,[wFB] [float]
	,[SLv] [float]
	,[wSL] [float]
	,[CHv] [float]
	,[wCH] [float]
	,[CBv] [float]
	,[wCB] [float]
	,[barrel]		[int]	NULL
	,[barrel%]		[float]	NULL
	,[maxEV]		[float]	NULL
	,[playerid]		[nvarchar](500)	NULL


) ON [PRIMARY];
*/
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
INSERT INTO	Stats_Fangraphs_2020_Pitching_Sept_21																--INSERT NEW NAME 
SELECT
	  
	   [name] as [full_name]
      ,[Team]
      ,[Age]
      ,[IP]
      ,[so] as [K]
      ,[K/9]
      ,[ERA]
      ,[WHIP]
      ,[WAR]
      ,[W]
      ,[L]
      ,[SV]
      ,[BS]
      ,[G]
      ,[GS]
      ,[BB/9]
      ,[HR/9]
      ,[BABIP]
      ,[GB%]
	  ,[LOB%]
      ,[FIP]
      ,[xFIP]
      ,[CG]
      ,[ShO]
	  	,[EV]			
	,[SwStr%]			
	,[Contact%]			
	,[Soft%]			
	,[Med%]			
	,[Hard%]			
	,[FBv]
	,[wFB]
	,[SLv]
	,[wSL]
	,[CHv]
	,[wCH]
	,[CBv]
	,[wCB]
	,[barrel]		
	,[barrel%]		
	,[maxEV]		
      ,[playerid]

FROM	#Stats_Fangraphs_2020_Pitching_Sept_21																	--INSERT NEW NAME
*/
GO


