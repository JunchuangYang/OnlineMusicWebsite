# index的__init__.py
# 对功能模块进行命名
from django.apps import AppConfig
import os
# 修改App在Admin后台显示的名称
# default_app_config的值来及apps.py的类名
default_app_config = 'index.IndexConfig'

# 获取当前App的命名
def get_current_app_name(_file):
    '''
    print(_file)#D:\OnlineMusicWebsite\MusicWebsite\index\__init__.py
    print(os.path.dirname(_file))#D:\OnlineMusicWebsite\MusicWebsite\index
    print(os.path.split(os.path.dirname(_file)))#('D:\\OnlineMusicWebsite\\MusicWebsite', 'index')
    '''
    #os.path.split()：按照路径将文件名和路径分割开
    return os.path.split(os.path.dirname(_file))[-1]##index

# 重写IndexConfig类
class IndexConfig(AppConfig):
    name = get_current_app_name(__file__)
    verbose_name ='网站首页'







