from django.contrib import admin
from manager import models as m

# Register your models here.

admin.site.register(m.UserDetail)
admin.site.register(m.Role)
admin.site.register(m.ProdCategories)
admin.site.register(m.ProdType)
admin.site.register(m.Product)
admin.site.register(m.ProdSize)
admin.site.register(m.ProdBrand)