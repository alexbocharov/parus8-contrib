/* Считывание записи */
create or replace procedure P_PRECOINEXJR_EXISTS
(
  nRN                       in number,       -- Регистрационный номер
  nCOMPANY                  in number,       -- Организация
  nCRN                      out number       -- Каталог
)
as
begin
  /* поиск записи */
  begin
    select CRN
      into nCRN
      from PRECOINEXJR
     where RN = nRN
       and COMPANY = nCOMPANY;
  exception
    when NO_DATA_FOUND then
      PKG_MSG.RECORD_NOT_FOUND( nRN,'PrecoInputExchangeJournal' );
  end;
end;
/
show errors procedure P_PRECOINEXJR_EXISTS;
