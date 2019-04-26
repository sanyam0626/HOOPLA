def authorize_user(auth, role, userrole):
    if auth == True:
        if role == userrole:
            return True
        else:
            return False, "Wrong Level"
    else:
        return False, "Not Login"
