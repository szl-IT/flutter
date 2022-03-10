import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class XQAXHomePage extends StatefulWidget {
  const XQAXHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return XQAXHomeState();
  }
}

class XQAXHomeState extends State<XQAXHomePage> {
  late EasyRefreshController? _easyRefreshController;
  late ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _easyRefreshController = EasyRefreshController();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _easyRefreshController?.dispose();
    _scrollController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: EasyRefresh.custom(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
            _easyRefreshController?.finishRefresh();
          },
          slivers: [
            _buildSliverAppBar(),
            _buildSliverToBoxAdapter(),
            _buildVideoView(),
            // _buildBannerSwiper(),
            _buildListView(),
          ]),
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      backgroundColor: Colors.white,
      leading: _buildContainer(),
      leadingWidth: 80,
      floating: true,
      expandedHeight: 50,
      pinned: false,
    );
  }

  Container _buildContainer() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        children: [
          Image.asset("images/img_location.png"),
          const Text(
            "上海",
            style: TextStyle(
                color: Color(0xFF203152),
                fontSize: 15,
                fontWeight: FontWeight.w800),
          )
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildSliverToBoxAdapter() {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        height: 150,
        color: const Color(0xFF203152),
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/img_home__car_bg.png"),
                  fit: BoxFit.fill)),
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                      'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg'),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "沪A123456",
                        style: TextStyle(
                            color: Color(0xffffd2aa),
                            fontWeight: FontWeight.normal,
                            fontSize: 20),
                      ),
                      Expanded(
                        child: Row(
                          children: const [
                            Icon(
                              Icons.add_call,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                "宝马",
                                style: TextStyle(color: Colors.white12),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildVideoView() {
    return SliverToBoxAdapter(
        child: Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Tab(
            text: "碰撞视频",
            icon: Icon(Icons.add_call),
          ),
          Tab(
            text: "碰撞视频",
            icon: Icon(Icons.add_call),
          )
        ],
      ),
    ));
  }

  // SliverToBoxAdapter _buildBannerSwiper() {
  //   return SliverToBoxAdapter(
  //     child: Swiper(
  //       itemCount: 3,
  //       pagination: const SwiperPagination(),
  //       autoplay: true,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Image.network(
  //           "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.runoob.com%2Fcss%2Fcss-image-gallery.html&psig=AOvVaw11DREko-QaK0MZ3ZyNVLCy&ust=1646391339400000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCPjXu-njqfYCFQAAAAAdAAAAABAD",
  //           fit: BoxFit.cover,
  //         );
  //       },
  //     ),
  //   );
  // }

  SliverList _buildListView() {
    return SliverList(delegate: _sliverChildListDelegate());
  }

  SliverChildListDelegate _sliverChildListDelegate() {
    return SliverChildListDelegate([
      Container(
        height: 80,
        color: Colors.primaries[0],
      ),
      Container(
        height: 80,
        color: Colors.primaries[1],
      ),
      Container(
        height: 80,
        color: Colors.primaries[2],
      ),
      Container(
        height: 80,
        color: Colors.primaries[3],
      ),
      Container(
        height: 80,
        color: Colors.primaries[4],
      ),
      Container(
        height: 80,
        color: Colors.primaries[5],
      ),
      Container(
        height: 80,
        color: Colors.primaries[6],
      ),
      Container(
        height: 80,
        color: Colors.primaries[7],
      ),
      Container(
        height: 80,
        color: Colors.primaries[8],
      ),
      Container(
        height: 80,
        color: Colors.primaries[9],
      ),
      Container(
        height: 80,
        color: Colors.primaries[10],
      ),
    ]);
  }
}
