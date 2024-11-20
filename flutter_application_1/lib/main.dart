import 'package:flutter/material.dart';
import 'home.dart';
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
        'login':(context)=>const SignUpApp(),
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
          const Center(
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  // height: 400,
                  width: 360,
                  child: Card(
                    child: LoginForm(),
                  ),
                ),
                SizedBox(
                  // height: 400,
                  width: 360,
                  child: Card(
                    child: RegForm(),
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

// class LoginForm extends StatelessWidget {
//   const LoginForm({super.key});
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

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Sign up', style: Theme.of(context).textTheme.headlineMedium),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: _firstNameTextController,
              decoration: const InputDecoration(hintText: 'Username'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: _lastNameTextController,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.resolveWith((states) {
                return states.contains(WidgetState.disabled)
                    ? null
                    : Colors.white;
              }),
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                return states.contains(WidgetState.disabled)
                    ? null
                    : Colors.blue;
              }),
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'main');
            },
            child: const Text('Continue'),
          ),
          const SizedBox(height: 12), 
        ],
      ),
    );
  }
}

class RegForm extends StatefulWidget {
  const RegForm({super.key});

  @override
  State<RegForm> createState() => _RegFormState();
}

class _RegFormState extends State<RegForm> {
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _usernameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Register', style: Theme.of(context).textTheme.headlineMedium),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: _firstNameTextController,
              decoration: const InputDecoration(hintText: 'Username'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: _lastNameTextController,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: _usernameTextController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.resolveWith((states) {
                return states.contains(WidgetState.disabled)
                    ? null
                    : Colors.white;
              }),
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                return states.contains(WidgetState.disabled)
                    ? null
                    : Colors.blue;
              }),
            ),
            onPressed: () {Navigator.pushNamed(context, 'login');},
            child: Text('Register'),
          ),
          const SizedBox(height: 12), 
        ],
      ),
    );
  }
}
