-- $Id: install130.sql $
CREATE TABLE telcall (
	id integer DEFAULT nextval('id'::text) NOT NULL,
	cause text,
	caller_id integer NOT NULL,
	calldate timestamp without time zone NOT NULL,
	c_long text,
	employee integer,
	kontakt character(1),
	bezug integer,
	dokument integer);
	
CREATE TABLE documents (
	filename text,
	descript text,
	datum date,
	size integer,
	employee integer,
	id integer DEFAULT nextval('id'::text),
	kunde integer);
	
CREATE TABLE wiedervorlage (
	id integer DEFAULT nextval('id'::text) NOT NULL,
	initdate timestamp without time zone NOT NULL,
	changedate timestamp without time zone,
	finishdate timestamp without time zone,
	cause character varying(60),
	descript text,
	document integer,
	status character(1),
	kontakt character(1),
	employee integer,
	initemployee integer,
	kontaktid integer,
	kontakttab character(1),
	tellid integer);
	
CREATE TABLE documenttotc (
	id integer DEFAULT nextval('id'::text),
	telcall integer,
	documents integer);
	
CREATE TABLE telnr (
	id integer,
	tabelle character(1),
	nummer character varying(20));
	
CREATE TABLE docvorlage (
	docid integer DEFAULT nextval('id'::text) NOT NULL,
	vorlage character varying(60),
	beschreibung character varying(255),
	file character varying(40),
	applikation character(1));
	
CREATE TABLE docfelder (
	fid integer DEFAULT nextval('id'::text) NOT NULL,
	docid   integer,
	feldname    character varying(20),
	platzhalter character varying(20),
	beschreibung character varying(200),
	laenge  integer,
	zeichen character varying(20),
	position    integer);
	
CREATE TABLE gruppenname (
	grpid  integer DEFAULT nextval('id'::text) NOT NULL,
	grpname  character varying(40),
	rechte       char(1) DEFAULT 'w');
	
CREATE TABLE grpusr (
	gid  integer DEFAULT nextval('id'::text) NOT NULL,
	grpid integer,
	usrid integer);
	
CREATE TABLE termine (
	id integer DEFAULT nextval('id'::text) NOT NULL,
	cause character varying(25),
	c_cause text,
	start timestamp without time zone,
	stop timestamp without time zone,
	repeat integer,
	ft char(1),
	starttag char(10),
	stoptag char(10),
	startzeit char(5),
	stopzeit char(5),
	uid integer);
	
CREATE TABLE terminmember (
	termin integer,
	member integer,
	tabelle char(1));
	
CREATE TABLE termdate (
	id integer DEFAULT nextval('id'::text) NOT NULL,
	termid integer,
	datum integer,
	jahr integer,
	kw integer,
	tag character(2),
	monat character(2));

CREATE TABLE custmsg (
	id integer DEFAULT nextval('id'::text) NOT NULL,
	fid integer,
	prio integer DEFAULT 3,
	msg char varying(60),
	uid integer,
	akt boolean);
	
CREATE TABLE crm (
	id integer DEFAULT nextval('id'::text) NOT NULL,
	uid integer,
	datum timestamp without time zone,
	version char(5));
	
CREATE TABLE labels (
	id integer DEFAULT nextval('id'::text),
	name char varying(32),
	cust char(1),
	papersize char varying(10),
	metric char(2),
	marginleft double precision,
	margintop double precision,
	nx integer,
	ny integer,
	spacex double precision,
	spacey double precision,
	width double precision,
	height double precision,
	fontsize integer,
	employee integer);
	
INSERT INTO labels (name, cust, papersize, metric, marginleft, margintop, nx, ny, spacex, spacey, width, height, fontsize, employee) 
VALUES ('Firma', 'C', 'A4', 'mm', 2, 2, 2, 3, 4, 2, 66, 38, 10, NULL);


CREATE TABLE labeltxt (
	id integer DEFAULT nextval('id'::text),
	lid integer,
	font integer,
	zeile text);

