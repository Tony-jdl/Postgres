-- gestore_accessi.accessi definition

-- Drop table

-- DROP TABLE gestore_accessi.accessi;

CREATE TABLE gestore_accessi.accessi (
	data_inserimento date NOT NULL,
	id_badge int4 NOT NULL,
	data_ingresso date NULL,
	data_uscita date NULL,
	CONSTRAINT accessi_pk PRIMARY KEY (id_badge)
);

-- gestore_accessi.utenti definition

-- Drop table

-- DROP TABLE gestore_accessi.utenti;

CREATE TABLE gestore_accessi.utenti (
	id_utente int4 NOT NULL,
	codice_fiscale varchar(16) NOT NULL,
	nome varchar(50) NOT NULL,
	cognome varchar(50) NOT NULL,
	id_azienda int4 NOT NULL,
	id_utente_inseritore int4 NULL,
	data_inserimento date NOT NULL,
	id_utente_ultimo_aggiornamento int4 NOT NULL,
	data_ultimo_aggiornamento date NOT NULL,
	CONSTRAINT utenti_pk PRIMARY KEY (id_utente),
	CONSTRAINT utenti_unique UNIQUE (codice_fiscale)
);

-- gestore_accessi.badge definition

-- Drop table

-- DROP TABLE gestore_accessi.badge;

CREATE TABLE gestore_accessi.badge (
	id_badge int4 NOT NULL,
	nome varchar(50) NOT NULL,
	cognome varchar(50) NOT NULL,
	data_inserimento date NOT NULL,
	data_aggiornamento date NOT NULL,
	attivo bool NULL,
	CONSTRAINT badge_pk PRIMARY KEY (id_badge)
);


-- gestore_accessi.aziende definition

-- Drop table

-- DROP TABLE gestore_accessi.aziende;

CREATE TABLE gestore_accessi.aziende (
	id_azienda int4 NOT NULL,
	nome_azienda varchar(50) NOT NULL,
	CONSTRAINT aziende_pk PRIMARY KEY (id_azienda)
);

-- gestore_accessi.id_azienda_seq definition

-- DROP SEQUENCE gestore_accessi.id_azienda_seq;

CREATE SEQUENCE gestore_accessi.id_azienda_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;


-- gestore_accessi.id_badge_seq definition

-- DROP SEQUENCE gestore_accessi.id_badge_seq;

CREATE SEQUENCE gestore_accessi.id_badge_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;


-- gestore_accessi.id_utente_seq definition

-- DROP SEQUENCE gestore_accessi.id_utente_seq;

CREATE SEQUENCE gestore_accessi.id_utente_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
	

alter table gestore_accessi.badge 
add constraint fk_azienda
FOREIGN key (azienda) references aziende(nome_azienda)
on delete cascade;


-- ************************************************************

ALTER SCHEMA public RENAME TO gestore_accessi_2;


alter schema public rename to gestore_accessi_2;


create table gestore_accessi_2.utenti (
	id_utente integer not null,
	codice_fiscale varchar(50) not null,
	nome varchar(50) not null,
	cognome varchar(50) not null,
	id_azienda integer not null,
	id_utente_inseritore integer not null,
	id_utente_ultimo_aggiornameto integer not null,
	data_inserimeno date not null,
	data_aggiornamento date not null,
	constraint PK_id_utente primary key (id_utente)	
)

create table gestore_accessi_2.badge (
	id_badge integer not null,
	nome varchar(50) not null,
	cognome varchar(50) not null,
	attivo boolean,
	azienda varchar(50) not null,
	id_utente integer not null,
	data_inserimento date not null,
	data_aggiornamento date not null,
	constraint PK_id_badge primary key (id_badge)
)

create table gestore_accessi_2.aziende(
	id_azienda integer not null,
	nome_azienda varchar(50) not null,
	partita_iva varchar(50) not null,
	regione_sociale varchar(50) not null,
	descrizione varchar(50),
	utente_inseritore varchar(50) not null,
	data_inserimento date not null,
	abilitato boolean,
	constraint PK_id_azienda primary key (id_azienda)
)

create table gestore_accessi_2.accessi(
	id_badge integer not null,
	ingresso boolean,
	uscita boolean,
	data_ingresso date,
	data_uscita date,
	data_inserimento date not null
)

create table gestore_accessi_2.utenti_badge (
	id integer primary key,
	id_utente integer not null,
	id_badge integer not null,
	data_inserimento date not null
)


