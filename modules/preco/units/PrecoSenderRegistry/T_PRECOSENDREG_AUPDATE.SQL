/* Триггер после исправления */
create or replace trigger T_PRECOSENDREG_AUPDATE
  after update on PRECOSENDREG for each row
begin
  /* дополнительная обработка после исправления записи раздела */
  P_LOG_UPDATE( :new.RN,'PrecoSenderRegistry',:new.CRN,:old.CRN,null,null );
end;
/
show errors trigger T_PRECOSENDREG_AUPDATE;
