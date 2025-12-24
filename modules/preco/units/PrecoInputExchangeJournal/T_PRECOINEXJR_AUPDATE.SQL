/* Триггер после исправления */
create or replace trigger T_PRECOINEXJR_AUPDATE
  after update on PRECOINEXJR for each row
begin
  /* дополнительная обработка после исправления записи раздела */
  P_LOG_UPDATE( :new.RN,'PrecoInputExchangeJournal',:new.CRN,:old.CRN,null,null );
end;
/
show errors trigger T_PRECOINEXJR_AUPDATE;
