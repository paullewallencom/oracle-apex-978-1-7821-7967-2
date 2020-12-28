function render_simple_tooltip (p_item in apex_plugin.t_page_item,
                                p_plugin in apex_plugin.t_plugin,
                                p_value in varchar2,
                                p_is_readonly in boolean,
                                p_is_printer_friendly in boolean )
return apex_plugin.t_page_item_render_result
is
  l_result apex_plugin.t_page_item_render_result;
begin
  if apex_application.g_debug
  then
    apex_plugin_util.debug_page_item (p_plugin => p_plugin
                                     ,p_page_item => p_item
                                     , p_value => p_value
                                     , p_is_readonly => p_is_readonly
                                     , p_is_printer_friendly => p_is_printer_friendly);
  end if;
  --Register the javascript and CSS library the plug-in uses.
  apex_javascript.add_library (p_name => 'jquery.bgiframe.min',
                               p_directory => p_plugin.file_prefix,
                               p_version => null );
  apex_javascript.add_library (p_name => 'jquery.bt.min',
                               p_directory => p_plugin.file_prefix,
                               p_version => null );
  apex_javascript.add_library (p_name => 'jquery.easing.1.3',
                               p_directory => p_plugin.file_prefix,
                               p_version => null );
  apex_javascript.add_library (p_name => 'jquery.hoverintent.minified',
                               p_directory => p_plugin.file_prefix,
                               p_version => null );
  apex_javascript.add_library (p_name => 'excanvas',
                               p_directory => p_plugin.file_prefix,
                               p_version => null );
  sys.htp.p('<input type="text" id="'||p_item.name||'"class="text_field" title="'||  p_item.attribute_01||'">');
  --
  apex_javascript.add_onload_code (p_code =>'$("#'||p_item.name||'").bt({padding: 20
  , width: 100
  , spikeLength: 40
  , spikeGirth: 40
  , cornerRadius: 50
  , fill: '||''''||'rgba(200, 50, 50, .8)'||''''||'
  , strokeWidth: 4
  , strokeStyle: '||''''||'#E30'||''''||'
  , cssStyles: {color: '||''''||'#FFF'||''''||',
  fontWeight: '||''''||'bold'||''''||'} });');
  --
  return l_result;
end render_simple_tooltip;