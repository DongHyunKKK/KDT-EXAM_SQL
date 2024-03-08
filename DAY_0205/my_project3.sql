create database fpopulation;

use fpopulation;
select * from 시도별_외국인주민_현황;


select 
	`행정구역별(1)`, 
	시점, 
	`거주외국인별(1)`, 
	`거주외국인별(2)`, 
	합계
from 시도별_외국인주민_현황
where `거주외국인별(1)` = '한국국적을 가지지 않은 자 (명)' and `거주외국인별(2)` = '소계'
order by 시점;

select 
	f1.`행정구역별(1)`, 
	f1.시점, 
	f1.`거주외국인별(1)`,
	f2.`거주외국인별(1)` as `거주외국인별(2)`,
	f1.합계 as '국적 미취득자 합계',
	f2.합계 as '국적 취득자 합계'
from 시도별_외국인주민_현황 as f1
	join 시도별_외국인주민_현황 as f2
	on (f1.`행정구역별(1)` = f2.`행정구역별(1)`) and (f1.시점 = f2.시점)
#order by 시점;
where (f1.`거주외국인별(1)` = '한국국적을 가지지 않은 자 (명)' and f1.`거주외국인별(2)` = '소계') and 
f2.`거주외국인별(1)` = '한국국적을 취득한 자 (명)' and f2.`거주외국인별(2)` = '소계';

drop temporary table city_populaion;

create temporary table city_population
(`행정구역별(1)` varchar(50),
시점 int,
`거주외국인별(1)` varchar(50),
`거주외국인별(2)` varchar(50),
`국적 미취득자 합계` int,
`국적 취득자 합계` int,
primary key(`행정구역별(1)`, 시점));

insert into city_population
	select 
	f1.`행정구역별(1)`, 
	f1.시점, 
	f1.`거주외국인별(1)`,
	f2.`거주외국인별(1)` as `거주외국인별(2)`,
	f1.합계 as '국적 미취득자 합계',
	f2.합계 as '국적 취득자 합계'
	from 시도별_외국인주민_현황 as f1
		join 시도별_외국인주민_현황 as f2
		on (f1.`행정구역별(1)` = f2.`행정구역별(1)`) and (f1.시점 = f2.시점)
	#order by 시점;
	where (f1.`거주외국인별(1)` = '한국국적을 가지지 않은 자 (명)' and f1.`거주외국인별(2)` = '소계') and 
	f2.`거주외국인별(1)` = '한국국적을 취득한 자 (명)' and f2.`거주외국인별(2)` = '소계';


create view city_population as
	select 
	f1.`행정구역별(1)`, 
	f1.시점, 
	f1.`거주외국인별(1)`,
	f2.`거주외국인별(1)` as `거주외국인별(2)`,
	f1.합계 as '국적 미취득자 합계',
	f2.합계 as '국적 취득자 합계'
	from 시도별_외국인주민_현황 as f1
		join 시도별_외국인주민_현황 as f2
		on (f1.`행정구역별(1)` = f2.`행정구역별(1)`) and (f1.시점 = f2.시점)
	#order by 시점;
	where (f1.`거주외국인별(1)` = '한국국적을 가지지 않은 자 (명)' and f1.`거주외국인별(2)` = '소계') and 
	f2.`거주외국인별(1)` = '한국국적을 취득한 자 (명)' and f2.`거주외국인별(2)` = '소계';

select * from city_population;
desc city_population;

# 다중 PK 설정 (시도별_외국인주민_현황) => primary key는 이미 위에서 table 만들때 생성됨
# alter table city_population
# add primary key (`행정구역별(1)`, 시점);

select * from 시군구별_연령별;

alter table 시군구별_연령별
add foreign key `행정구역별(1)` references city_population (`행정구역별(1)`, 시점);