create table gestore_accessi_2.utenti_inseritori(
	id_utente_inseritore integer not null,
	nome varchar(50) not null,
	cognome varchar(50) not null,
	ruolo varchar(50) not null,
	abilitato boolean,
	data_inserimento date not null,
	data_utimo_aggiornamento date not null,
	constraint PK_id_utente_inseritore primary key (id_utente_inseritore)
)

alter table gestore_accessi_2.accessi add column id_accessi integer not null;

alter table gestore_accessi_2.utenti 
alter column id_utente set default nextval('gestore_accessi_2.id_utente_seq')
;

alter table gestore_accessi_2.aziende 
alter column id_azienda set default nextval('gestore_accessi_2.id_azienda_seq') 


-- gestore_accessi_2.id_utente_seq definition

-- DROP SEQUENCE gestore_accessi_2.id_utente_seq;

CREATE SEQUENCE gestore_accessi_2.id_utente_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
	
create sequence gestore_accessi_2.id_azienda_seq
	increment by 1
	minvalue 1
	maxvalue 9223372036854775807
	start 1
	cache 1
	no cycle;
	
create sequence gestore_accessi_2.id_accesso_seq
	increment by 1
	minvalue 1
	maxvalue 9223372036854775807
	start 1
	cache 1
	no cycle;
	

-- INIZIO INSERIMENTI A DATABASE

INSERT INTO gestore_accessi_2.utenti
(id_utente, codice_fiscale, nome, cognome, id_azienda, id_utente_inseritore, id_utente_ultimo_aggiornameto, data_inserimeno, data_aggiornamento)
VALUES(nextval('gestore_accessi_2.id_utente_seq'::regclass), '', '', '', 0, 0, 0, '', '');

insert into gestore_accessi_2.utenti 
(id_utente, codice_fiscale, nome, cognome, id_azienda, id_utente_inseritore, id_utente_ultimo_aggiornameto, data_inserimeno, data_aggiornamento)
values(nextval('gestore_accessi_2.id_utente_seq'::regclass), 'ajdlkajdà85ad5aw5', 'Luigi', 'Verdi', 2, 51468,51468, '2024-06-18 18:34:10', '2024-06-18 18:34:10');

insert into gestore_accessi_2.aziende 
(id_azienda, nome_azienda, partita_iva, regione_sociale, descrizione, id_utente_inseritore, data_inserimento, abilitato)
values(nextval('gestore_accessi_2.id_azienda_seq'::regclass), 'Ferrari', 875754692, 'Milano', 'Casa automobilistica italiano', 15324, '2024-06-18', true)
;

insert into gestore_accessi_2.badge
(id_utente, id_badge, data_inserimento, data_aggiornamento, attivo)
values(3, nextval('gestore_accessi_2.id_badge_seq'::regclass), '2024-06-18 18:34:10', '2024-06-18 18:34:10', true)
;

insert into gestore_accessi_2.badge
(id_utente, id_badge, data_inserimento, data_aggiornamento, attivo)
values(4, nextval('gestore_accessi_2.id_badge_seq'::regclass), '2024-06-18 18:34:10', '2024-06-18 18:34:10', true)
;

INSERT INTO gestore_accessi_2.utenti_inseritori
(id_utente_inseritore, nome, cognome, ruolo, abilitato, data_inserimento, data_utimo_aggiornamento)
VALUES(3, 'Mario', 'Rossi', 'Operatore', false, '2024-06-18 18:34:10', '2024-06-18 18:34:10');

INSERT INTO gestore_accessi_2.accessi
(id_badge, ingresso, uscita, data_ingresso, data_uscita, data_inserimento, id_accesso)
VALUES(3, true, false, '2024-06-18 09:34:10', null, '2024-06-18 09:34:10', nextval('gestore_accessi_2.id_accesso_seq'::regclass));

-- FINE INSERIMENTI A DATABASE

-- Creazione della funzione
CREATE OR REPLACE FUNCTION update_valido()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.data_fine_validita IS NOT NULL AND NEW.data_fine_validita < CURRENT_DATE THEN
        NEW.valido := false;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Creazione del trigger
CREATE TRIGGER trigger_update_valido
BEFORE INSERT OR UPDATE ON gestore_accessi_2.aziende
FOR EACH ROW
EXECUTE FUNCTION update_valido();


create trigger update_badge_valido_trg after
update
    on
    gestore_accessi_2.utenti for each row execute function gestore_accessi_2.update_badge_valido()