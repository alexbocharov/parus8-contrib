/* Базовое изменение статуса журнала */
create or replace procedure P_PRECOINEXJR_BSET_STATUS
(
  nRN                       in number,       -- Регистрационный номер
  nCOMPANY                  in number,       -- Организация
  sMSG_ID                   in varchar2,     -- Идентификатор сообщения
  sSTATUS                   in varchar2,     -- Статус
  dUPDATED                  in date          -- Дата модификации
)
as
begin
  /* изменение статуса в таблице */
  update PRECOINEXJR
     set MSG_ID = sMSG_ID,
         STATUS = sSTATUS,
         UPDATED = dUPDATED
   where RN = nRN
     and COMPANY = nCOMPANY;

  if (SQL%NOTFOUND) then
    PKG_MSG.RECORD_NOT_FOUND( nRN,'PrecoInputExchangeJournal' );
  end if;
end;
/
show errors procedure P_PRECOINEXJR_BSET_STATUS;