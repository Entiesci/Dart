import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/': (context) => const WelcomePage()},
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
                  'https://th.bing.com/th/id/R.78f4f583b6035ccb0694cecf8020ade9?rik=hjn8zM9j0lvC6w&pid=ImgRaw&r=0',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Center(
            child: Column(
              children: [
                SizedBox(height: 20), // 可选：用于调整间距
                LoginForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
            onPressed: (){
              print("OK");
            },
            child: const Text(
              'Sign up',
              style: TextStyle(
                color: Colors.white, // 将字体颜色设置为白色
              ),
            ),
          ),
        ],
      ),
    );
  }
}
