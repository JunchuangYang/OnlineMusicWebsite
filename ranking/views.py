from django.shortcuts import render
from django.views.generic import ListView
from index.models import *
# Create your views here.
def rankingView(request):

    # 热搜歌曲
    search_song = Dynamic.objects.select_related('song').order_by('-dynamic_search').all()[:4]
    # 歌曲分类列表
    All_list = Song.objects.values('song_type').distinct()
    # 歌曲信息列表
    song_type = request.GET.get('type', '')

    if song_type:
        song_info = Dynamic.objects.select_related('song').filter(song__song_type = song_type).\
            order_by('-dynamic_plays').all()[:10]
    else:
        song_info = Dynamic.objects.select_related('song').order_by('-dynamic_plays').all()[:10]

    return render(request, 'ranking.html', locals())

'''通用视图编写，运行结果同上面函数相同，使用 ranking.html.list访问'''
class RankingList(ListView):
    # context_object_name 设置HTML模板的某一个变量名称，同rankView中song_info相同
    context_object_name = 'song_info'

    # 设定模板文件
    template_name = 'ranking.html'

    # 查询变量song_info的数据
    def get_queryset(self):
        # 获取请求参数
        song_type = self.request.GET.get('type' , '')
        if song_type:
            song_info = Dynamic.objects.select_related('song').filter(song__song_type = song_type).\
                order_by('-dynamic_plays').all()[:10]
        else:
            song_info = Dynamic.objects.select_related('song').order_by('-dynamic_plays').all()[:10]

        return song_info

    # 添加其他变量数据
    def get_context_data(self, **kwargs):

        context = super().get_context_data(**kwargs)
        # 搜索歌曲
        context['search_song'] = Dynamic.objects.select_related('song').order_by('-dynamic_search').\
            all()[:4]

        context['All_list'] = Song.objects.values('song_type').distinct()

        return context

