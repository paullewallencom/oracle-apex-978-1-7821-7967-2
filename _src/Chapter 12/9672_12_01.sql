select feedback_id
     , feedback_number
     , feedback
     , public_response
  from apex_team_feedback
 where logging_apex_user = :APP_USER