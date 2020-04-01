from django.db import models

# Create your models here.

'''
首页的歌曲信息应该来自于数据库，除了Django内置的数据表之外，根据项目的数据库设计得知，网站一共定义了4张数据表，
为了方便管理，我们将4张数据表所对应的模型都在index的models.py中进行定义，
模型定义如下：
'''
# 歌曲分类表
class Label(models.Model):
    label_id = models.AutoField('序号', primary_key=True)
    label_name = models.CharField('分类标签', max_length=10)

    def __str__(self):
        return self.label_name

    class Meta:
        # 设置Admin界面的显示内容
        verbose_name = '歌曲分类'
        verbose_name_plural = '歌曲分类'


# 歌曲信息表song
class Song(models.Model):
    song_id = models.AutoField('序号', primary_key=True)
    song_name = models.CharField('歌名', max_length=50)
    song_singer = models.CharField('歌手', max_length=50)
    song_time = models.CharField('时长', max_length=10)
    song_album = models.CharField('专辑', max_length=50)
    song_languages = models.CharField('语种', max_length=20)
    song_type = models.CharField('类型', max_length=20)
    song_release = models.CharField('发行时间', max_length=20)
    song_img = models.CharField('歌曲图片', max_length=20)
    song_lyrics = models.CharField('歌词', max_length=50, default='暂无歌词')
    song_file = models.CharField('歌曲文件', max_length=50)
    #级联删除：models.CASCADE
    #当关联表中的数据删除时，该外键也删除
    label = models.ForeignKey(Label, on_delete=models.CASCADE,verbose_name='歌曲分类')
    def __str__(self):
        return self.song_name
    class Meta:
        # 设置Admin界面的显示内容
        verbose_name = '歌曲信息'
        verbose_name_plural = '歌曲信息'

# 歌曲动态表dynamic
class Dynamic(models.Model):
    dynamic_id = models.AutoField('序号', primary_key=True)
    song = models.ForeignKey(Song, on_delete=models.CASCADE, verbose_name='歌名')
    dynamic_plays = models.IntegerField('播放次数')
    dynamic_search = models.IntegerField('搜索次数')
    dynamic_down = models.IntegerField('下载次数')
    class Meta:
        # 设置Admin界面的显示内容
        verbose_name = '歌曲动态'
        verbose_name_plural = '歌曲动态'

# 歌曲点评表comment
class Comment(models.Model):
    comment_id = models.AutoField('序号', primary_key=True)
    comment_text = models.CharField('内容', max_length=500)
    comment_user = models.CharField('用户', max_length=20)
    song = models.ForeignKey(Song, on_delete=models.CASCADE,verbose_name='歌名')
    comment_date = models.CharField('日期', max_length=50)
    class Meta:
        # 设置Admin界面的显示内容
        verbose_name = '歌曲评论'
        verbose_name_plural = '歌曲评论'