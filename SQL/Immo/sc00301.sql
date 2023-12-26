ALTER TABLE DADCASAS
ADD DC_HOMEOFFICE CHAR(1);

ALTER TABLE DADAPTOS
ADD DA_HOMEOFFICE CHAR(1);

ALTER TABLE DADLOJAS
ADD DL_HOMEOFFICE CHAR(1);

ALTER TABLE DADSALAS
ADD DS_HOMEOFFICE CHAR(1);

update dadcasas set dc_homeoffice = 'N';
update dadaptos set da_homeoffice = 'N';
update dadlojas set dl_homeoffice = 'N';
update dadsalas set ds_homeoffice = 'N';






