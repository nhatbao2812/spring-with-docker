create table if not exists staff
(
    id SERIAL PRIMARY KEY,
    name  varchar(255) null,
    phone varchar(255) null
);