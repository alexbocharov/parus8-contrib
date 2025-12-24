/* ПРЕКО. Платформа сбора первичной отчётности. Журнал входящего обмена отчётностью (история) */
create or replace view V_PRECOINEXJRHST
(
  nRN,                                  -- Регистрационный номер
  nCOMPANY,                             -- Организация
  nCRN,                                 -- Каталог
  nPRN,                                 -- Родитель
  nNUMB,                                -- Порядковый номер
  sMSG_ID,                              -- Идентификатор сообщения
  sSTATUS,                              -- Статус
  sERR_CODE,                            -- Код ошибки
  sERR_TEXT,                            -- Текст ошибки
  dCREATED,                             -- Дата создания
  dUPDATED                              -- Дата модификации
)
as
select
  T.RN,                                 -- nRN
  T.COMPANY,                            -- nCOMPANY
  T.CRN,                                -- nCRN
  T.PRN,                                -- nPRN
  T.NUMB,                               -- nNUMB
  T.MSG_ID,                             -- sMSG_ID
  T.STATUS,                             -- sSTATUS
  T.ERR_CODE,                           -- sERR_CODE
  T.ERR_TEXT,                           -- sERR_TEXT
  T.CREATED,                            -- dCREATED
  T.UPDATED                             -- dUPDATED
from
  PRECOINEXJRHST T
where exists (select null from V_USERPRIV UP where UP.CATALOG = T.CRN);
