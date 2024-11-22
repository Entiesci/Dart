import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BlogPage',
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255), // 设置字体颜色为黑色
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 44, 44, 44),
          actions: [
            IconButton(
              icon: Icon(
                Icons.note,
                color: const Color.fromARGB(255, 248, 248, 248), // 设置图标颜色为黑色
              ),
              onPressed: () {
                // 点击搜索按钮时的操作
                print('搜索按钮被点击');
              },
            ),
            IconButton(
              icon: Icon(
                Icons.link,
                color: const Color.fromARGB(255, 248, 248, 248), // 设置图标颜色为黑色
              ),
              onPressed: () async {
                const url = 'https://a.com'; // 你要跳转的链接
                if (await canLaunchUrl(Uri.parse(url))) {
  await launchUrl(Uri.parse(url)); // 使用 Uri.parse(url)
}
              },
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: const Color.fromARGB(255, 248, 248, 248), // 设置图标颜色为黑色
              ),
              onPressed: () {
                // 点击搜索按钮时的操作
                print('搜索按钮被点击');
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity, // 设置为最大高度
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://pic3.zhimg.com/v2-5523ed93593ee4c7fd97b972d0af92d3_r.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Row(
                children: const [
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(flex: 2, child: LeftRow()),
                  // Expanded(
                  //     flex: 1,
                  //     child: SizedBox()),
                  Expanded(
                      flex: 4, // 设置右侧栏的比例
                      child: RightRow()),
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class LeftRow extends StatelessWidget {
  const LeftRow({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: fetchAnnounceTitles(), // 从数据库获取文章标题的函数
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('出错了：${snapshot.error}'));
        } else {
          final titles = snapshot.data ?? [];
          return ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 120,
                    width: 800,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5), // 半透明背景
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 16.0), // 设置左侧留白，16.0是留白的大小
                          child: Text(
                            titles[index],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(""),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        }
      },

      // Card(
      //   // child: SizedBox(
      //   //   width: double.infinity,
      //   // child: Text('L')

      //   // )

      // ),
    );
  }
}

Future<List<String>> fetchArticleTitles() async {
  return ['标题1', '标题2', '标题3'];
}

Future<List<String>> fetchAnnounceTitles() async {
  return ['欢迎来到我的 Blog', '目录', '评论'];
}

class RightRow extends StatelessWidget {
  const RightRow({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: fetchArticleTitles(), // 从数据库获取文章标题的函数
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('出错了：${snapshot.error}'));
        } else {
          final titles = snapshot.data ?? [];
          return ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 400,
                    width: 900,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5), // 半透明背景
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '透明毛玻璃效果',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(titles[index]),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }
}
