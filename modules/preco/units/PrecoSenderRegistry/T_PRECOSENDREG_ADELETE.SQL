/* Триггер после удаления */
create or replace trigger T_PRECOSENDREG_ADELETE
  after delete on PRECOSENDREG for each row
begin
  /* дополнительная обработка после удаления записи раздела */
  P_LOG_DELETE( :old.RN,'PrecoSenderRegistry' );
end;
/
show errors trigger T_PRECOSENDREG_ADELETE;