INSERT INTO labeltxt (lid, font, zeile) VALUES ((select id from labels limit 1), 6, '');
INSERT INTO labeltxt (lid, font, zeile) VALUES ((select id from labels limit 1), 8, 'Lx-Office, �berholspur 1, 12345 Woanders');
INSERT INTO labeltxt (lid, font, zeile) VALUES ((select id from labels limit 1), 6, '');
INSERT INTO labeltxt (lid, font, zeile) VALUES ((select id from labels limit 1), 10, '%ANREDE%');
INSERT INTO labeltxt (lid, font, zeile) VALUES ((select id from labels limit 1), 10, '%NAME1% %NAME2%');
INSERT INTO labeltxt (lid, font, zeile) VALUES ((select id from labels limit 1), 10, '!%KONTAKT%|%DEPARTMENT%');
INSERT INTO labeltxt (lid, font, zeile) VALUES ((select id from labels limit 1), 10, '%STRASSE%');
INSERT INTO labeltxt (lid, font, zeile) VALUES ((select id from labels limit 1), 8, '');
INSERT INTO labeltxt (lid, font, zeile) VALUES ((select id from labels limit 1), 10,'%PLZ% %ORT%');

CREATE TABLE  contmasch(
	mid integer,
	cid integer);	
	
CREATE TABLE history (
	mid integer,
	datum date,
	art character varying(20),
	beschreibung text);
	
CREATE TABLE repauftrag (
	aid integer,
	mid integer,
	cause text,
	schaden text,
	reparatur text,
	bearbdate timestamp without time zone,
	employee integer,
	bearbeiter integer,
	anlagedatum timestamp without time zone,
	status integer,
	kdnr integer,
	counter bigint);
	
CREATE TABLE  maschmat (
	mid integer,
	aid integer,
	parts_id integer,
	betrag numeric(15,5),
	menge numeric(10,3));
	
CREATE TABLE contract (
	cid integer DEFAULT nextval('id'::text),
	contractnumber text,
	template text,
	bemerkung text,
	customer_id integer,
	anfangdatum date,
	betrag numeric(15,5),
	endedatum date);
	
CREATE TABLE maschine (
	id integer DEFAULT nextval('id'::text),
	parts_id integer,
	serialnumber text,
	standort text,
	inspdatum DATE,
	counter BIGINT);

CREATE TABLE wissencategorie(
	id integer DEFAULT nextval('id'::text) NOT NULL,
	name character varying(60),
	hauptgruppe integer
);

CREATE TABLE leads(
	id integer DEFAULT nextval('id'::text) NOT NULL,
	lead character varying(50)
);

CREATE TABLE wissencontent(
	id integer DEFAULT nextval('id'::text) NOT NULL,
	initdate timestamp without time zone NOT NULL,
	content text,
	employee integer,
	version integer,
	categorie integer
);

CREATE TABLE opportunity(
	id integer DEFAULT nextval('id'::text) NOT NULL,
	fid integer,
	title character varying(100),
	betrag numeric (15,5),
	zieldatum date,
	chance integer,
	status integer,
	notiz text,
	itime timestamp DEFAULT now(),
	mtime timestamp,
	iemployee integer,
	memployee integer
);

CREATE TABLE postit (
	id integer DEFAULT nextval('id'::text) NOT NULL,
	cause character varying(100),
	notes text,
	employee integer,
	date timestamp without time zone NOT NULL
);

CREATE TABLE tempcsvdata (
	uid  integer,
	csvdaten text
);

