/* Поиск регистрационного номера "ПРЕКО. Платформа сбора первичной отчётности. Журнал исходящего обмена отчётностью" */
create or replace procedure FIND_PRECOOUTEXJR_BY_REPORT
(
  nFLAG_SMART               in number,       -- признак генерации исключения (0 - да, 1 - нет)
  nCOMPANY                  in number,       -- организация
  nJUR_PERS                 in number,       -- юридическое лицо
  dREPORT_DATE              in date,         -- дата отчета
  sREPORT_CODE              in varchar2,     -- код отчета (форма)
  nRN                       out number       -- регистрационный номер
)
as
begin
  /* поиск записи */
  begin
    select RN
      into nRN
      from PRECOOUTEXJR
     where JUR_PERS = nJUR_PERS
       and REPORT_CODE = sREPORT_CODE
       and REPORT_DATE = dREPORT_DATE
       and COMPANY = nCOMPANY;
  exception
    when NO_DATA_FOUND then
      P_EXCEPTION( nFLAG_SMART, 'Запись в журнале исходящего обмена отчётностью ПРЕКО не найдена для юридического лица ' || nJUR_PERS || ', формы ' || sREPORT_CODE || ', даты отчёта ' || to_char(dREPORT_DATE, 'DD.MM.YYYY') || '.' );
  end;
end;
/
show errors procedure FIND_PRECOOUTEXJR_BY_REPORT;