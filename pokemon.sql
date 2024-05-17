Create database pokemon;
use pokemon;
drop database pokemon;

CREATE TABLE Regiao (
  idRegiao INT NOT NULL auto_increment,
  nome VARCHAR(45) NULL,
  PRIMARY KEY (idRegiao)
)auto_increment = 100;

CREATE TABLE Elemento (
  idElemento INT NOT NULL auto_increment,
  nome VARCHAR(45) NULL,
  fkFraqueza INT NULL,
  PRIMARY KEY (idElemento),
  CONSTRAINT fk_fraqueza
    FOREIGN KEY (fkFraqueza)
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
  fkRegiao int,
  
  PRIMARY KEY (idTreinador),
  constraint fk_regiao foreign key(fkRegiao) references regiao(idRegiao)
) auto_increment = 1000;

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
                  
insert into treinador(nome, fkRegiao)
values 				  ('Verri', 103),
					  ('Rosim', 104),
                      ('Caio', 105),
                      ('Frizza', 106),
                      ('Marise', 106);
                      
insert into elite(fktreinador, ocupacao)
values 			 (1001, 1),
				 (1002, 2),
                 (1003, 3),
                 (1004, 4);
                 

                 
insert into elemento(nome, fkFraqueza)
values				('Fogo', NULL),
					('Agua', NULL),
                    ('Planta', null),
                    ('Terra', NULL),
                    ('Dragão', null),
                    ('Psiquico', NULL),
                    ('Normaç', null);
                    
update elemento
set fkFraqueza = 51
where nome = 'Fogo';

update elemento
set fkFraqueza = 52
where nome = 'Agua';

update elemento
set fkFraqueza = 50
where nome = 'Planta';

update elemento
set fkFraqueza = 51
where nome = 'Terra';

update elemento
set fkFraqueza = 55
where nome = 'Dragão';
                    
insert into pokedex(nome, poder, vida, fkElemento, fkRegiao) values 
('Torkoal', 2000, 200, 50, 103),
('Probopass', 1750, 205, 53, 104),
('Dragalge', 2000, 210, 54, 106),
('Gyarados', 1500, 150, 51, 105),
('Mewtwo', 3000, 300, 55, 101),
('Charmander', 1300, 110, 50, 101),
('Bulbasaur', 1200, 120, 52, 102),
('Squirtle', 1250, 115, 51, 103),
('Eevee', 1000, 90, 56, 104);


select * from pokedex;
select * from treinador;
insert into time_treinador (fkpokemon, fktreinador, nivel) values
(1,1001, 25),
(6,1001, 30),
(2,1002, 27),
(7,1002, 20),
(3, 1003, 23),
(8, 1003, 27),
(4, 1004, 30),
(9, 1004, 32),
(5, 1000, 36),
(4, 1000, 36);

select * from time_treinador;



-- Primeira Batalha X Marise
SELECT 
poke.nome
FROM time_treinador
 