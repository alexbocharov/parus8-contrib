/* Триггер до удаления */
create or replace trigger T_PRECOSENDREG_BDELETE
  before delete on PRECOSENDREG for each row
begin
  /* регистрация события */
  if ( PKG_IUD.PROLOGUE('PRECOSENDREG', 'D') ) then
    PKG_IUD.REG_RN('RN', :old.RN);
    PKG_IUD.REG_COMPANY('COMPANY', :old.COMPANY);
    PKG_IUD.REG_CRN('CRN', :old.CRN);
    PKG_IUD.REG('CODE', :old.CODE);
    PKG_IUD.REG(1, 'NAME', :old.NAME);
    PKG_IUD.REG('SYSTEM', :old.SYSTEM);
    PKG_IUD.REG('IS_ACTIVE', :old.IS_ACTIVE);
    PKG_IUD.REG('CREATED', :old.CREATED);
    PKG_IUD.REG('UPDATED', :old.UPDATED);
    PKG_IUD.EPILOGUE;
  end if;
end;
/
show errors trigger T_PRECOSENDREG_BDELETE;
