import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 104, 157, 193),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(child: Toolbar()),
        ),
      ),
    );
  }
}

class Toolbar extends StatelessWidget {
  const Toolbar({super.key});
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Change password',
              style: Theme.of(context).textTheme.headlineMedium),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              decoration: const InputDecoration(hintText: 'New password'),
            ),
          ),
          const TextButton(
            onPressed: null,
            child: Text('Change'),
          ),
          const Divider(
            height: 20, // 分割线的高度，默认为16
            thickness: 2, // 分割线的厚度，默认为1
            indent: 20, // 分割线左侧的空白区域
            endIndent: 20, // 分割线右侧的空白区域
            color: Colors.grey, // 分割线的颜色
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
              Navigator.pushNamed(context, '/');
            },
            child: const Text('Sign out'),
          ),
          const SizedBox(height: 12), 
        ],
      ),
    );
  }
}
