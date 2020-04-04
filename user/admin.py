from django.contrib import admin
from .models import MyUser
from django.contrib.auth.admin import UserAdmin
from django.utils.translation import gettext_lazy as _
# Register your models here.
@admin.register(MyUser)
class MyUserAdmin(UserAdmin):

    list_display = ['username','email','mobile','qq','weChat']
    # 将源码的UserAdmin.fieldsets转换成列表格式
    fieldsets = list(UserAdmin.fieldsets)
    # 重写UserAdmin的fieldsets，添加moblie，qq，wechat的信息录入
    fieldsets[1] =(_('个人信息'),
                   {
                       'fields':('first_name','last_name','email',
                                 'mobile','qq','weChat'),
                   })
    exclude = ['password']
