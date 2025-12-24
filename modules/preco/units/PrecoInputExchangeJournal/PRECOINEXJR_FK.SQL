/* Блок внешних ключей */
alter table PRECOINEXJR
add
(
-- Ссылка на контрагенты
constraint C_PRECOINEXJR_AGENT_FK foreign key (AGENT)
  references AGNLIST(RN),
-- Ссылка на организации
constraint C_PRECOINEXJR_COMPANY_FK foreign key (COMPANY)
  references COMPANIES(RN),
-- Ссылка на каталоги
constraint C_PRECOINEXJR_CRN_FK foreign key (CRN)
  references ACATALOG(RN),
-- Ссылка на реестр отправителей
constraint C_PRECOINEXJR_PRECOSENDREG_FK foreign key (PRECOSENDREG)
  references PRECOSENDREG(RN)
);
