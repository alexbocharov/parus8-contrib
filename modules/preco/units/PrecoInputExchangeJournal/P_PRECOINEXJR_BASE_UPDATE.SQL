/* Базовое исправление */
create or replace procedure P_PRECOINEXJR_BASE_UPDATE
(
  nRN                       in number,       -- Регистрационный номер
  nCOMPANY                  in number,       -- Организация
  nAGENT                    in number,       -- Ссылка на контрагента
  sREPORT_CODE              in varchar2,     -- Код отчета (Форма)
  dREPORT_DATE              in date,         -- Дата отчета
  sMSG_ID                   in varchar2,     -- Идентификатор сообщения
  nPRECOSENDREG             in number,       -- Ссылка на реестр отправителей
  sSTATUS                   in varchar2,     -- Статус
  dUPDATED                  in date          -- Дата модификации
)
as
begin
  /* исправление записи в таблице */
  update PRECOINEXJR
     set AGENT = nAGENT,
         REPORT_CODE = sREPORT_CODE,
         REPORT_DATE = dREPORT_DATE,
         MSG_ID = sMSG_ID,
         PRECOSENDREG = nPRECOSENDREG,
         STATUS = sSTATUS,
         UPDATED = dUPDATED
   where RN = nRN
     and COMPANY = nCOMPANY;

  if (SQL%NOTFOUND) then
    PKG_MSG.RECORD_NOT_FOUND( nRN,'PrecoInputExchangeJournal' );
  end if;
end;
/
show errors procedure P_PRECOINEXJR_BASE_UPDATE;
