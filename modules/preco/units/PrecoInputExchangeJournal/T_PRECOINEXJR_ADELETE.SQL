/* Триггер после удаления */
create or replace trigger T_PRECOINEXJR_ADELETE
  after delete on PRECOINEXJR for each row
begin
  /* дополнительная обработка после удаления записи раздела */
  P_LOG_DELETE( :old.RN,'PrecoInputExchangeJournal' );
end;
/
show errors trigger T_PRECOINEXJR_ADELETE;
