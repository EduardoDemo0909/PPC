create table NBA(
	id serial primary key,
	team varchar(255),
	conference varchar
);

create table pontos_nba (
	id serial primary key,
	point int,
	best_pointer varchar (255)
);

create table data (
	id serial primary key,
	data date not null,
	vs varchar(255) not null
);

Create table rounds(
	NBA_id integer,
	pontos_nba_id integer,
	data_id integer,
	primary key (NBA_id, pontos_nba_id, data_id),
	
	foreign key (NBA_id)
	references NBA (id)
	on update cascade,
	
	foreign key (pontos_nba_id)
	references pontos_nba (id)
	on update cascade,
	
	foreign key (data_id)
	references data (id)
	on update cascade
);


select * from jogos


create view jogos as
select  NBA.team,
		pontos_nba.point,
		pontos_nba.best_pointer as melhor_pontuado,
		data.vs,
		data.data
		
		From pontos_nba
			JOIN rounds
				ON rounds.pontos_nba_id = pontos_nba.id
			JOIN NBA
				ON NBA.id = rounds.NBA_id
			JOIN data
				ON data.id = rounds.data_id;
		
		

insert into rounds (NBA_id, pontos_nba_id, data_id) values  (1, 1, 2),
															(2, 2, 1),
															(3, 3, 4),
															(4, 4, 3),
															(5, 5, 6),
															(6, 6, 5),
															(7, 7, 8),
															(8, 8, 7);

insert into NBA (id, team, conference) values   (1, 'kings', 'oeste'),
												(2, 'Timberwolves', 'oeste'),
												(3, 'Bucks', 'leste'),
												(4, 'Wizards', 'leste'),
												(5, 'Clippers', 'oeste'),
												(6, 'Pelicans', 'oeste'),
												(7, 'Warriors', 'oeste'),
												(8, 'Spurs', 'oeste');			
												
insert into pontos_nba (id, point, best_pointer) values (1, 124, 'DeAaron Fox'),
														(2, 111, 'Anthony Edwards'),
														(3, 131, 'Brook Lopez'),
														(4, 128, 'Jordan Poole'),
														(5, 106, 'Paul Gorge'),
														(6, 116, 'Zion Williamson'),
														(7, 118, 'Stephen Curry'),
														(8, 112, 'Devin Vassell');
														
insert into data (id, data, vs) values  (1, '2023-11-24', 'Kings'),
										(2, '2023-11-24', 'Timberwolfers'),
										(3, '2023-11-24', 'Bucks'),
										(4, '2023-11-24', 'Wizards'),
										(5, '2023-11-25', 'Clippers'),
										(6, '2023-11-25', 'Pellicans'),
										(7, '2023-11-25', 'Warriors'),
										(8, '2023-11-25', 'Spurs');
										

										





