import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class XQAXHomePage extends StatefulWidget {
  const XQAXHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return XQAXHomeState();
  }
}

class XQAXHomeState extends State<XQAXHomePage> {
  late EasyRefreshController _easyRefreshController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _easyRefreshController = EasyRefreshController();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _easyRefreshController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: EasyRefresh.custom(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
            _easyRefreshController.finishRefresh();
          },
          slivers: [
            _buildSliverAppBar(),
            _buildSliverToBoxAdapter(),
            _buildBannerSwiper(),
            _buildVideoView(),
            _buildListView(),
          ]),
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
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
        child: const Center(
          child: Text(
            "沪A123456",
            style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildVideoView() {
    return SliverToBoxAdapter(
        child: Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      height: 100,
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

  SliverToBoxAdapter _buildBannerSwiper() {
    return SliverToBoxAdapter(
      child: Swiper(
        itemCount: 3,
        duration: 1000,
        transformer: ScaleAndFadeTransformer(),
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.runoob.com%2Fcss%2Fcss-image-gallery.html&psig=AOvVaw11DREko-QaK0MZ3ZyNVLCy&ust=1646391339400000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCPjXu-njqfYCFQAAAAAdAAAAABAD",
            fit: BoxFit.fill,
          );
        },
      ),
    );
  }

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
