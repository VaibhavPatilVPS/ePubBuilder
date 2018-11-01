CREATE TABLE Products(
   ID integer,
   Product_Name varchar(200),
   IsActive boolean,
   PRIMARY KEY(ID)
);
INSERT INTO Products VALUES(1,'CopyEditing', true);
INSERT INTO Products VALUES(nextval('Products_Inc'),'Typesetting', true);
create sequence Products_Inc owned by Products.ID;
ALTER TABLE Products ALTER COLUMN ID SET DEFAULT nextval('Products_Inc');
SELECT * from Products;
Delete from Products where Product_Name='Typesetting'


CREATE TABLE Client(
   ID integer,
   Name varchar(200),
   Product_ID integer references Products(ID),
   IsActive boolean,
   PRIMARY KEY(ID)
);
INSERT INTO Client VALUES(nextval('Client_Inc'), 1,'SAGE', 1, true);
INSERT INTO Client VALUES(nextval('Client_Inc'), 2,'VPS', 1, true);
create sequence Client_Inc owned by Client.ID;
ALTER TABLE Client ALTER COLUMN ID SET DEFAULT nextval('Client_Inc');

SELECT * from Client;

CREATE TABLE Login(
   ID bigint,
   Username varchar(100),
   Password varchar(100),
   Client_ID integer references Client(ID),
   IsActive boolean,
   PRIMARY KEY(ID)
);
INSERT INTO Login VALUES(1,'Veera', '1', 2, true);
INSERT INTO Login VALUES(2,'SAGE', 'sage', 1, true);
create sequence Login_Inc1 owned by Login.ID;
ALTER TABLE Login ALTER COLUMN ID SET DEFAULT nextval('Login_Inc');
SELECT client_id, username FROM Login WHERE("username"='Veera' AND "password"='1' AND "isactive"=true);
SELECT * from Login;

CREATE TABLE CE_Group(
   ID integer,
   Group_Name varchar(100),
   Description varchar,
   IsActive boolean,
   PRIMARY KEY(ID)
);

SELECT * from CE_Group;
create sequence CE_Group_Inc owned by CE_Group.ID;
ALTER TABLE CE_Group ALTER COLUMN ID SET DEFAULT nextval('CE_Group_Inc');

CREATE TABLE CE_Module(
   ID integer,
   Module_Code varchar,
   Module_Name varchar,
   Description varchar,
   Group_ID integer references CE_Group(ID),
   IsActive boolean,
   IsGlobal boolean,
   PRIMARY KEY(ID)
);
SELECT * from CE_Module;
create sequence CE_Module_Inc owned by CE_Module.ID;
ALTER TABLE CE_Module ALTER COLUMN ID SET DEFAULT nextval('CE_Module_Inc');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 27-01-2018 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#############################
CREATE TABLE Product(
   ID integer,
   Code varchar,
   Name varchar,
   Remarks varchar,
   IsActive boolean,
   PRIMARY KEY(ID)
);
create sequence Product_Inc owned by Product.ID;
select * from product
INSERT INTO Product VALUES(nextval('Product_Inc'),'VPS-EPFL', 'Epub Fixed Layout', 'Product info', true);
INSERT INTO Product VALUES(nextval('Product_Inc'),'VPS-EPRL', 'Epub Re-Flowable Layout', 'Product info', true);
INSERT INTO Product VALUES(nextval('Product_Inc'),'VPS-PAS', 'PAS System', 'Product info', true);
INSERT INTO Product VALUES(nextval('Product_Inc'),'VPS-ICE', 'iCE Platform', 'Product info', true);
INSERT INTO Product VALUES(nextval('Product_Inc'),'VPS-CONVERSIO', 'Conversion Platform', 'Product info', true);
INSERT INTO Product VALUES(nextval('Product_Inc'),'DUMMY', 'DUMMY', 'Dummy product', true);


CREATE TABLE role(
   ID integer,
   Name varchar,
   Remarks varchar,
   IsActive boolean,
   PRIMARY KEY(ID)
);
create sequence Role_Inc owned by role.ID;


