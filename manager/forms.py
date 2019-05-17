from django import forms
from manager.models import ProdBrand, ProdSize, ProdType, ProdCategories, Product, TempProduct, SaleTable, PaymentToken


class ProdBrandForm(forms.ModelForm):
    class Meta():
        model = ProdBrand
        exclude = [
            "brand_name",
            "brand_id",
            "is_active"
        ]


class ProdCategoriesForm(forms.ModelForm):
    class Meta():
        model = ProdCategories
        exclude = [
            "cat_id",
            "cat_name",
            "is_active"
        ]


class ProdSizeForm(forms.ModelForm):
    class Meta():
        model = ProdSize
        exclude = [
            "type_id",
            "size_id",
            "size_name",
            "is_active"
        ]


class ProdTypeForm(forms.ModelForm):
    class Meta():
        model = ProdType
        exclude = [
            "type_id",
            "type_name",
            "is_active"
        ]


class ProductForm(forms.ModelForm):
    class Meta():
        model = Product
        exclude = [
            "prod_id",
            "cat_id",
            "type_id",
            "user_email",
            "brand_id",
            "size_id",
            "prod_name",
            "prod_price",
            "prod_qty",
            "prod_creationdate",
            "prod_img1",
            "prod_img2",
            "prod_img3",
            "prod_img4",
            "prod_description"
        ]


class TempProductForm(forms.ModelForm):
    class Meta():
        model = TempProduct
        exclude = [
            "tempproduct_id",
            "product_id",
            "product_name",
            "prod_qty",
            "prod_price",
            "prod_size",
            "user_email",
            "prod_type",
            "prod_cat",
            "add_date",
            "prod_image",
            "subtotal"
        ]


class SaleTableForm(forms.ModelForm):
    class Meta():
        model = SaleTable
        exclude = [
            "sale_id",
            "invoice",
            "product_id",
            "product_name",
            "prod_qty",
            "prod_price",
            "user_email",
            "prod_size",
            "prod_type",
            "prod_cat",
            "total",
            "payment_mode",
            "sale_date",
            "user_address",
            "user_landmark",
            "user_mobile",
            "user_pincode",
            "user_name"
        ]


class PaymentTokenForm(forms.ModelForm):
    class Meta():
        model = PaymentToken
        exclude = [
            "user_email",
            "token",
            "invoice"
        ]