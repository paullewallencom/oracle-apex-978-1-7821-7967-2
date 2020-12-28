select extractValue(value(t),'*/@page') "page"
     , extractValue(value(ti),'*/@secret') "secret"
     , extractValue(value(ti),'*/@id') "photo_id"
     , extractValue(value(ti),'*/@farm') "farm"
     , extractValue(value(ti),'*/@server') "server"
     , extractValue(value(ti),'*/@title') "title"
     , '<img src="http://farm'||extractValue(value(ti),'*/@farm')||'.static.flickr.com/'||extractValue(value(ti),'*/@server')||'/'||extractValue(value(ti),'*/@id')||'_'||extractValue(value(ti),'*/@secret')||'_s.jpg">' "image"
  from wwv_flow_collections c 
     , table(xmlsequence(extract(c.xmltype001,'*/photos'))) t 
     , table(xmlsequence(extract(value(t),'*/photo'))) ti
 where c.collection_name = 'P17_DOREST_RESULTS'
