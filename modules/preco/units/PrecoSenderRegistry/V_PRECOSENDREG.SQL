/* ПРЕКО. Платформа сбора первичной отчётности. Реестр отправителей */
create or replace view V_PRECOSENDREG
(
  nRN,                                  -- Регистрационный номер
  nCOMPANY,                             -- Организация
  nCRN,                                 -- Каталог
  sCODE,                                -- Код
  sNAME,                                -- Наименование
  nSYSTEM,                              -- Система
  nIS_ACTIVE,                           -- Активен
  dCREATED,                             -- Дата создания
  dUPDATED                              -- Дата модификации
)
as
select
  T.RN,                                 -- nRN
  T.COMPANY,                            -- nCOMPANY
  T.CRN,                                -- nCRN
  T.CODE,                               -- sCODE
  T.NAME,                               -- sNAME
  T.SYSTEM,                             -- nSYSTEM
  T.IS_ACTIVE,                          -- nIS_ACTIVE
  T.CREATED,                            -- dCREATED
  T.UPDATED                             -- dUPDATED
from
  PRECOSENDREG T
where exists (select null from V_USERPRIV UP where UP.CATALOG = T.CRN);
