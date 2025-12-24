/* Блок внешних ключей */
alter table PRECOINEXJRHST
add
(
-- Ссылка на организации
constraint C_PRECOINEXJRHST_COMPANY_FK foreign key (COMPANY)
  references COMPANIES(RN),
-- Ссылка на каталоги
constraint C_PRECOINEXJRHST_CRN_FK foreign key (CRN)
  references ACATALOG(RN),
-- Ссылка на родителя
constraint C_PRECOINEXJRHST_PRN_FK foreign key (PRN)
  references PRECOINEXJR(RN) on delete cascade
);
