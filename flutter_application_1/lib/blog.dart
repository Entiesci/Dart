import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        appBar: AppBar(
          title: Text('主页'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // 点击搜索按钮时的操作
                print('搜索按钮被点击');
              },
            ),
            SizedBox(width: 16), // 在按钮右侧留白
          ],
        ),

        body:Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity, // 设置为最大高度
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://tse2-mm.cn.bing.net/th/id/OIP-C.reNEd70TiQ_ZAUbGu5oi6AHaEK?rs=1&pid=ImgDetMain',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1, // 设置左侧栏的比例
                  child: LeftRaw()
                ),
                Expanded(
                  flex: 2, // 设置右侧栏的比例
                  child: RightRaw()
                ),
              ],
            
          ),
          ],
        )
    );
  }
}


class LeftRaw extends StatelessWidget{
  const LeftRaw({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children:const [
        Card(
          child: SizedBox(
            width: double.infinity,
          child: Text('L')

          )
        ),
        

      ]
      
    );
  }
}

class RightRaw extends StatelessWidget{
  const RightRaw({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children:const [
        Card(
          child: SizedBox(
            width: double.infinity,
          child: Text('R')

          )
        ),
        

      ]
      
    );
  }
}
