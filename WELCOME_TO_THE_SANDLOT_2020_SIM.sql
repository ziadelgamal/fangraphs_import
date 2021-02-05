USE [Biagini_in_a_Bottle]
GO

/****** Object:  View [dbo].[WELCOME_TO_THE_SANDLOT_2020_SIM]    Script Date: 2021-02-05 2:56:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[WELCOME_TO_THE_SANDLOT_2020_SIM] AS  select 1 as a;
/*declare @teamlike  varchar(50)= 'darryl';

with batting as 
	(
		SELECT --TOP(12) 
			* FROM 
			(SELECT z.full_name
			  ,x.[R]*1 as [R]
			  ,x.[H]*1.1 as [H]
			  ,x.[2B]*1 as [2B]
			  ,x.[3B]*2 as [3B]
			  ,x.[HR]*3 as [HR]
			  ,x.[RBI]*1 as [RBI]
			  ,x.[SB]*2 as [SB]
			  ,-x.[CS] as [CS]
			  ,-x.[SO] as [SO]
			  ,x.[HBP]*1 as [HBP]
			  ,(x.[IBB]+x.[BB])*1.1 as [BB]
			  ,
				  x.[R]*1 
				 + x.[H]*1.1 
				 + x.[2B]*1 
				 + x.[3B]*2
				 + x.[HR]*3 
				 + x.[RBI]*1 
				 + x.[SB]*2 
				 + -x.[CS] 
				 + -x.[SO]
				 + x.[HBP]*1 
				 + (x.[IBB]+x.[BB])*1.1 
				as [score]
		/*CYC Hitting for the Cycle 10 points
		GSHR Grand Slam Home Runs 5 points*/
		FROM [Biagini_in_a_Bottle].[dbo].[CBS_2020_batting_POSTdraft] z
		left join [dbo].[SIM_OOTP_2020_batting] x on z.Full_name=x.full_name
		where status like ''+ @teamlike +'%'
	) zz --order by score desc
)
, pitching as
(
	select 
			--top(10) 
	* from 
	(SELECT 
      z.[full_name]
      ,x.[W]*5 as [W]
      ,-(x.[L]*5) as [L]
      ,x.[G]*1 as [APP]
      ,x.[GS]*0 as [GS]
      ,x.[CG]*5 as [CG]
      ,x.[SHO]*10 as [SHO]
      ,x.[QS]*5 as [QS]
      ,x.[SV]*6 as [SV]
      ,x.[Hold]*3 as [Hold]
      ,x.[IP]*1 as [IP]
      ,-(x.[ER]*.5) as [ER]
      ,x.[SO]*1 as [SO]
	  ,
		  x.[W]*5
		  +-(x.[L]*5) 
		  +x.[G]*1 
		  +x.[GS]*0
		  +x.[CG]*5 
		  +x.[SHO]*10 
		  +x.[QS]*5 
		  +x.[SV]*6 
		  +x.[Hold]*3 
		  +x.[IP]*1 
		  +-(x.[ER]*.5) 
		  +x.[SO]*1
		as score

/*BS Blown Saves -3 points
NH No-Hitters 10 points*/
	FROM [Biagini_in_a_Bottle].[dbo].[CBS_2020_pitching_POSTdraft] z
	left join [dbo].[SIM_OOTP_2020_pitching] x on z.Full_name=x.full_name
	where status like ''+ @teamlike +'%'
	) zz --order by score desc

)

--select * from batting order by score desc
select * from pitching order by score desc

/*select b.final_score as batting_score
, p.final_score  as pitching_score from (SELECT 
	--'' as final_score, game.*
	'score' as category, cast(sum(score) as varchar(500)) as final_score
FROM batting )b
left join (
			SELECT 
				--'' as final_score, game.*
				'score' as category, cast(sum(score) as varchar(500)) as final_score
			FROM pitching
			) p on p.category
			=b.category*/

--order by SCORE desc

/*H Hits 1.1 points
2B Double 1 point
3B Triples 2 points
HR Home Run 3 points
CYC Hitting for the Cycle 10 points
GSHR Grand Slam Home Runs 5 points
W Walks (Batters) 1.1 points
HP Hit by Pitch 1 point
CS Caught Stealing -1 point
KO Strikeouts (Batter) -1 point
R Runs 1 point
RBI Runs Batted In 1 point
SB Stolen Bases 2 points


PITCHING
APP Appearances 1 point
BS Blown Saves -3 points
CG Complete Games 5 points
ER Earned Runs -0.5 points
GS Games Started (Pitcher) 0 points
HD Holds 3 points
INN Innings 1 point
K Strikeouts (Pitcher) 1 point
L Losses -5 points
NH No-Hitters 10 points
QS Quality Starts 5 points
S Saves 6 points
SO Shutouts 10 points
W Wins 5 points


SPECIAL SCORING FOR RELIEF PITCHERS
L Losses -3 points
W Wins 5 point*/
*/
GO


