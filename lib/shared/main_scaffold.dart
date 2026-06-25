import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../features/contrast/pages/contrast_page.dart';
//import '../features/community/pages/community_feed_page.dart';
import '../features/auth/pages/login_page.dart';

/// Widget que serve como a "casca" do aplicativo, contendo a barra de menu inferior.
class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  // Lista de páginas que serão alternadas pelo menu
  final List<Widget> _pages = [
    const ContrastPage(),
    //const CommunityFeedPage(),
    const LoginPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // O corpo muda conforme o ícone clicado no menu
      body: _pages[_currentIndex],

      // Barra de Menu Inferior (Identidade Visual: Azul Petróleo)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: AppColors.tealBlue,
        selectedItemColor: AppColors.lightYellow,
        unselectedItemColor: AppColors.lightYellow.withOpacity(0.5),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.compare),
            label: 'Contraste',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.people),
          //   label: 'Comunidade',
          // ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
