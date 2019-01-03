create table theaters (
    tht_id int unsigned not null,
    tht_name varchar(40) not null,
    tht_address varchar(80) not null,
    tht_active tinyint unsigned not null
);



create table authors (
    aut_id mediumint unsigned not null,
    gen_name varchar(50) not null
);


create table genres (
    gen_id tinyint unsigned not null,
    gen_title varchar(40) not null
);