// 18/10/22
creare file csv e poi esportarlo

create table prova(id integer, name text, subname text, Primary Key(id));
.mode csv
.import "file" filename;


create table Regioni(idRegione integer, nome text, autonoma integer, Primary key (idRegione));
create table Provincie(idProvincia integer, nome text, sigla text,primary key(idProvincia), foreign key (idRegione));
create table Comuni(IdComune integer, nome text, )


//GROUP BY Syntax

SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);

//HAVING Syntax

SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);