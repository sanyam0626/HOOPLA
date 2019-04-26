from django import forms
from manager.models import UserDetail


class UserDetailForm(forms.ModelForm):
    class Meta():
        model = UserDetail
        exclude = ["role_id",
                   "user_fname",
                   "user_lname",
                   "user_email",
                   "user_password",
                   "user_mobile",
                   "user_dob",
                   "user_image",
                   "user_gender",
                   "user_isavailable",
                   "user_isactive",
                   "user_isqueue",
                   "otp",
                   "date_reg",
                   "otp_time_gen",
                   "user_token",
                   "user_isverified"]
