USE [Biagini_in_a_Bottle]
GO

/****** Object:  View [dbo].[IMPORT_CBS_Pitching]    Script Date: 2021-02-05 2:56:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[IMPORT_CBS_Pitching] as select 1 as a

/*
DROP TABLE if exists #CBS_2020_pitching_PLAYOFFS
CREATE TABLE  #CBS_2020_pitching_PLAYOFFS   --INSERT NEW NAME
(
Avail [nvarchar](500) NULL
,Player [nvarchar](500) NULL
,INNs [float] NULL
,APP [INT] NULL
,GS [INT] NULL
,QS [INT] NULL
,CG [INT] NULL
,W [INT] NULL
,L [INT] NULL
,S [INT] NULL
,BS [INT] NULL
,K [INT] NULL
,BB [INT] NULL
,H [INT] NULL
,ERA [float] NULL
,WHIP [float] NULL
,FPTS [float] NULL 
) ON [PRIMARY];

*/
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
bulk INSERT #CBS_2020_pitching_PLAYOFFS --INSERT NEW NAME
						FROM 'C:\Users\ziad\Downloads\stats (1).csv' --INSERT NEW NAME
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
CREATE TABLE  CBS_2020_pitching_PLAYOFFS							--INSERT NEW NAME
(
	Full_name	[nvarchar](500)	NULL
	,Position	[nvarchar](500)	NULL
	,Team	[nvarchar](500)	NULL
	,INNs	[float]	NULL
	,APP	[int]	NULL
	,GS	[int]	NULL
	,QS	[int]	NULL
	,CG	[int]	NULL
	,W	[int]	NULL
	,L	[int]	NULL
	,S	[int]	NULL
	,BS	[int]	NULL
	,K	[int]	NULL
	,BB	[int]	NULL
	,H	[int]	NULL
	,ERA	[float]	NULL
	,WHIP	[float]	NULL
	,FPTS	[float]	NULL
	,[Status]	[nvarchar](500)	NULL
) ON [PRIMARY];
*/
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
INSERT INTO	CBS_2020_pitching_PLAYOFFS													--INSERT NEW NAME 
SELECT
	  
      trim(SUBSTRING(TRIM(Player),1,CHARINDEX('|',TRIM(Player),1)-4)) AS [Full_name] 		
	  ,trim(
				SUBSTRING(
							TRIM(Player),CHARINDEX('|',TRIM(Player),1)-4,3
						) 
			) 	 
		AS [Position]
	  --,player
      ,TRIM(RIGHT(TRIM(Player),3))		AS [Team]
      ,[INNs]
      ,[APP]
      ,[GS]
      ,[QS]
      ,[CG]
      ,[W]
      ,[L]
      ,[S]
      ,[BS]
      ,[K]
      ,[BB]
      ,[H]
      ,[ERA]
      ,[WHIP]
      ,[FPTS]
      ,AVAIL AS [Status]

FROM	#CBS_2020_pitching_PLAYOFFS												--INSERT NEW NAME
*/
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

GO


