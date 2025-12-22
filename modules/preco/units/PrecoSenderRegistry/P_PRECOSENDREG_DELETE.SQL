/* Удаление отправителя */
create or replace procedure P_PRECOSENDREG_DELETE
(
  nRN                       in number,       -- Регистрационный номер
  nCOMPANY                  in number        -- Организация
)
as
  nCRN                      PKG_STD.tREF;    -- Каталог
begin
  /* Считывание записи */
  P_PRECOSENDREG_EXISTS
  (
    nRN,
    nCOMPANY,
    nCRN
  );

  /* фиксация начала выполнения действия */
  PKG_ENV.PROLOGUE( nCOMPANY,null,nCRN,null,null,'PrecoSenderRegistry','PRECOSENDREG_DELETE','PRECOSENDREG',nRN );

  /* Базовое удаление */
  P_PRECOSENDREG_BASE_DELETE
  (
    nRN,
    nCOMPANY
  );

  /* фиксация окончания выполнения действия */
  PKG_ENV.EPILOGUE( nCOMPANY,null,nCRN,null,null,'PrecoSenderRegistry','PRECOSENDREG_DELETE','PRECOSENDREG',nRN );
end;
/
show errors procedure P_PRECOSENDREG_DELETE;
