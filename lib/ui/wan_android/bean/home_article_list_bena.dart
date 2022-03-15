import 'package:flutter/cupertino.dart';
import 'package:flutter_study/ui/wan_android/ui/tixi.dart';

class HomeArticleListBean {
  int? curPage;
  int? offset;
  int? pageCount;
  int? size;
  int? total;
  bool? over;
  List<HomeArticleDetailBean>? datas;

  HomeArticleListBean(
      {this.curPage,
      this.offset,
      this.pageCount,
      this.size,
      this.total,
      this.over,
      this.datas});

  HomeArticleListBean.fromJson(Map<String, dynamic> json) {
    curPage = json["curPage"];
    offset = json["offset"];
    pageCount = json["pageCount"];
    total = json["total"];
    size = json["size"];
    over = json["over"];
    if (json["datas"] != null) {
      datas = json["datas"];
    } else {
      datas = [];
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["curPage"] = curPage;
    map["offset"] = offset;
    map["pageCount"] = pageCount;
    map["total"] = total;
    map["size"] = size;
    map["over"] = over;
    map["datas"] = datas;
    return map;
  }
}

class HomeArticleDetailBean {
  String? apkLink;
  int? audit;
  String? author;
  bool? canEdit;
  int? chapterId;
  String? chapterName;
  bool? collect;
  int? courseId;
  String? desc;
  String? descMd;
  String? envelopePic;
  bool? fresh;
  String? host;
  int? id;
  String? link;
  String? niceDate;
  String? niceShareDate;
  String? origin;
  String? prefix;
  String? projectLink;
  String? publishTime;
  int? realSuperChapterId;
  int? selfVisible;
  int? shareDate;
  String? shareUser;
  int? superChapterId;
  String? superChapterName;
  List<ArticleTagsBean>? tags;
  String? title;
  int? type;
  int? userId;
  int? visible;
  int? zan;

  HomeArticleDetailBean(
      {this.apkLink,
      this.audit,
      this.author,
      this.canEdit,
      this.chapterId,
      this.chapterName,
      this.collect,
      this.courseId,
      this.desc,
      this.envelopePic,
      this.fresh,
      this.host,
      this.id,
      this.link,
      this.niceDate,
      this.niceShareDate,
      this.origin,
      this.prefix,
      this.projectLink,
      this.publishTime,
      this.realSuperChapterId,
      this.selfVisible,
      this.shareDate,
      this.shareUser,
      this.superChapterId,
      this.superChapterName,
      this.tags,
      this.title,
      this.userId,
      this.visible,
      this.zan});

  HomeArticleDetailBean.fromJson(Map<String, dynamic> json) {
    json["appLink"] = apkLink;
    json["audit"] = audit;
    json["author"] = author;
    json["canEdit"] = canEdit;
    json["chapterId"] = chapterId;
    json["chapterName"] = chapterName;
    json["collect"] = collect;
    json["courseId"] = courseId;
    json["desc"] = desc;
    json["envelopePic"] = envelopePic;
    json["fresh"] = fresh;
    json["host"] = host;
    json["id"] = id;
    json["link"] = link;
    json["niceDate"] = niceDate;
    json["niceShareDate"] = niceShareDate;
    json["origin"] = origin;
    json["prefix"] = prefix;
    json["projectLink"] = projectLink;
    json["publishTime"] = publishTime;
    json["realSuperChapterId"] = realSuperChapterId;
    json["selfVisible"] = selfVisible;
    json["shareDate"] = shareDate;
    json["shareUser"] = shareUser;
    json["superChapterId"] = superChapterId;
    json["superChapterName"] = superChapterName;
    json["tags"] = tags;
    json["title"] = title;
    json["userId"] = userId;
    json["zan"] = zan;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    apkLink = map["apkLink"];
    audit = map["audit"];
    author = map["author"];
    chapterId = map["chapterId"];
    chapterName = map["chapterName"];
    collect = map["collect"];
    courseId = map["courseId"];
    desc = map["desc"];
    envelopePic = map["envelopePic"];
    fresh = map["fresh"];
    host = map["host"];
    id = map["id"];
    link = map["link"];
    niceDate = map["niceDate"];
    niceShareDate = map["niceShareDate"];
    origin = map["origin"];
    prefix = map["prefix"];
    projectLink = map["projectLink"];
    publishTime = map["publishTime"];
    realSuperChapterId = map["realSuperChapterId"];
    selfVisible = map["selfVisible"];
    shareDate = map["shareDate"];
    shareUser = map["shareUser"];
    superChapterId = map["superChapterId"];
    tags = map["tags"];
    title = map["title"];
    zan = map["zan"];
    return map;
  }
}

class ArticleTagsBean {
  String? name;
  String? url;

  ArticleTagsBean({this.name, this.url});

  ArticleTagsBean.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = name;
    map["url"] = url;
    return map;
  }
}
