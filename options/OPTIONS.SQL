begin
  begin
    /* Инициализация параметра системы */
    P_SYSTEM_INIT_OPTION
    (
      /* код раздела, к которому относится параметр */
      sUNITCODE       => 'PrecoOutputExchangeJournal',
      /* код параметра */
      sCODE           => 'PrecoOutputExchangeJournal_SenderCode',
      /* наименование параметра */
      sNAME           => 'Идентификатор системы-отправителя',
      /* порядковый номер параметра в рамках раздела */
      nNUMB           => 31001,
      /* тип параметра */
      nOPT_TYPE       => 1,
      /* вид параметра */
      nOPT_KIND       => 1,
      /* режим параметра */
      nOPT_MODE       => 1,
      /* способ формирования */
      nENTRY_TYPE     => 0,
      /* тип данных */
      nDATA_TYPE      => 0,
      /* общая длина строкового поля */
      nSTR_WIDTH      => 36,
      /* общая длина числового поля */
      nNUM_WIDTH      => null,
      /* точность числового поля */
      nNUM_PRECISION  => null,
      /* список кодов перечисления */
      sENUM_CODE      => null,
      /* список текстов перечисления */
      sENUM_TEXT      => null,
      /* привязка к интерфейсу: код раздела */
      sLINK_UNITCODE  => null,
      /* привязка к интерфейсу: код метода вызова */
      sLINK_METHOD    => null,
      /* привязка к интерфейсу: код входного параметра */
      sLINK_INPARAM   => null,
      /* привязка к интерфейсу: код выходного параметра */
      sLINK_OUTPARAM  => null,
      /* привязка к интерфейсу: код ведущего параметра */
      sLINK_OPTION    => null,
      /* значение: строка */
      sSTR_VALUE      => null,
      /* значение: число */
      nNUM_VALUE      => null,
      /* значение: дата */
      dDATE_VALUE     => null
    );

    commit;
  exception
    when OTHERS then
      dbms_output.put_line('Ошибка инициализации параметра системы "31001 Preco_SenderCode Идентификатор системы-отправителя": ' || SQLERRM);
  end;
end;
