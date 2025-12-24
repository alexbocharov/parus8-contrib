/* Базовое удаление */
create or replace procedure P_PRECOINEXJRHST_BASE_DELETE
(
  nRN                       in number,       -- Регистрационный номер
  nCOMPANY                  in number        -- Организация
)
as
begin
  /* удаление записи из таблицы */
  delete
    from PRECOINEXJRHST
   where RN = nRN
     and COMPANY = nCOMPANY;

  if (SQL%NOTFOUND) then
    PKG_MSG.RECORD_NOT_FOUND( nRN,'PrecoInputExchangeJournalHistory' );
  end if;
end;
/
show errors procedure P_PRECOINEXJRHST_BASE_DELETE;
