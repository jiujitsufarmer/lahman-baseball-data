-- SELECT t.teamid, t.attendance, t.w, t.ghome from teams as t
-- case when attendance 
-- where attendance is not null and ghome is not null
-- hg.attendance, hg.team, hg.year, hg.games
--   FROM (teams t JOIN homegames hg ON t.teamid = hg.team)
-- where hg.year >= 2000 and teamid = 'ANA'
-- where attendance is not null and ghome is not null
-- and hg.attendance > 0
-- and team = 'BOS'
-- order by year desc
-- order by teamid asc

-- select * from teams

-- select * from homegames

-- select teamid, attendance, w, yearid from teams
-- where teamid = 'ANA'

-- select team, attendance from homegames
-- where team = 'BLA'

-- SELECT t.teamid, t.attendance, t.w, t.ghome from teams as t
	
SELECT t.teamid, t.attendance, t.w, t.ghome, t.yearid, sum(attendance/w) over(partition by teamid, yearid) as apw,
CASE
	WHEN t.attendance < 1000000 THEN 'under 1M'
	WHEN t.attendance < 2000000 THEN 'under 2M'
	WHEN t.attendance < 3000000 THEN 'under 3M'
	WHEN t.attendance < 4000000 THEN 'under 4M'
	WHEN t.attendance < 5000000 THEN 'under 5M'
    ELSE 'blank'
END AS attendance_measurements
From teams t
-- Where w in (Select w From teams Where attendance_measurements = 'under 4M') --insert buyer_id param here
-- Group By attendance_measurements
-- FROM (teams t JOIN homegames hg ON t.teamid = hg.team)
where t.attendance is not null and t.yearid = 1986
order by w desc;

-- SELECT teamid, yearid
-- FROM teams
-- WHERE teamid = 'COL';