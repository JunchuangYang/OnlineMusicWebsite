from django.shortcuts import render
from index.models import *
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

# Create your views here.
# 根据index页左边的分类标签进行数据查找并分页
def LabelView(request,label_id,page):
    # 热搜歌曲
    search_song = Dynamic.objects.select_related('song').order_by('-dynamic_search').all()[:6]

    song_info = Dynamic.objects.select_related('song').filter(song__label_id = label_id).\
        order_by('-dynamic_search').all()[:6]
    label_id = label_id
    print(song_info[0].song.song_name)

    paginator = Paginator(song_info,5)

    try:
        contacts = paginator.page(page)
    except PageNotAnInteger:
        contacts = paginator.page(1)
    except EmptyPage:
        contacts = paginator.page(paginator.num_pages)
    return  render(request,'label.html',locals())