USE [Biagini_in_a_Bottle]
GO

/****** Object:  View [dbo].[IMPORT_BATTING_Fangraphs]    Script Date: 2021-02-05 2:56:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[IMPORT_BATTING_Fangraphs] AS 

SELECT 1 AS A

/*
/*note: make sure fangraphs table matches this schema 
-- archive https://www.fangraphs.com/leaders.aspx?pos=all&stats=bat&lg=all&qual=0&type=c,4,6,11,12,13,21,34,35,40,41,23,37,38,50,61,111,203,199,58,3,305,5,7,8,9,10,14,16,209,210,211,107,110,294&season=2020&month=0&season1=2020&ind=0&team=0&rost=0&age=0&filter=&players=0&startdate=2020-01-01&enddate=2020-12-31
https://www.fangraphs.com/leaders.aspx?pos=all&stats=bat&lg=all&qual=0&type=c,4,6,11,12,13,21,34,35,40,41,23,37,38,50,61,111,203,199,58,3,305,5,7,8,9,10,14,16,209,210,211,107,110,294,307,308,309&season=2020&month=0&season1=2020&ind=0&team=0&rost=0&age=0&filter=&players=0&startdate=2020-01-01&enddate=2020-12-31
also change % to decimals by find and replace - make sure to keep it in the header*/

DROP TABLE if exists #Stats_Fangraphs_2020_batting_Sept_21	;				--INSERT NEW NAME
CREATE TABLE  #Stats_Fangraphs_2020_batting_Sept_21					--INSERT NEW NAME
(
[Name]			[nvarchar](500)	NULL
,[Team]			[nvarchar](500)	NULL
,[G]			[int]	NULL
,[PA]			[int]	NULL
,[HR]			[int]	NULL
,[R]			[int]	NULL
,[RBI]			[int]	NULL
,[SB]			[int]	NULL
,[BB%]			[float]	NULL
,[K%]			[float]	NULL
,[ISO]			[float]	NULL
,[BABIP]		[float]	NULL
,[AVG]			[float]	NULL
,[OBP]			[float]	NULL
,[SLG]			[float]	NULL
,[wOBA]			[float]	NULL
,[wRC+]			[int]	NULL
,[BsR]			[float]	NULL
,[Off]			[float]	NULL
,[Def]			[float]	NULL
,[WAR]			[float]	NULL
,[Age]			[int]	NULL
,[EV]			[float]	NULL
,[AB]			[int]	NULL
,[H]			[int]	NULL
,[1B]			[int]	NULL
,[2B]			[int]	NULL
,[3B]			[int]	NULL
,[BB]			[int]	NULL
,[SO]			[int]	NULL
,[Soft%]		[float]	NULL
,[Med%]		[float]	NULL
,[Hard%]		[float]	NULL
,[Contact%]		[float]	NULL
,[SwStr%]		[float]	NULL
,[BABIP+]		[int]	NULL
,[barrel]		[int]	NULL
,[barrel%]		[float]	NULL
,[maxEV]		[float]	NULL
,[playerid]		[nvarchar](500)	NULL
) ON [PRIMARY];
*/

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
bulk INSERT #Stats_Fangraphs_2020_batting_Sept_21												--INSERT NEW NAME
						FROM 'C:\Users\ziad\Downloads\FanGraphs Leaderboard (14).csv'		--INSERT NEW NAME
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
																			
													/*	if from excel csv				
																			
																			
																			
																			
																									(
						FIRSTROW = 2,
						FIELDTERMINATOR = '","',  
						ROWTERMINATOR = '"\n"',
						--FORMAT='CSV',
						--FIELDQUOTE='"',
						TABLOCK,
						keepnulls,
						CODEPAGE=65001,
						keepidentity
						)*/

						*/
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
DROP TABLE if exists Stats_Fangraphs_2020_batting_Sept_21							--INSERT NEW NAME
CREATE TABLE  Stats_Fangraphs_2020_batting_Sept_21							--INSERT NEW NAME
(
[full_Name]			[nvarchar](500)	NULL
,[Team]			[nvarchar](500)	NULL
,[G]			[int]	NULL
,[PA]			[int]	NULL
,[HR]			[int]	NULL
,[R]			[int]	NULL
,[RBI]			[int]	NULL
,[SB]			[int]	NULL
,[BB%]			[float]	NULL
,[K%]			[float]	NULL
,[ISO]			[float]	NULL
,[BABIP]		[float]	NULL
,[AVG]			[float]	NULL
,[OBP]			[float]	NULL
,[SLG]			[float]	NULL
,[wOBA]			[float]	NULL
,[wRC+]			[int]	NULL
,[BsR]			[float]	NULL
,[Off]			[float]	NULL
,[Def]			[float]	NULL
,[WAR]			[float]	NULL
,[Age]			[int]	NULL
,[EV]			[float]	NULL
,[AB]			[int]	NULL
,[H]			[int]	NULL
,[1B]			[int]	NULL
,[2B]			[int]	NULL
,[3B]			[int]	NULL
,[BB]			[int]	NULL
,[SO]			[int]	NULL
,[Soft%]		[float]	NULL
,[Med%]		[float]	NULL
,[Hard%]		[float]	NULL
,[Contact%]		[float]	NULL
,[SwStr%]		[float]	NULL
,[BABIP+]		[int]	NULL
,[barrel]		[int]	NULL
,[barrel%]		[float]	NULL
,[maxEV]		[float]	NULL
,[playerid]		[nvarchar](500)	NULL
) ON [PRIMARY];
*/
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
INSERT INTO	Stats_Fangraphs_2020_batting_Sept_21																--INSERT NEW NAME 
SELECT
[Name]			as full_name
,[Team]			
,[G]			
,[PA]			
,[HR]			
,[R]			
,[RBI]			
,[SB]			
,[BB%]			
,[K%]			
,[ISO]			
,[BABIP]	
,[AVG]			
,[OBP]			
,[SLG]			
,[wOBA]			
,[wRC+]			
,[BsR]			
,[Off]			
,[Def]			
,[WAR]			
,[Age]			
,[EV]			
,[AB]			
,[H]			
,[1B]			
,[2B]			
,[3B]			
,[BB]			
,[SO]			
,[Soft%]		
,[Med%]		
,[Hard%]		
,[Contact%]		
,[SwStr%]		
,[BABIP+]		
,[barrel]		
,[barrel%]		
,[maxEV]		
,[playerid]		

FROM	#Stats_Fangraphs_2020_batting_history																	--INSERT NEW NAME
*/



GO


