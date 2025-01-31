-- Create a simple stored procedure to log a message

CREATE OR REPLACE PROCEDURE LogMessage(log_text STRING)
RETURNS STRING
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
BEGIN
    RETURN 'Log Entry: ' || log_text;
END;
$$;