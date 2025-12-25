create or replace package PKG_PRECOOUTEXJR
as
  sSTATUS_NEW               constant PKG_STD.tSTRING := 'NEW';                -- Новая
  sSTATUS_QUEUED            constant PKG_STD.tSTRING := 'QUEUED';             -- В очереди на отправку
  sSTATUS_SENDING           constant PKG_STD.tSTRING := 'SENDING';            -- Отправляется
  sSTATUS_SENT              constant PKG_STD.tSTRING := 'SENT';               -- Отправлена
  sSTATUS_PROCESSING_QUEUE  constant PKG_STD.tSTRING := 'PROCESSING_QUEUED';  -- В очереди на обработку
  sSTATUS_PROCESSING        constant PKG_STD.tSTRING := 'PROCESSING';         -- Обрабатывается
  sSTATUS_PROCESSED         constant PKG_STD.tSTRING := 'PROCESSED';          -- Обработана
  sSTATUS_ERROR             constant PKG_STD.tSTRING := 'ERROR';              -- Ошибка
  sSTATUS_UPDATED           constant PKG_STD.tSTRING := 'UPDATED';            -- Обновлена
end PKG_PRECOOUTEXJR;
/
show errors package PKG_PRECOOUTEXJR;