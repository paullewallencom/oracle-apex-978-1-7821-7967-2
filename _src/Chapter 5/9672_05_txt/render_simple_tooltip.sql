/*************************************************************
** Name: render_simple_tooltip.sql                          **
** Author: M. van der Plas                                  **
** Date: 26th October 2010                                  **
** This script sets a tooltip with text on a text item      **
**                                                          **
**                                                          **
*************************************************************/
function render_simple_tooltip (
  p_item                in apex_plugin.t_page_item
, p_plugin              in apex_plugin.t_plugin
, p_value               in varchar2
, p_is_readonly         in boolean
, p_is_printer_friendly in boolean )
  return apex_plugin.t_page_item_render_result
is
  l_result         apex_plugin.t_page_item_render_result;
begin
  if apex_application.g_debug 
  then
    apex_plugin_util.debug_page_item (
    ,    p_plugin              => p_plugin
    ,    p_page_item           => p_item
    ,    p_value               => p_value
    ,    p_is_readonly         => p_is_readonly
    ,    p_is_printer_friendly => p_is_printer_friendly);
  end if;
  --
  htp.p('<inputsys.htp.p('<input type="text" id="’||p_item.name||’" name=”’||p_item.name||’” class="text_field" onmouseover="toolTip_enable(event,this,'||''''||p_item.attribute_01||''''||')">');
  --
  return l_result;
end render_simple_tooltip;
