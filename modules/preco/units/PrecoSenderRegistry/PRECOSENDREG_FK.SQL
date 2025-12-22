/* Блок внешних ключей */
alter table PRECOSENDREG
add
(
-- Ссылка на организации
constraint C_PRECOSENDREG_COMPANY_FK foreign key (COMPANY)
  references COMPANIES(RN),
-- Ссылка на каталоги
constraint C_PRECOSENDREG_CRN_FK foreign key (CRN)
  references ACATALOG(RN)
);
