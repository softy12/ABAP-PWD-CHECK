REPORT ZMM_PWD_CHECK.

PARAMETERS: p_usr TYPE sy-uname,
            p_pwd TYPE rsyst-bcode.

CALL FUNCTION 'SUSR_LOGIN_CHECK_RFC'
 EXPORTING
   bname                  = sy-uname
   password               = p_pwd
 EXCEPTIONS
   wait                   = 1
   user_locked            = 2
   user_not_active        = 3
   password_expired       = 4
   wrong_password         = 5
   no_check_for_this_user = 6
   internal_error         = 7.

WRITE: sy-subrc.
CASE sy-subrc.
  WHEN 0. WRITE: 'everything OK'.
  WHEN 1. WRITE: 'wait'.
  WHEN 2. WRITE: 'user_locked '.
  WHEN 3. WRITE: 'user_not_active'.
  WHEN 4. WRITE: 'password_expired'.
  WHEN 5. WRITE: 'wrong_password '.
  WHEN 6. WRITE: 'no_check_for_this_user'.
  WHEN 7. WRITE: 'internal_error'.
  WHEN OTHERS.
ENDCASE.
