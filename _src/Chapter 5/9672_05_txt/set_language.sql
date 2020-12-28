/*************************************************************
** Name: set_language.sql                                   **
** Author: M. van der Plas                                  **
** Date: 26th October 2010                                  **
** This script dynamically switches the session language    **
**                                                          **
**                                                          **
*************************************************************/
function set_language (p_process in apex_plugin.t_process
                      ,p_plugin  in apex_plugin.t_plugin )
  return apex_plugin.t_process_exec_result
is
  -- Dynamic Attribute mapping
  l_language     varchar2(50) := p_process.attribute_01;
  l_result       apex_plugin.t_process_exec_result;
begin
  -- Set session language
  apex_util.set_session_lang(l_language_abv);apex_util.set_session_lang(l_language_abv);
  -- Set success message
  l_result.success_message := 'Session language switched to '||l_language;
  return l_result;
end set_language;
