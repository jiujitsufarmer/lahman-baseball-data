select schoolnick, count(schoolnick)
from schools
group by schoolnick
;

select *
from collegeplaying
where playerid = 'priceda01'
;

select *
from salaries
where playerid = 'priceda01'
;

-- FROM people p JOIN collegeplaying cp JOIN schools s
--      WHERE p.playerid = cp.playerid AND cp.schoolid = s.schoolid

select * from people
limit 15;

select * from collegeplaying
limit 15;

SELECT distinct concat(p.namefirst, ' ', p.namelast) as name, sc.schoolname,
  sum(sa.salary)
  OVER (partition by concat(p.namefirst, ' ', p.namelast)) as total_salary
  FROM (people p JOIN collegeplaying cp ON p.playerid = cp.playerid)
  JOIN schools sc ON cp.schoolid = sc.schoolid
  JOIN salaries sa ON p.playerid = sa.playerid
  where cp.schoolid = 'vandy'
  group by name, schoolname, sa.salary, sa.yearid
  ORDER BY total_salary desc 
;


-- SELECT people.namefirst, people.namelast, collegeplaying.schoolid
-- FROM people
-- JOIN collegeplaying ON collegeplaying.playerid=people.playerid
-- WHERE schoolid = 'vandy'
-- ;