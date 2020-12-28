/*************************************************************
** Name: render_stepcarousel.sql                            **
** Author: M. van der Plas                                  **
** Date: 26th October 2010                                  **
** This script puts a stepcarousel on the page.             **
** It makes use of the stepcarousel plug-in.                **
**                                                          **
*************************************************************/
function render_stepcarousel (p_region              in apex_plugin.t_region
                             ,p_plugin              in apex_plugin.t_plugin
                             ,p_is_printer_friendly in boolean )                              
return apex_plugin.t_region_render_result
is
  cursor c_crl is
    select id
    ,      panel_title
    ,      panel_text
    ,      panel_text_date
    from   app_carousel
    order by id;
  --
  l_code varchar2(32767);
begin
  -- add the libraries and stylesheets
  --
  apex_javascript.add_library (p_name      => 'stepcarousel'
                              ,p_directory => p_plugin.file_prefix
                              ,p_version   => null );
  --
  -- Output the placeholder for the region which is used by the Javascript code
  --
  sys.htp.p('<style type="text/css">');
  --
  sys.htp.p('.stepcarousel{');
  sys.htp.p('position: relative;');
  sys.htp.p('border: 10px solid black;');
  sys.htp.p('overflow: scroll;');
  sys.htp.p('width: '||p_region.attribute_01||'px;');
  sys.htp.p('height: '||p_region.attribute_02||'px;');
  sys.htp.p('}');
  --
  sys.htp.p('.stepcarousel .belt{');
  sys.htp.p('position: absolute;');
  sys.htp.p('left: 0;');
  sys.htp.p('top: 0;');
  sys.htp.p('}');
  sys.htp.p('.stepcarousel .panel{');
  sys.htp.p('float: left;');
  sys.htp.p('overflow: hidden;');
  sys.htp.p('margin: 10px;');
  sys.htp.p('width: 250px;');
  sys.htp.p('}');
  --
  sys.htp.p('</style>');
  --
  sys.htp.p('<div id="mygallery" class="stepcarousel" style="overflow:hidden"><div class="belt">');
  --
  for r_crl in c_crl
  loop
    sys.htp.p('<div class="panel">');
    sys.htp.p('<b>'||to_char(r_crl.panel_text_date,'DD-MON-YYYY')||'</b>');
    sys.htp.p('<br>');
    sys.htp.p('<b>'||r_crl.panel_title||'</b>');
    sys.htp.p('<hr>');
    sys.htp.p(r_crl.panel_text);
    sys.htp.p('</div>');
  end loop;
  --
  sys.htp.p('</div></div>');
  --Add the onload code to show the carousel
  --
  l_code := 'stepcarousel.setup({galleryid: "mygallery"
                                ,beltclass: "belt"
                                ,panelclass: "panel"
                                ,autostep: {enable:true, moveby:1, pause:3000}
                                ,panelbehavior: {speed:500, wraparound:true, persist:true}
                                ,defaultbuttons: {enable: true, moveby: 1, leftnav: ["’||p_plugin.file_prefix||’arrowl.gif", -5, 80], rightnav: ["’||  p_plugin.file_prefix||’arrowr.gif", -20, 80]}
                                ,statusvars: ["statusA", "statusB", "statusC"]
                                ,contenttype: ["inline"]})';
  --
  apex_javascript.add_onload_code (p_code => l_code);
  --
  return null;
end render_stepcarousel;