ALTER TABLE customer ADD COLUMN owener int4;
ALTER TABLE customer ADD COLUMN employee int4;
ALTER TABLE customer ADD COLUMN sw character varying(50);
ALTER TABLE customer ADD COLUMN branche character varying(25);
ALTER TABLE customer ADD COLUMN grafik character varying(4);
ALTER TABLE customer ADD COLUMN typ int4;
ALTER TABLE customer ADD COLUMN sonder int;
ALTER TABLE customer ADD COLUMN lead integer;
ALTER TABLE customer ADD COLUMN leadsrc character varying(15);
ALTER TABLE vendor ADD COLUMN owener int4;
ALTER TABLE vendor ADD COLUMN employee int4;
ALTER TABLE vendor ADD COLUMN kundennummer character varying(20);
ALTER TABLE vendor ADD COLUMN sw character varying(50);
ALTER TABLE vendor ADD COLUMN branche character varying(25);
ALTER TABLE vendor ADD COLUMN grafik character varying(5);
ALTER TABLE vendor ADD COLUMN typ int4;
ALTER TABLE vendor ADD COLUMN sonder int;
ALTER TABLE shipto ADD COLUMN shiptoowener int4;
ALTER TABLE shipto ADD COLUMN shiptoemployee int4;
ALTER TABLE employee ADD COLUMN pwd char varying(12);
ALTER TABLE employee ADD COLUMN msrv character varying(40);
ALTER TABLE employee ADD COLUMN postf character varying(25);
ALTER TABLE employee ADD COLUMN kennw character varying(10);
ALTER TABLE employee ADD COLUMN postf2 character varying(25);
ALTER TABLE employee ADD COLUMN abteilung character varying(20);
ALTER TABLE employee ADD COLUMN position character varying(20);
ALTER TABLE employee ADD COLUMN interv int4;
ALTER TABLE employee ADD COLUMN pre character varying(5);
ALTER TABLE employee ADD COLUMN vertreter int4;
ALTER TABLE employee ADD COLUMN mailsign text;
ALTER TABLE employee ADD COLUMN email character varying(50);
ALTER TABLE employee ADD COLUMN etikett int4;
ALTER TABLE employee ADD COLUMN status integer;
ALTER TABLE employee ADD COLUMN countrycode char (2);
ALTER TABLE employee ALTER countrycode SET DEFAULT 'de';
ALTER TABLE employee ADD COLUMN termbegin integer;
ALTER TABLE employee ADD COLUMN termend integer;
ALTER TABLE employee ADD COLUMN kdview integer;
ALTER TABLE employee alter COLUMN kdview SET DEFAULT 1;
ALTER TABLE contacts ADD COLUMN cp_street character varying(75);
ALTER TABLE contacts ADD COLUMN cp_zipcode character varying(10);
ALTER TABLE contacts ADD COLUMN cp_city character varying(75);
ALTER TABLE contacts ADD COLUMN cp_fax character varying(30);
ALTER TABLE contacts ADD COLUMN cp_homepage text;
ALTER TABLE contacts ADD COLUMN cp_notes text;
ALTER TABLE contacts ADD COLUMN cp_beziehung integer;
ALTER TABLE contacts ADD COLUMN cp_firma integer;
ALTER TABLE contacts ADD COLUMN cp_sonder integer;
ALTER TABLE contacts ADD COLUMN cp_abteilung character varying(25);
ALTER TABLE contacts ADD COLUMN cp_position character varying(25);
ALTER TABLE contacts ADD COLUMN cp_stichwort1 character varying(50);
ALTER TABLE contacts ADD COLUMN cp_gebdatum character varying(10);
ALTER TABLE contacts ADD COLUMN cp_owener integer;
ALTER TABLE contacts ADD COLUMN cp_employee integer;
ALTER TABLE contacts ADD COLUMN cp_grafik char varying(5);
ALTER TABLE contacts ADD COLUMN cp_country char varying(3);
ALTER TABLE defaults ADD COLUMN contnumber text;

UPDATE employee SET countrycode='de';
UPDATE employee set etikett=(select id from labels limit 1);
UPDATE defaults SET contnumber=1000;
UPDATE employee SET kdview = 1;

INSERT INTO crm (uid,datum,version) VALUES (0,now(),'1.3.0');

CREATE INDEX td_termin_key ON termdate USING btree (termid);
CREATE INDEX td_jahr_key ON termdate USING btree (jahr);
CREATE INDEX td_monat_key ON termdate USING btree (monat);
CREATE INDEX td_tag_key ON termdate USING btree (tag);
CREATE INDEX t_starttag_key ON termine USING btree (starttag);
CREATE INDEX t_stoptag_key ON termine USING btree (stoptag);
CREATE INDEX t_stopzeit_key ON termine USING btree (stopzeit);
CREATE INDEX t_startzeit_key ON termine USING btree (startzeit);
CREATE INDEX t_termin_key ON termine USING btree (id);
CREATE INDEX tm_member_key ON terminmember USING btree (member);
CREATE INDEX tm_termin_key ON terminmember USING btree (termin);
CREATE INDEX contacts_id_key ON contacts USING btree (cp_id);
CREATE INDEX contacts_name_key ON contacts USING btree (cp_name);
CREATE INDEX contacts_firma_key ON contacts USING btree (cp_firma);
CREATE INDEX telcall_id_key ON telcall USING btree (id);
CREATE INDEX telcall_bezug_key ON telcall USING btree (bezug);
CREATE INDEX mid_key ON contmasch USING btree (mid);