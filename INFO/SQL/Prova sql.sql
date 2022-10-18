//creare file csv

create table prova(id integer, name text, subname text, Primary Key(id));
.mode csv
.import "file" filename;
