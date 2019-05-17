from django.db import models

# Create your models here.


class Role(models.Model):
    role_id = models.AutoField(primary_key=True)
    role_name = models.CharField(max_length=200, default="")


class UserDetail(models.Model):
    role_id = models.ForeignKey(Role, on_delete=models.CASCADE, default="")
    user_fname = models.CharField(max_length=225, default="")
    user_lname = models.CharField(max_length=225, default="")
    user_email = models.EmailField(primary_key=True, max_length=225, default="")
    user_password = models.CharField(max_length=20, default="")
    user_address = models.CharField(max_length=500, default="")
    user_pincode = models.CharField(max_length=30, default="")
    user_landmark = models.CharField(max_length=30, default="")
    user_mobile = models.CharField(max_length=255, default="")
    user_gender = models.CharField(max_length=10, default="")
    user_isactive = models.BooleanField(default=True)
    user_dob = models.CharField(max_length=255, default="")
    user_image = models.CharField(max_length=255, default="", null=True)
    user_isavailable = models.BooleanField(default=True)
    user_isqueue = models.BooleanField(default=False)
    otp = models.CharField(default="", max_length=200, null=True)
    date_reg = models.CharField(default="", max_length=200, null=True)
    otp_time_gen = models.CharField(max_length=255, null=True, default="")
    user_token = models.CharField(max_length=255, null=True, default="")
    user_isverified = models.BooleanField(default=False)


class ProdCategories(models.Model):
    cat_id = models.AutoField(primary_key=True)
    cat_name = models.CharField(default="", max_length=225, unique=True)
    is_active = models.BooleanField(default=True)


class ProdType(models.Model):
    type_id = models.AutoField(primary_key=True)
    type_name = models.CharField(default="", max_length=255)
    is_active = models.BooleanField(default=True)


class ProdBrand(models.Model):
    brand_id = models.AutoField(primary_key=True)
    brand_name = models.CharField(default="", max_length=255, unique=True)
    is_active = models.BooleanField(default=True)


class ProdSize(models.Model):
    type_id = models.ForeignKey(ProdType, on_delete=models.CASCADE, default="")
    size_id = models.AutoField(primary_key=True)
    size_name = models.CharField(default="", max_length=200, unique=True)
    is_active = models.BooleanField(default=True)


class Product(models.Model):
    prod_id = models.AutoField(primary_key=True)
    cat_id = models.ForeignKey(ProdCategories, on_delete=models.CASCADE, default="")
    type_id = models.ForeignKey(ProdType, on_delete=models.CASCADE, default="")
    user_email = models.ForeignKey(UserDetail, on_delete=models.CASCADE)
    brand_id = models.ForeignKey(ProdBrand, on_delete=models.CASCADE, default="")
    size_id = models.ForeignKey(ProdSize, on_delete=models.CASCADE, default="")
    prod_name = models.CharField(default="", max_length=255)
    prod_price = models.CharField(default="", max_length=255)
    prod_qty = models.CharField(default="", max_length=55)
    prod_creationdate = models.CharField(default="", max_length=200)
    prod_img1 = models.CharField(default="", max_length=255)
    prod_img2 = models.CharField(default="", max_length=255, null=True)
    prod_img3 = models.CharField(default="", max_length=255, null=True)
    prod_img4 = models.CharField(default="", max_length=255, null=True)
    prod_description = models.CharField(max_length=2000, null=True, default="")


class TempProduct(models.Model):
    tempproduct_id = models.AutoField(primary_key=True)
    product_id = models.IntegerField()
    product_name = models.CharField(max_length=255, default="")
    prod_qty = models.IntegerField()
    prod_price = models.IntegerField()
    user_email = models.CharField(max_length=255, default="", null=True)
    prod_size = models.CharField(max_length=25)
    prod_type = models.CharField(max_length=25)
    prod_cat = models.CharField(max_length=25)
    add_date = models.CharField(max_length=255, null=True)
    prod_image = models.CharField(max_length=255, null=True)
    subtotal = models.IntegerField()


class SaleTable(models.Model):
    sale_id = models.AutoField(primary_key=True)
    invoice = models.CharField(max_length=35)
    product_id = models.IntegerField()
    product_name = models.CharField(default="", max_length=255)
    prod_qty = models.IntegerField()
    prod_price = models.IntegerField()
    user_email = models.CharField(max_length=255)
    user_name = models.CharField(max_length=55)
    prod_size = models.CharField(max_length=255, null=True)
    prod_type = models.CharField(max_length=25)
    prod_cat = models.CharField(max_length=25)
    total = models.IntegerField()
    payment_mode = models.CharField(max_length=35)
    sale_date = models.CharField(max_length=35)
    user_address = models.CharField(max_length=255)
    user_landmark = models.CharField(max_length=30)
    user_mobile = models.CharField(max_length=55)
    user_pincode = models.CharField(max_length=25)
    is_active = models.BooleanField(default=True)
    delivered = models.BooleanField(default=False)


class PaymentToken(models.Model):
    user_email = models.CharField(max_length=255,default="")
    token = models.CharField(max_length=255, default="")
    invoice = models.CharField(max_length=255, unique=True, default="")
