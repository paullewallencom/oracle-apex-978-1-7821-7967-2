/*************************************************************
** Name: 9672_09_01.sql                                     **
** Author: M. van der Plas                                  **
** Date: 26th October 2010                                  **
** This script executes a select statement that             **
** queries on the apex_application_page_regions table       **
** and produces a link to export the data on the screen to  **
** CSV format.                                              **
** replace localhost and 8000 by your own hostname and      **
** portnumber. Also replace 114 by the application ID from  **
** your application and 12 by the page ID from your         **
** own page.                                                **
**                                                          **
*************************************************************/
select 'http://localhost:8000/apex/f?p='||application_id||':'||page_id||':&SESSION.:FLOW_EXCEL_OUTPUT_R'||region_id||'_en'
from   apex_application_page_regions
where  upper(source_type) = 'REPORT'
and    application_id = 114
and    page_id = 12;
