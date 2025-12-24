/* Триггер после удаления */
create or replace trigger T_PRECOINEXJRHST_ADELETE
  after delete on PRECOINEXJRHST for each row
begin
  /* дополнительная обработка после удаления записи раздела */
  P_LOG_DELETE( :old.RN,'PrecoInputExchangeJournalHistory' );
end;
/
show errors trigger T_PRECOINEXJRHST_ADELETE;