CREATE TABLE vm(
   ID integer,
   Product_ID integer references Product(ID),
   Product_Code varchar,
   path varchar,
   status boolean,
   PRIMARY KEY(ID)
);
drop table vm
create sequence vm_inc owned by vm.ID;
select * from vm
INSERT INTO vm VALUES(nextval('vm_Inc'),6,'VPS-EPFL', '\\0.0.0.0\', 'true');
INSERT INTO vm VALUES(nextval('vm_Inc'),1,'VPS-EPFL', 'k:\', 'true');
INSERT INTO vm VALUES(nextval('vm_Inc'),2,'VPS-EPRL', 'r:\', 'false');
INSERT INTO vm VALUES(nextval('vm_Inc'),3,'VPS-PAS', 'p:\', 'true');
INSERT INTO vm VALUES(nextval('vm_Inc'),5,'VPS-CONVERSIO', 'p:\', 'true');
update vm set product_code='Dummy' where (id=2)

CREATE TABLE company_Product_Role(
   ID integer,
   Client_ID integer references Client(ID),
   Product_ID integer references Product(ID),
   IsActive boolean,
   PRIMARY KEY(ID)
);
create sequence company_Product_Role_Inc owned by company_Product_Role.ID;

insert into company_Product_Role Values(nextval('company_Product_Role_Inc'),1,1,true);
insert into company_Product_Role Values(nextval('company_Product_Role_Inc'),1,2,true);
insert into company_Product_Role Values(nextval('company_Product_Role_Inc'),1,3,true);
insert into company_Product_Role Values(nextval('company_Product_Role_Inc'),1,4,true);
insert into company_Product_Role Values(nextval('company_Product_Role_Inc'),1,5,true);
select * from product
insert into company_Product_Role Values(nextval('company_Product_Role_Inc'),2,1,true);
insert into company_Product_Role Values(nextval('company_Product_Role_Inc'),2,2,true);
insert into company_Product_Role Values(nextval('company_Product_Role_Inc'),2,3,true);
insert into company_Product_Role Values(nextval('company_Product_Role_Inc'),2,4,true);
insert into company_Product_Role Values(nextval('company_Product_Role_Inc'),2,5,true);

select * from company_Product_Role
select * from product
select * from client
select * from job
select * from login


select project.name from login 
INNER JOIN Client on login.id=1 AND login.client_id = client.id AND client.product_id=1 

select product.code, product.id from product 
INNER JOIN company_Product_Role on product.id=company_Product_Role.product_id AND company_Product_Role.isactive='true' AND company_Product_Role.client_id=2

select * from company_Product_Role 
update company_Product_Role set isactive='true' where id=8
update company_Product_Role set isactive='false' where id=8


CREATE TABLE job_epubmate_fl
(
  id bigint,
  job_id character varying NOT NULL,
  job_status character varying,
  pagecount integer,
  file_name character varying,
  input_time timestamp without time zone,
  process_start_time timestamp without time zone,
  output_time timestamp without time zone,
  vm_id serial NOT NULL,
  userid_id bigint references login(ID),
  product_id integer references product(ID),
  isbn character varying,
  input_file_name character varying,
  input_source character varying(50),
  PRIMARY KEY(id)
);

create sequence job_epubmate_fl_Inc owned by job_epubmate_fl.ID;


select * from job_epubmate_fl
Select file_name,isbn,page_count,input_time, output_time, output_file_name from job_epubmate_fl WHERE (user_id=1) ORDER BY id DESC;

select * from job_pagina

CREATE TABLE job_pagina
(
  id bigint NOT NULL,
  job_id character varying NOT NULL,
  status character varying,
  page_count integer,
  file_name character varying,
  input_time timestamp without time zone,
  process_start_time timestamp without time zone,
  output_time timestamp without time zone,
  vm_id serial NOT NULL,
  user_id bigint references login(ID),
  product_id integer references product(ID),
  isbn character varying,
  input_file_name character varying,
  output_file_name character varying,
  input_source character varying(50),
  product_code character varying,
  PRIMARY KEY (id)
);
create sequence job_pagina_Inc owned by job_pagina.ID;

select job_id,status,user_id,file_name,vm_id,product_id,product_code from job_pagina WHERE (status='Queued') union ALL
select job_id,status,user_id,file_name,vm_id,product_id,product_code from job_epubmate_fl WHERE (status='Queued')

select job_id,status,user_id,file_name,vm_id,product_id,product_code,login.username from job_pagina
INNER JOIN login ON job_pagina.user_id = login.id WHERE (status='Queued') UNION ALL
select job_id,status,user_id,file_name,vm_id,product_id,product_code,login.username from job_epubmate_fl
INNER JOIN login ON job_epubmate_fl.user_id = login.id WHERE (status='Queued');

select job_id,status,user_id,file_name,vm_id,product_id,product_code,login.username from job_pagina WHERE (status='Queued') union ALL
select job_id,status,user_id,file_name,vm_id,product_id,product_code,login.username from job_epubmate_fl WHERE (status='Queued');

select project.name from login INNER JOIN Client on login.id=1 AND login.client_id = client.id AND client.product_id=1 INNER JOIN  project on project.client_id =login.client_id


select * from job_pagina
update job_pagina set status='INPUT-ERROR'

select login.username from login INNER JOIN job_epubmate_fl ON login.id=job_epubmate_fl.user_id where(job_id='20180129174745024')
update vm set status=true where id=(select vm_id from job_epubmate_fl where job_id = '20180129174745024')

update job_epubmate_fl set status='WIP', input_time='2018-01-30 12:12:12' where job_id='20180129174745024';
update job_epubmate_fl set status='DONE', output_time='2018-01-30 12:12:12', file_name='c:\wwwww.zip' where job_id='20180129174745024';

UPDATE vm SET status='false' FROM job_epubmate_fl WHERE job_epubmate_fl.job_id='20180129174745024' and job_epubmate_fl.vm_id=vm.id;
update job_epubmate_fl set status='VM-MAP-ERROR' where job_id='20180129174745024';
update vm set status=false where id=(select vm_id from job_epubmate_fl where job_id = '20180129174745024');
update job_epubmate_fl set status='INPUT-ERROR' where job_id = '20180129174745024';
update vm set status=false where id=3
select id, path from vm where(product_code='VPS-EPFL' and status='false' and id != 1);
update job_epubmate_fl set vm_id=1 where (job_id='20180130145921145')

select login.username from login INNER JOIN job_epubmate_fl ON login.id=job_epubmate_fl.user_id where(job_id='20180130145921145');
select product.code, product.id from product INNER JOIN company_Product_Role on product.id=company_Product_Role.product_id AND company_Product_Role.isactive='true' AND company_Product_Role.client_id=1;

select job_id,status,user_id,file_name,vm_id,product_id,product_code,login.username from job_pagina
INNER JOIN login ON job_pagina.user_id = login.id WHERE (status='Queued') UNION ALL
select job_id,status,user_id,file_name,vm_id,product_id,product_code,login.username from job_epubmate_fl
INNER JOIN login ON job_epubmate_fl.user_id = login.id WHERE (status='Queued') UNION ALL
select job_id,status,user_id,file_name,vm_id,product_id,product_code,login.username from job_conversio
INNER JOIN login ON job_conversio.user_id = login.id WHERE (status='Queued');


select * from job_conversio
truncate table job_epubmate_fl

CREATE TABLE job_conversio
(
  id bigint NOT NULL,
  job_id character varying NOT NULL,
  status character varying,
  page_count integer,
  file_name character varying,
  input_time timestamp without time zone,
  process_start_time timestamp without time zone,
  output_time timestamp without time zone,
  vm_id serial NOT NULL,
  user_id bigint references login(ID),
  product_id integer references product(ID),
  isbn character varying,
  input_file_name character varying,
  output_file_name character varying,
  input_source character varying(50),
  product_code character varying,
  PRIMARY KEY (id)
 );
 
create sequence job_conversio_Inc owned by job_conversio.ID;

select * from job_epubmate_fl
select * from job_pagina
select * from job_conversio


update job_epubmate_fl set status='INPUT-ERROR'
select * from vm
select * from product
select * from company_product_role
select * from client
select * from job_pagina
select * from job_pagina

update vm set id=1 where id=2
select * from vm order by id

select id, path from vm where(product_code='VPS-PAS' and status='false' and id != 1);

update vm set status='true' where id=5;

///////////////%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#############################
select * from job_pdf2word
update job_pdf2word set status='error'








CREATE TABLE job_pdf2word
(
  id bigint NOT NULL,
  job_id character varying NOT NULL,
  status character varying,
  page_count integer,
  file_name character varying,
  input_time timestamp without time zone,
  process_start_time timestamp without time zone,
  output_time timestamp without time zone,
  vm_id serial NOT NULL,
  user_id bigint references login(ID),
  product_id integer references product(ID),
  isbn character varying,
  input_file_name character varying,
  output_file_name character varying,
  input_source character varying(50),
  product_code character varying,
  PRIMARY KEY (id)
 );
 
create sequence job_pdf2word_Inc owned by job_pdf2word.ID;

select * from product



















CREATE TABLE Reference_Style(
   ID integer,
   Ref_Name varchar,
   Description varchar,
   IsActive boolean,
   PRIMARY KEY(ID)
);
SELECT * from Reference_Style;
create sequence Reference_Style_Inc owned by Reference_Style.ID;
ALTER TABLE Reference_Style ALTER COLUMN ID SET DEFAULT nextval('Reference_Style_Inc');
INSERT INTO Reference_Style VALUES(1,'None','As in Manuscript', true);
INSERT INTO Reference_Style VALUES(2,'APA','APA - American Psychological Association reference style', true);
INSERT INTO Reference_Style VALUES(3,'APS','APS - American Physical Society reference style', true);
INSERT INTO Reference_Style VALUES(4,'MPS','MPS - Mathematical and Physical Sciences reference style', true);
INSERT INTO Reference_Style VALUES(5,'Chemistry','Chemistry reference style', true);
INSERT INTO Reference_Style VALUES(6,'Chicago','Chicago reference style', true);
INSERT INTO Reference_Style VALUES(7,'Vancouver','Vancouver reference style', true);
SELECT * FROM Reference_Style;

CREATE TABLE Project(
   ID integer,
   Name varchar,
   Client_ID integer references Client(ID),
   IsActive boolean,
   PRIMARY KEY(ID)
);
SELECT * from Project;
INSERT INTO Project VALUES(nextval('Project_Inc'),'TEST_CE', 1, true);
INSERT INTO Project VALUES(nextval('Project_Inc'),'TEST_PRO1', 1, true);
create sequence Project_Inc owned by Project.ID;
ALTER TABLE Project ALTER COLUMN ID SET DEFAULT nextval('Project_Inc');

CREATE TABLE Project_Modules_Mapping(
   ID integer,
   Project_ID integer references Project(ID),
   Module_ID integer,
   Reference_Style_ID integer references Reference_Style(ID),
   IsActive boolean,
   PRIMARY KEY(ID)
);
SELECT * from Project_Modules_Mapping;
create sequence Project_Modules_Mapping_Inc owned by Project_Modules_Mapping.ID;
ALTER TABLE Project_Modules_Mapping ALTER COLUMN ID SET DEFAULT nextval('Project_Modules_Mapping_Inc');

CREATE TABLE Job(
   ID bigint,
   User_ID int,
   UPR_ID int,
   VM_ID int,
   Status varchar,
   Page_Count int,
   Word_Count bigint,
   Input_File_Name varchar,
   Output_File_Name varchar,
   Input_Time timestamp,
   Process_Start_Time timestamp,
   Output_Time timestamp,
   PRIMARY KEY(ID)
);


select * from job
select * from client
select * from products
select * from project

select * from login


select project.name from login INNER JOIN Client on  login.id=1 AND login.client_id = client.id AND client.product_id=1 INNER JOIN  project on project.client_id =login.client_id

select project.name from login 
INNER JOIN Client on login.id=1 AND login.client_id = client.id AND client.product_id=1 
INNER JOIN  project on project.client_id =login.client_id



select id,username from login where client_id=(SELECT client_id FROM login WHERE id = 1);

select * from job where user_id=1

select * from job where user_id=1 AND upr_id=1

select * from ce_group
INSERT INTO ce_group VALUES(nextval('ce_group_Inc'),'General Cleanup', 'Clean all general cleanup within document', true);
INSERT INTO ce_group VALUES(nextval('ce_group_Inc'),'SI Unit Cleanup', 'SI Unit cleanup within document', true);
INSERT INTO ce_group VALUES(nextval('ce_group_Inc'),'General Replacement', 'General replacement within document', true);
INSERT INTO ce_group VALUES(nextval('ce_group_Inc'),'Cross Linking', 'Cross Linking within document', true);
INSERT INTO ce_group VALUES(nextval('ce_group_Inc'),'Abbreviation', 'Abbreviation replacement within document', true);
INSERT INTO ce_group VALUES(nextval('ce_group_Inc'),'Reference Styling and Structuring', 'Reference Styling and Structuring within document', true);

select ce_group.id, ce_group.group_name, ce_module.module_code, ce_module.module_name, 
ce_module.group_id from ce_group INNER JOIN ce_module 
ON ce_group.isactive=true

select module_code, module_name from ce_module where group_id=(SELECT id FROM ce_group WHERE isactive=true);

select * from ce_module
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g1_1', 'Replacing double periods with single period at the end of paragraph/Within text', 'Replacing double periods with single period at the end of paragraph/Within text', 1, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g1_2', 'Inserting space after comma when preceded and followed by text', 'Inserting space after comma when preceded and followed by text', 1, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g1_3', 'Remove unwanted page break', 'Remove unwanted page break', 1, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g1_4', 'Remove unwanted section break', 'Remove unwanted section break', 1, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g1_5', 'Remove dot followed by Tab Marks', 'Remove dot followed by Tab Marks', 1, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g1_6', 'Remove Tab Marks', 'Remove Tab Marks', 1, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g1_7', 'Remove column break', 'Remove column break', 1, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g1_8', 'Remove space(s) after opening parenthesis', 'Remove space(s) after opening parenthesis', 1, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g1_9', 'Remove space(s) before closing parenthesis', 'Remove space(s) before closing parenthesis', 1, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g1_10', 'Remove space(s) before period', 'Remove space(s) before period', 1, true, true);

INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g2_1', 'Inserting non-breaking space in the place of word space between number and unit Å (Ångström)', 'Inserting non-breaking space in the place of word space between number and unit Å (Ångström)', 2, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g2_2', 'Inserting non-breaking space between number and unit Å (Ångström)', 'Inserting non-breaking space between number and unit Å (Ångström)', 2, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g2_3', 'Inserting non-breaking space in the place of word space between number and unit µA (microampere)', 'Inserting non-breaking space in the place of word space between number and unit µA (microampere)', 2, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g2_4', 'Inserting non-breaking space between number and unit µA (microampere)', 'Inserting non-breaking space between number and unit µA (microampere)', 2, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g2_5', 'Inserting non-breaking space in the place of word space between number and unit µCi (microcurie)', 'Inserting non-breaking space in the place of word space between number and unit µCi (microcurie)', 2, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g2_6', 'Inserting non-breaking space between number and unit µCi (microcurie)', 'Inserting non-breaking space between number and unit µCi (microcurie)', 2, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g2_7', 'Inserting non-breaking space in the place of word space between number and unit µJ (microjoule)', 'Inserting non-breaking space in the place of word space between number and unit µJ (microjoule)', 2, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g2_8', 'Inserting non-breaking space between number and unit µJ (microjoule)', 'Inserting non-breaking space between number and unit µJ (microjoule)', 2, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g2_9', 'Inserting non-breaking space in the place of word space between number and unit µM (micromole)', 'Inserting non-breaking space in the place of word space between number and unit µM (micromole)', 2, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g2_10', 'Inserting non-breaking space between number and unit µM (micromole)', 'Inserting non-breaking space between number and unit µM (micromole)', 2, true, true);

INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g3_1', 'Replacing hyphen (with space both side) with en dash (with space both side)', 'Replacing hyphen (with space both side) with en dash (with space both side)', 3, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g3_2', 'Replacing three consecutive dots with ellipsis (...)', 'Replacing three consecutive dots with ellipsis (...)', 3, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g3_3', 'Replacing single hyphen between page range/number range with en dash', 'Replacing single hyphen between page range/number range with en dash', 3, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g3_4', 'Replacing single hyphen between two spaces inside page range/number range with en dash', 'Replacing single hyphen between two spaces inside page range/number range with en dash', 3, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g3_5', 'Replacing two hyphens with en dash', 'Replacing two hyphens with en dash', 3, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g3_6', 'Replacing three hyphens with em dash', 'Replacing three hyphens with em dash', 3, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g3_7', 'Replacing multiple space(s) with single space', 'Replacing multiple space(s) with single space', 3, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g3_8', 'Replacing  superscript copyright symbol © with inline symbol', 'Replacing  superscript copyright symbol © with inline symbol', 3, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g3_9', 'Replacing  subscript/superscript register ® symbol with inline symbol', 'Replacing  subscript/superscript register ® symbol with inline symbol', 3, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g3_10', 'Replacing  subscript/superscript trademark symbol ™ with inline symbol', 'Replacing  subscript/superscript trademark symbol ™ with inline symbol', 3, true, true);

INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g4_1', 'Replacing word space between Sect. and Sect. number with nonbreaking space', 'Replacing word space between Sect. and Sect. number with nonbreaking space', 4, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g4_2', 'Replacing word space between S. and S. number with nonbreaking space', 'Replacing word space between S. and S. number with nonbreaking space', 4, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g4_3', 'Replacing word space between Figs. and Figs. number with nonbreaking space', 'Replacing word space between Figs. and Figs. number with nonbreaking space', 4, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g4_4', 'Replacing word space between Fig. and Fig. number with nonbreaking space', 'Replacing word space between Fig. and Fig. number with nonbreaking space', 4, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g4_5', 'Replacing word space between Eqs. and Eqs. number with nonbreaking space', 'Replacing word space between Eqs. and Eqs. number with nonbreaking space', 4, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g4_6', 'Replacing word space between Eq. and Eq. number with nonbreaking space', 'Replacing word space between Eq. and Eq. number with nonbreaking space', 4, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g4_7', 'Replacing word space between Figures with Figs. number with nonbreaking space', 'Replacing word space between Figures with Figs. number with nonbreaking space', 4, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g4_8', 'Replacing word space between Figure with Fig. number with nonbreaking space', 'Replacing word space between Figure with Fig. number with nonbreaking space', 4, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g4_9', 'Replacing word space between figure with Fig. number with nonbreaking space', 'Replacing word space between figure with Fig. number with nonbreaking space', 4, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g4_10', 'Replacing word space between Figure with Figure number with nonbreaking space', 'Replacing word space between Figure with Figure number with nonbreaking space', 4, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g4_11', 'Replacing word space between Table with Tab. number with nonbreaking space', 'Replacing word space between Table with Tab. number with nonbreaking space', 4, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g4_12', 'Replacing word space between table with Tab. number with nonbreaking space', 'Replacing word space between table with Tab. number with nonbreaking space', 4, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g4_13', 'Replacing word space between Chaps. and number with nonbreaking space', 'Replacing word space between Chaps. and number with nonbreaking space', 4, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g4_14', 'Replacing word space between Chap. and number with nonbreaking space', 'Replacing word space between Chap. and number with nonbreaking space', 4, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g4_15', 'Replacing word space between Section and number with nonbreaking space', 'Replacing word space between Section and number with nonbreaking space', 4, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g4_16', 'Replacing blank space between Sections and number with nonbreaking space', 'Replacing blank space between Sections and number with nonbreaking space', 4, true, true);

INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_1', 'Replacing unit meter with its standard abbreviation m', 'Replacing unit meter with its standard abbreviation m', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_2', 'Replacing unit kilogram with its standard abbreviation kg', 'Replacing unit kilogram with its standard abbreviation kg', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_3', 'Replacing unit kilometer with its standard abbreviation km', 'Replacing unit kilometer with its standard abbreviation km', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_4', 'Replacing unit second with its standard abbreviation s', 'Replacing unit second with its standard abbreviation s', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_5', 'Replacing unit ampere with its standard abbreviation A', 'Replacing unit ampere with its standard abbreviation A', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_6', 'Replacing unit kelvin with its standard abbreviation K', 'Replacing unit kelvin with its standard abbreviation K', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_7', 'Replacing unit mole with its standard abbreviation mol', 'Replacing unit mole with its standard abbreviation mol', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_8', 'Replacing unit candela with its standard abbreviation cd', 'Replacing unit candela with its standard abbreviation cd', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_9', 'Replacing unit radian with its standard abbreviation rad', 'Replacing unit radian with its standard abbreviation rad', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_10', 'Replacing unit steradian with its standard abbreviation sr', 'Replacing unit steradian with its standard abbreviation sr', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_11', 'Replacing unit hertz with its standard abbreviation Hz', 'Replacing unit hertz with its standard abbreviation Hz', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_12', 'Replacing unit newton with its standard abbreviation N', 'Replacing unit newton with its standard abbreviation N', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_13', 'Replacing unit pascal with its standard abbreviation Pa', 'Replacing unit pascal with its standard abbreviation Pa', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_14', 'Replacing unit joule with its standard abbreviation J', 'Replacing unit joule with its standard abbreviation J', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_15', 'Replacing unit watt with its standard abbreviation W', 'Replacing unit watt with its standard abbreviation W', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_16', 'Replacing unit coulomb with its standard abbreviation C', 'Replacing unit coulomb with its standard abbreviation C', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_17', 'Replacing unit volt with its standard abbreviation V', 'Replacing unit volt with its standard abbreviation V', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_18', 'Replacing unit farad with its standard abbreviation F', 'Replacing unit farad with its standard abbreviation F', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_19', 'Replacing unit siemens with its standard abbreviation S', 'Replacing unit siemens with its standard abbreviation S', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_20', 'Replacing unit weber with its standard abbreviation Wb', 'Replacing unit weber with its standard abbreviation Wb', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_21', 'Replacing unit tesla with its standard abbreviation T', 'Replacing unit tesla with its standard abbreviation T', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_22', 'Replacing unit henry with its standard abbreviation H', 'Replacing unit henry with its standard abbreviation H', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_23', 'Replacing unit degree Celcius with its standard abbreviation C', 'Replacing unit degree Celcius with its standard abbreviation C', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_24', 'Replacing unit degree Fahrenheit with its standard abbreviation F', 'Replacing unit degree Fahrenheit with its standard abbreviation F', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_25', 'Replacing unit lumen with its standard abbreviation lm', 'Replacing unit lumen with its standard abbreviation lm', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_26', 'Replacing unit lux with its standard abbreviation lx', 'Replacing unit lux with its standard abbreviation lx', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_27', 'Replacing unit becquerel with its standard abbreviation Bq', 'Replacing unit becquerel with its standard abbreviation Bq', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_28', 'Replacing unit gray with its standard abbreviation Gy', 'Replacing unit gray with its standard abbreviation Gy', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_29', 'Replacing unit sievert with its standard abbreviation Sv', 'Replacing unit sievert with its standard abbreviation Sv', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_30', 'Replacing unit katal with its standard abbreviation kat', 'Replacing unit katal with its standard abbreviation kat', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_31', 'Replacing unit meter with its standard abbreviation m', 'Replacing unit meter with its standard abbreviation m', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_32', 'Replacing the term meter with its standard abbreviation m (meter)', 'Replacing the term meter with its standard abbreviation m (meter)', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_33', 'Replacing  Gln. with Gleichungen at the start of paragraph', 'Replacing  Gln. with Gleichungen at the start of paragraph', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_34', 'Replacing unit microgram with its standard abbreviation µg', 'Replacing unit microgram with its standard abbreviation µg', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_35', 'Replacing unit mikrogram with its standard abbreviation µg', 'Replacing unit mikrogram with its standard abbreviation µg', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_36', 'Replacing unit microliter with its standard abbreviation µl', 'Replacing unit microliter with its standard abbreviation µl', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_37', 'Replacing unit mikroliter with its standard abbreviation µl', 'Replacing unit mikroliter with its standard abbreviation µl', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_38', 'Replacing unit microlitre with its standard abbreviation µl', 'Replacing unit microlitre with its standard abbreviation µl', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_39', 'Replacing unit mikrolitre with its standard abbreviation µl', 'Replacing unit mikrolitre with its standard abbreviation µl', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_40', 'Replacing unit microgram with its standard abbreviation µg', 'Replacing unit microgram with its standard abbreviation µg', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_41', 'Replacing unit mikrogram with its standard abbreviation µg', 'Replacing unit mikrogram with its standard abbreviation µg', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_42', 'Replacing unit microliter with its standard abbreviation µl', 'Replacing unit microliter with its standard abbreviation µl', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_43', 'Replacing unit mikroliter with its standard abbreviation µl', 'Replacing unit mikroliter with its standard abbreviation µl', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_44', 'Replacing unit microlitre with its standard abbreviation µl', 'Replacing unit microlitre with its standard abbreviation µl', 5, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g5_45', 'Replacing unit mikrolitre with its standard abbreviation µl', 'Replacing unit mikrolitre with its standard abbreviation µl', 5, true, true);

INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g6_1', 'None', 'As in Manuscript', 6, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g6_2', 'APA', 'APA - American Psychological Association reference style', 6, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g6_3', 'APS', 'APS - American Physical Society reference style', 6, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g6_4', 'MPS', 'MPS - Mathematical and Physical Sciences reference style', 6, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g6_5', 'Chemistry', 'Chemistry reference style', 6, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g6_6', 'Chicago', 'Chicago reference style', 6, true, true);
INSERT INTO ce_module VALUES(nextval('ce_module_Inc'), 'g6_7', 'Vancouver', 'Vancouver reference style', 6, true, true);


