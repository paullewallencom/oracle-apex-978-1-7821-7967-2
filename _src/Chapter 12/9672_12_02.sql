/*************************************************************
** Name: 9672_12_02.sql                                     **
** Author: M. van der Plas                                  **
** Date: 26th October 2013                                  **
** For PX_FEEDBACK_ID, replace X by the page number you     **
** are working on                                           **
*************************************************************/
select follow_up
  from apex_team_feedback_followup
 where feedback_id = :PX_FEEDBACK_ID