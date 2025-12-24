/* Отправить в "ПРЕКО. Платформа сбора первичной отчётности. Журнал исходящего обмена отчётностью" */
create or replace procedure P_RPTPRTQUEUE_PRECO_SEND
(
  nIDENT                    in number,       -- Идентификатор отмеченных записей
  nCOMPANY                  in number,       -- Организация
  nOPEN                     out number       -- Признак открытия журнала сообщений
)
as
  nMSG                      PKG_STD.tREF;
  bDATA                     blob;
  sJUR_PERS_CODE            PKG_STD.tSTRING;
  nJUR_PERS                 PKG_STD.tREF;
  sAGENT_NAME               PKG_STD.tSTRING;
  sAGENT_INN                PKG_STD.tSTRING;
  sAGENT_KPP                PKG_STD.tSTRING;
begin
  /* Инициализация */
  nOPEN := 0;

  for rREC in
  (
    select T.RN         as REPORT_QUEUE_RN,
           UR.NAME      as REPORT_NAME
      from SELECTLIST   SL,
           RPTPRTQUEUE  T
             inner join USERREPORTS UR on UR.RN = T.USER_REPORT
     where SL.IDENT = nIDENT
       and T.RN = SL.DOCUMENT 
       and T.COMPANY = nCOMPANY
       and T.REPORT_TYPE = 0
       and T.STATUS = 2
  )
  loop
    /* Данные выгрузки отчёта */
    begin
      select T.REPORT
        into bDATA
        from RPTPRTQUEUE_RPT T
       where T.PRN = rREC.REPORT_QUEUE_RN
         and T.REC_TYPE = 1; 
    exception
      when NO_DATA_FOUND then
        P_MSGJOURNAL_BASE_INSERT(nIDENT, 2, 'Отправка отчёта "' || rREC.REPORT_NAME || '" в ПРЕКО. Платформа сбора первичной отчётности: Данные выгрузки не найдены.', nMSG);
        continue;
    end;

    /* Код юридического лица */
    begin
      select T.STR_VALUE
        into sJUR_PERS_CODE 
        from RPTPRTQUEUE_PRM T
       where T.PRN = rREC.REPORT_QUEUE_RN
         and (T.NAME = 'SJUR_PERS' or T.NAME = 'SORG' or T.NAME = 'SJUR_PERS1');
    exception
      when NO_DATA_FOUND then
        P_MSGJOURNAL_BASE_INSERT(nIDENT, 2, 'Отправка отчёта "' || rREC.REPORT_NAME || '" в ПРЕКО. Платформа сбора первичной отчётности: Юридическое лицо не определено.', nMSG);
        continue;
    end;

    /* Определение юридического лица */
    FIND_JURPERSONS_CODE( 1,0,nCOMPANY,sJUR_PERS_CODE,nJUR_PERS );
    if nJUR_PERS is null then
      P_MSGJOURNAL_BASE_INSERT(nIDENT, 2, 'Отправка отчёта "' || rREC.REPORT_NAME || '" в ПРЕКО. Платформа сбора первичной отчётности: Юридическое лицо с кодом "' || sJUR_PERS_CODE || '" не найдено.', nMSG);
      continue;
    end if;

    /* Параметры контрагента */
    GET_JURPERSONS_AGENT_PARAM( 1,nCOMPANY,sJUR_PERS_CODE,sAGENT_NAME,sAGENT_INN,sAGENT_KPP );
    if sAGENT_INN is null then
      P_MSGJOURNAL_BASE_INSERT(nIDENT, 2, 'Отправка отчёта "' || rREC.REPORT_NAME || '" в ПРЕКО. Платформа сбора первичной отчётности: ИНН контрагента юридического лица с кодом "' || sJUR_PERS_CODE || '" не определён.', nMSG);
      continue;
    end if;
    if sAGENT_KPP is null then
      P_MSGJOURNAL_BASE_INSERT(nIDENT, 2, 'Отправка отчёта "' || rREC.REPORT_NAME || '" в ПРЕКО. Платформа сбора первичной отчётности: КПП контрагента юридического лица с кодом "' || sJUR_PERS_CODE || '" не определён.', nMSG);
      continue;
    end if;

  end loop;

  /* Открыть журнал сообщений, если есть сообщения */
  nOPEN := PKG_EXT.IIF(nMSG is not null, 1, 0);
end;
/
show errors procedure P_RPTPRTQUEUE_PRECO_SEND;
