# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table company (
  id                        bigint not null,
  legal_name                varchar(255),
  fantasy_name              varchar(255),
  cuit                      varchar(255),
  constraint pk_company primary key (id))
;

create table eco_station (
  id                        bigint not null,
  position_id               bigint,
  company_id                bigint,
  constraint pk_eco_station primary key (id))
;

create table eco_station_position (
  id                        bigint not null,
  latitude                  float,
  longitude                 float,
  date                      timestamp,
  description               varchar(255),
  constraint pk_eco_station_position primary key (id))
;

create table eco_user (
  id                        bigint not null,
  name                      varchar(255),
  last_name                 varchar(255),
  rfid                      varchar(255),
  untraded_bottles          integer,
  money                     decimal(38),
  role                      varchar(1),
  active                    boolean,
  dni                       varchar(255),
  constraint ck_eco_user_role check (role in ('A','U')),
  constraint pk_eco_user primary key (id))
;

create table prize (
  id                        bigint not null,
  required_bottles          integer,
  description               varchar(255),
  name                      varchar(255),
  constraint pk_prize primary key (id))
;

create table recycling (
  id                        bigint not null,
  eco_user_id               bigint not null,
  date                      timestamp,
  bottles_count             integer,
  bottle_unit_value         decimal(38),
  station_id                bigint,
  constraint pk_recycling primary key (id))
;

create table trade (
  id                        bigint not null,
  eco_user_id               bigint not null,
  prize_id                  bigint,
  date                      timestamp,
  constraint pk_trade primary key (id))
;

create sequence company_seq;

create sequence eco_station_seq;

create sequence eco_station_position_seq;

create sequence eco_user_seq;

create sequence prize_seq;

create sequence recycling_seq;

create sequence trade_seq;

alter table eco_station add constraint fk_eco_station_position_1 foreign key (position_id) references eco_station_position (id) on delete restrict on update restrict;
create index ix_eco_station_position_1 on eco_station (position_id);
alter table eco_station add constraint fk_eco_station_company_2 foreign key (company_id) references company (id) on delete restrict on update restrict;
create index ix_eco_station_company_2 on eco_station (company_id);
alter table recycling add constraint fk_recycling_eco_user_3 foreign key (eco_user_id) references eco_user (id) on delete restrict on update restrict;
create index ix_recycling_eco_user_3 on recycling (eco_user_id);
alter table recycling add constraint fk_recycling_station_4 foreign key (station_id) references eco_station (id) on delete restrict on update restrict;
create index ix_recycling_station_4 on recycling (station_id);
alter table trade add constraint fk_trade_eco_user_5 foreign key (eco_user_id) references eco_user (id) on delete restrict on update restrict;
create index ix_trade_eco_user_5 on trade (eco_user_id);
alter table trade add constraint fk_trade_prize_6 foreign key (prize_id) references prize (id) on delete restrict on update restrict;
create index ix_trade_prize_6 on trade (prize_id);



# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists company;

drop table if exists eco_station;

drop table if exists eco_station_position;

drop table if exists eco_user;

drop table if exists prize;

drop table if exists recycling;

drop table if exists trade;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists company_seq;

drop sequence if exists eco_station_seq;

drop sequence if exists eco_station_position_seq;

drop sequence if exists eco_user_seq;

drop sequence if exists prize_seq;

drop sequence if exists recycling_seq;

drop sequence if exists trade_seq;

