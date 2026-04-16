create database if not exists wallet_db;
use wallet_db;

drop table if exists transactions;
drop table if exists wallets;

create table wallets (
    walletId int primary key,
    userId int not null unique,
    balance decimal(10,2) not null default 0,
    check (balance >= 0)
);

create table transactions (
    transactionId int primary key,
    walletId int not null,
    type varchar(20) not null,
    amount decimal(10,2) not null,
    createdAt datetime not null default current_timestamp,
    status varchar(20) not null default 'pending',

    foreign key (walletId) references wallets(walletId),

    check (amount > 0),
    check (type in ('nap', 'rut', 'thanhtoan')),
    check (status in ('pending', 'success', 'fail'))
);