from django import forms
from manager.models import ProdBrand,ProdSize,ProdType,ProdCategories,Product


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
            "prod_image",
            "prod_creationdate",
            "prod_img1",
            "prod_img2",
            "prod_img3",
            "prod_img4",
            "prod_description"
        ]