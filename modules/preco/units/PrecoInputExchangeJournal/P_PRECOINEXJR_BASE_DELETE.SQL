/* Базовое удаление */
create or replace procedure P_PRECOINEXJR_BASE_DELETE
(
  nRN                       in number,       -- Регистрационный номер
  nCOMPANY                  in number        -- Организация
)
as
begin
  /* удаление записи из таблицы */
  delete
    from PRECOINEXJR
   where RN = nRN
     and COMPANY = nCOMPANY;

  if (SQL%NOTFOUND) then
    PKG_MSG.RECORD_NOT_FOUND( nRN,'PrecoInputExchangeJournal' );
  end if;
end;
/
show errors procedure P_PRECOINEXJR_BASE_DELETE;
