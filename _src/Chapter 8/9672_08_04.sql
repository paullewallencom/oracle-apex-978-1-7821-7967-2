select extractValue(value(t),'*/@page') "page"
     , extractValue(value(ti),'*/@secret') "secret"
     , extractValue(value(ti),'*/@id') "photo_id"
     , extractValue(value(ti),'*/@title') "title"
  from wwv_flow_collections c 
     , table(xmlsequence(extract(c.xmltype001,'*/photos'))) t 
     , table(xmlsequence(extract(value(t),'*/photo'))) ti
 where c.collection_name = 'P17_DOREST_RESULTS'