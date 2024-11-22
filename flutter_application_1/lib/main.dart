import 'package:flutter/material.dart';
import 'home.dart';
import 'blog.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // 使用Material 3
        useMaterial3: true,
        // 配置你的主题
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        // 其他主题设置
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        // 按钮主题
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        // 文本主题
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 24, // 设置字体大小
            fontWeight: FontWeight.bold, // 设置字体粗细
            color: Colors.black, // 设置字体颜色
            // 你还可以添加其他样式
          ),
          headlineSmall: TextStyle(
            fontSize: 16, // 设置字体大小
            color: Colors.black, // 设置字体颜色
            // 你还可以添加其他样式
          ),
        ),
      ),
      routes: {
        'main': (context) => const HomePage(),
        'login': (context) => const SignUpApp(),
        'blog': (context) => const BlogPage(),
        '/': (context) => const WelcomePage(),
      },
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
                  child: Center(
                    child: Text(
                      "Erica N",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: Colors.white), // 设置字体颜色为白色
                    ),
                  ),
                ),
                SizedBox(
                  // height: 400,
                  width: 360,
                  child: Card(
                    child: Menu(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class Menu extends StatelessWidget {
//   const Menu({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           TextButton(
//             style: ButtonStyle(
//               foregroundColor: WidgetStateProperty.resolveWith((states) {
//                 return states.contains(WidgetState.disabled)
//                     ? null
//                     : Colors.white;
//               }),
//               backgroundColor: WidgetStateProperty.resolveWith((states) {
//                 return states.contains(WidgetState.disabled)
//                     ? null
//                     : Colors.blue;
//               }),
//             ),
//             onPressed: () {
//               print("OK");
//             },
//             child: const Text(
//               'Sign up',
//               style: TextStyle(
//                 color: Colors.white, // 将字体颜色设置为白色
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _LoginFormState();
}

class _LoginFormState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // 设置主轴对齐为居中
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'main');
                },
                child: const Text('Continue'),
              ),
              const SizedBox(width: 12), // 改为 width，使用水平间距
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                child: const Text('Register'),
              ),
            ],
          )),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
