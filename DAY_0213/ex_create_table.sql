create database scraping;

use scraping;

# pages 테이블이 존재하면 삭제함
drop table if exists pages;

create table pages
(id bigint(7) not null auto_increment,
title varchar(200),
content varchar(10000),
created timestamp default current_timestamp,  # default current_timestamp : 자동으로 현재 시간이 저장됨
primary key(id));

insert into pages(title, content)
values('Test Page title', 'This is some test page content. It can be up to 10,000 characters long.');

insert into pages(title, content)
values('second page title', 'This is the second test page content');

select * from pages;

select count(*) from pages;

select * from pages;

