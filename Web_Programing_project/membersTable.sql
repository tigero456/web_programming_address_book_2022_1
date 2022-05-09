USE odbo;
CREATE table if not exists members{
	id varchar(20) primary key,
	passwd varchar(20),
	email varchar(50),
	signutime timestamp default current_timestamp
	};