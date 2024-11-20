import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
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
      backgroundColor: Color.fromARGB(255, 104, 157, 193),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: 400,
              child: Card(child: UserInfo()),
            ),
            SizedBox(
              width: 400,
              height: 100,
              child: Card(child: Hitokoto()),
            ),
          ],
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter 顶栏示例',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(

//         body: Center(
//           child: Text('欢迎使用 Flutter!'),
//         ),
//       ),
//     );
//   }
// }

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final TextEditingController _passwordController = TextEditingController();
  
  @override
  void dispose() {
    _passwordController.dispose(); // 释放控制器
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Text('用户信息', style: Theme.of(context).textTheme.headlineMedium),
          const Divider(
            indent: 10,
            endIndent: 10,
            color: Color.fromARGB(41, 0, 0, 0),
          ),
          Text('修改密码', style: Theme.of(context).textTheme.headlineSmall),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                TextFormField(
                  controller: _passwordController, // 设置控制器
                  decoration: const InputDecoration(hintText: 'New password'),
                  onChanged: (value) {
                    setState(() {}); // 输入框内容变化时调用 setState 更新界面
                  },
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: _passwordController.text.isNotEmpty ? () {
                    Navigator.pushNamed(context, '/');
                  } : null, // 如果输入框不为空，则启用该按钮
                  child: const Text('Change'),
                ),
              ],
            ),
          ),
          const Divider(
            indent: 10,
            endIndent: 10,
            color: Color.fromARGB(41, 0, 0, 0),
          ),
          Text('操作', style: Theme.of(context).textTheme.headlineSmall),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.resolveWith((states) {
                      return states.contains(WidgetState.disabled) ? null : Colors.white;
                    }),
                    backgroundColor: WidgetStateProperty.resolveWith((states) {
                      return states.contains(WidgetState.disabled) ? null : Colors.blue;
                    }),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: const Text('Sign out'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}


class Hitokoto extends StatefulWidget {
  const Hitokoto({super.key});
  @override
  _HitokotoState createState() => _HitokotoState();
}

class _HitokotoState extends State<Hitokoto> {
  String hitokoto = '';

  @override
  void initState() {
    super.initState();
    fetchHitokoto();
  }

  Future<void> fetchHitokoto() async {
    final response = await http.get(Uri.parse('https://v1.hitokoto.cn/'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        hitokoto = data['hitokoto'];
      });
    } else {
      throw Exception('请求失败，状态码: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Center(
        child: SizedBox(
          child: SelectableText(
            hitokoto.isNotEmpty ? hitokoto : '加载中...',
            style: TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
