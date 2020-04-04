from django.contrib import admin
from .models import *
# Register your models here.

# 修改title和header
admin.site.site_title = '我的音乐后台管理系统'
admin.site.site_header = '我的音乐'

class SongInline(admin.StackedInline):
    model = Song
    extra = 0 #嵌入的数量


# 模型Label
@admin.register(Label)
class LabelAdmin(admin.ModelAdmin):
    inlines = [SongInline]
    # 设置模型字段，用于在Admin后台数据的表头设置
    list_display = ['label_id', 'label_name']
    # 设置可搜索字段并在Admin后台数据生成搜索框，若有如有外键应使用双下划线连接两个模型字段
    search_fields = ['label_name']
    # 设置排序方式
    ordering = ['label_id']

# 模型song
@admin.register(Song)
class SongAdmin(admin.ModelAdmin):
    list_display = ['song_id','song_name','song_singer','song_album',
                    'song_languages','song_release']
    search_fields = ['song_name','song_singer','song_album','song_languages']
    # 设置过滤器，在后台数据的右侧生成导航栏，如有外键应使用双下划线连接两个模型的字段
    list_filter = ['song_singer','song_album','song_languages','label_id__label_name']
    ordering = ['song_id']


@admin.register(Dynamic)
class DynamicAdmin(admin.ModelAdmin):
    # 设置模型字段，用于Admin后台数据的表头设置
    list_display = ['dynamic_id','song','dynamic_plays','dynamic_search','dynamic_down']
    # 设置可搜索的字段并在Admin后台数据生成搜索框，如有外键应使用双下划线连接两个模型的字段
    search_fields = ['song']
    # 设置过滤器，在后台数据的右侧生成导航栏，如有外键应使用双下划线连接两个模型的字段
    list_filter = ['dynamic_plays','dynamic_search','dynamic_down']
    # 设置排序方式
    ordering = ['dynamic_id']

@admin.register(Comment)
class CommentAdmin(admin.ModelAdmin):
    # 设置模型字段，用于Admin后台数据的表头设置
    list_display = ['comment_id','comment_text','comment_user','song','comment_date']
    # 设置可搜索的字段并在Admin后台数据生成搜索框，如有外键应使用双下划线连接两个模型的字段
    search_fields = ['comment_user','song','comment_date']
    # 设置过滤器，在后台数据的右侧生成导航栏，如有外键应使用双下划线连接两个模型的字段
    list_filter = ['song','comment_date']
    # 设置排序方式
    ordering = ['comment_id']



