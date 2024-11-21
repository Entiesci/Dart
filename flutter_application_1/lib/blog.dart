import 'package:flutter/material.dart';
import 'dart:ui';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '主页',
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255), // 设置字体颜色为黑色
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 44, 44, 44),
          actions: [
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
                    height: 300,
                    width: 800,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5), // 半透明背景
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
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
  // 在这里添加数据库查询逻辑
  // 返回一个包含标题的列表
  return ['标题1', '标题2', '标题3']; // 示例数据
}

// class RightRow extends StatelessWidget {
//   const RightRow({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<String>>(
//       future: fetchArticleTitles(), // 从数据库获取文章标题的函数
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('出错了：${snapshot.error}'));
//         } else {
//           final titles = snapshot.data ?? [];
//           return ListView.builder(
//             itemCount: titles.length,
//             itemBuilder: (context, index) {
//               return Card(
//                 child: SizedBox(
//                   width: double.infinity,
//                   height: 400,
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text(titles[index]), // 显示文章标题
//                   ),
//                 ),
//               );
//             },
//           );
//         }
//       },
//     );

//   }
// }

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



// class RightRow extends StatelessWidget {
//   const RightRow({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return 
//             Center(
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
//                 child: Container(
//                   width: 300,
//                   height: 200,
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.5), // 半透明背景
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black26,
//                         blurRadius: 10.0,
//                         offset: Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           '透明毛玻璃效果',
//                           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 10),
//                         Text('这是一个示例卡片。'),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
        

    
//   }
// }
