import 'package:flutter/cupertino.dart';
import 'features/contrast/pages/contrast_page.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: ContrastPage(),
    );
  }
}
