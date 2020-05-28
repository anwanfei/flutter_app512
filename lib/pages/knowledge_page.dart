import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class KnowledgePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _KnowledgePage();
  }
}

class _KnowledgePage extends State<KnowledgePage> {
  List<String> imgs = [
    "http://ww4.sinaimg.cn/large/7a8aed7bjw1exp4h479xfj20hs0qoq6t.jpg",
    "http://ww1.sinaimg.cn/large/0065oQSqly1frepozc5taj30qp0yg7aq.jpg",
    "http://ww1.sinaimg.cn/large/0065oQSqly1frept5di16j30p010g0z9.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 180,
        child: Swiper(
          autoplay: true,
          pagination: SwiperPagination(),//添加indicator
          itemCount: imgs.length,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              imgs[index],
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
