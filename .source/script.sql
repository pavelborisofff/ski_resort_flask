alter table weather_3_local
	add snow_state varchar(80) default "ОТСУТСТВИЕ СНЕГА" null;

alter table weather_3_local
	add snow_height int default 0 null;

alter table weather_3_local
	add snow_height_new int default 0 null;

alter table weather_3_local
	add snow_date varchar(20) default "-" null;

alter table weather_3_local
	add snow_avalanche int default 0 null;

alter table weather_3_yrno
	add snow_state varchar(80) default "ОТСУТСТВИЕ СНЕГА" null;

alter table weather_3_yrno
	add snow_height int default 0 null;

alter table weather_3_yrno
	add snow_height_new int default 0 null;

alter table weather_3_yrno
	add snow_date varchar(20) default "-" null;

alter table weather_3_yrno
	add snow_avalanche int default 0 null;


alter table weather_0_local
	add source varchar(20) default "yrno" null;

alter table weather_1_local
	add source varchar(20) default "yrno" null;

alter table weather_2_local
	add source varchar(20) default "yrno" null;

alter table weather_3_local
	add source varchar(20) default "yrno" null;


alter table weather_0_yrno
	add source varchar(20) default "yrno" null;

alter table weather_1_yrno
	add source varchar(20) default "yrno" null;

alter table weather_2_yrno
	add source varchar(20) default "yrno" null;

alter table weather_3_yrno
	add source varchar(20) default "yrno" null;


alter table weather_3_local
	add wind_velocity_day int default 0 null;

alter table weather_3_yrno
	add wind_velocity_day int default 0 null;

alter table weather_3_local
	add wind_direction_day varchar(20) default "-" null;

alter table weather_3_yrno
	add wind_direction_day varchar(20) default "-" null;

