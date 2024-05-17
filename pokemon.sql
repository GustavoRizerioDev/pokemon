Create database pokemon;
use pokemon;


CREATE TABLE Regiao (
  idRegiao INT NOT NULL auto_increment,
  nome VARCHAR(45) NULL,
  PRIMARY KEY (idRegiao)
)auto_increment = 100;

CREATE TABLE Elemento (
  idElemento INT NOT NULL auto_increment,
  nome VARCHAR(45) NULL,
  fkelemento INT NULL,
  PRIMARY KEY (idElemento),
  CONSTRAINT fk_Elemento
    FOREIGN KEY (fkelemento)
    REFERENCES Elemento (idElemento)
)auto_increment = 50;

CREATE TABLE pokedex (
    idPokemon INT NOT NULL auto_increment,
    Nome VARCHAR(45) NULL,
    Poder VARCHAR(45) NULL,
    vida VARCHAR(45) NULL,
    fkelemento INT,
    fkregiao INT,
    PRIMARY KEY (idPokemon),
    CONSTRAINT fkElemento FOREIGN KEY (fkelemento)
        REFERENCES elemento (idElemento),
    CONSTRAINT fkRegiao FOREIGN KEY (fkregiao)
        REFERENCES Regiao (idRegiao)
);

CREATE TABLE Treinador (
  idTreinador INT NOT NULL auto_increment,
  Nome VARCHAR(45) NULL,
  PRIMARY KEY (idTreinador)
) auto_increment = 1000;

alter table treinador add column fkRegiao int;
alter table treinador add constraint fk_regiao foreign key(fkRegiao) references regiao(idRegiao);

create table time_treinador (
	fkpokemon int,
    fktreinador int,
    nivel int,
    
    constraint fk_pokemon foreign key(fkpokemon) references pokedex(idPokemon),
    constraint fk_treinador foreign key(fktreinador) references  treinador(idTreinador),
    constraint pk_time_treinador primary key(fkpokemon, fktreinador)
);

create table elite (
	fktreinador int,
    ocupacao int,
    
    constraint fk_treinador_elite foreign key(fktreinador) references treinador (idtreinador),
    constraint pk_elite primary key (fktreinador)
);

insert into regiao(nome)
values 			      ('Sapopemba'),
				          ('Penha'),
                  ('Capão Redondo'),
                  ('Santo Amaro'),
                  ('Xique-Xique'),
                  ('Ferraz de Vasconçelos'),
                  ('Taboão da Serra');
                  
                  select * from regiao;
                  
insert into treinador(nome, fkRegiao)
values 				  ('Verri', 103),
					  ('Rosim', 104),
                      ('Caio', 105),
                      ('Frizza', 106),
                      ('Marise', 106);
                      
insert into elite(fktreinador, ocupacao)
values 			 (1006, 1),
				 (1007, 2),
                 (1008, 3),
                 (1009, 4);
                 
insert into elemento(nome, fkelemento)
values				('Fogo', NULL),
					('Agua', NULL),
                    ('Planta', null),
                    ('Terra', NULL),
                    ('Dragão', null),
                    ('Psiquico', NULL),
                    ('Normaç', null);
                    
update elemento
set fkelemento = 58
where nome = 'Fogo';

update elemento
set fkelemento = 60
where nome = 'Agua';

update elemento
set fkelemento = 57
where nome = 'Planta';

update elemento
set fkelemento = 58
where nome = 'Terra';

update elemento
set fkelemento = 62
where nome = 'Dragão';

SELECT * FROM elemento;
		
                    
insert into pokedex(nome, poder, vida, fkElemento, fkRegiao)
values