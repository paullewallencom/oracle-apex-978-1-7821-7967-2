/*************************************************************
** Name: render_setcolor.sql                                **
** Author: M. van der Plas                                  **
** Date: 26th October 2010                                  **
** This script dynamically changes the color of an element  **
**                                                          **
**                                                          **
*************************************************************/
function render_setcolor (p_dynamic_action in apex_plugin.t_dynamic_action
                         ,p_plugin         in apex_plugin.t_plugin )
return apex_plugin.t_dynamic_action_render_result
is
  l_result apex_plugin.t_dynamic_action_render_result;
begin
  l_result.javascript_function := 'function(pAction){this.affectedElements.css("color", this.action.attribute01);}';
  l_result.attribute_01        := p_dynamic_action.attribute_01;
  --
  return l_result;        
end render_setcolor;