select id,group_name from ce_group where isactive = true
select module_code,module_name,group_id from ce_module where isactive = 'true' ORDER BY group_id ASC


select ce_module.module_name from ce_module INNER JOIN ce_group ON ce_group.isActive=true and  ce_group.id=ce_module.group_id 
select ce_module.module_name,ce_module.module_code,ce_group.id, ce_group.group_name from ce_module INNER JOIN ce_group ON ce_group.id=ce_module.group_id AND ce_group.isActive=true ORDER BY ce_group.id ASC
select ce_module.module_code,ce_group.id, ce_group.group_name, ce_module.module_name from ce_module INNER JOIN ce_group ON ce_group.id=ce_module.group_id AND ce_group.isActive=true ORDER BY ce_group.id ASC

update ce_group set isactive=false where id=3


select * from ce_module where group_id=(SELECT id FROM ce_group WHERE isactive=true and id=1 );
select module_code from project_modules_mapping WHERE(project_id=0 AND client_id=1)
select * from project_modules_mapping
truncate table project_modules_mapping


select * from project_modules_mapping where project_id=1

select * from project
SELECT project.name from login INNER JOIN Client on login.id=1 AND login.client_id = client.id AND client.product_id=1 INNER JOIN project on project.client_id = login.client_id;

select project_id, module_code from project_modules_mapping where (client_id = 1 AND (project_id=0 OR project_id=1) AND isactive='true')
select * from project_modules_mapping where (client_id = 1 AND project_id=1 AND isactive='true')
select * from project_modules_mapping where (client_id = 1 AND project_id=0 AND isactive='true')


