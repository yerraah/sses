import 'package:flutter/material.dart';
import 'package:form_app/features/login/presentation/pages/fourth_page.dart';
import 'package:form_app/features/login/presentation/pages/main_page.dart';
import 'package:form_app/features/login/presentation/pages/second_page.dart';
import 'package:form_app/features/login/presentation/pages/third_page.dart';

/// Widget, отображающий страницу с нижней навигационной панелью.
class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int pageIndex = 0; // Индекс текущей выбранной страницы

  // Список страниц для отображения в нижней навигационной панели
  final pages = [
    StoriesPage(),
    SecondPage(),
    ThirdPage(), // Помните исправить опечатку в имени класса
    const FourthPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "InUIBgram",
          style: TextStyle(
            color: Color(0xFF1C7E66),
            fontSize: 30,
            fontWeight: FontWeight.w600,
            fontFamily: 'Baloo',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: pages[pageIndex], // Отображаемая страница на основе индекса
      bottomNavigationBar:
          _buildMyNavBar(context), // Нижняя навигационная панель
    );
  }

  /// Создание нижней навигационной панели.
  Container _buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Color(0xFF1C7E66),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
                    Icons.home_filled,
                    color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: Colors.black,
                    size: 35,
                  ),
          ),
          // Остальные IconButton'ы для других страниц аналогично...
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
                    Icons.qr_code_rounded,
                    color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.qr_code_outlined,
                    color: Colors.black,
                    size: 35,
                  ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
                    Icons.widgets_rounded,
                    color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.widgets_outlined,
                    color: Colors.black,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.person_outline,
                    color: Colors.black,
                    size: 35,
                  ),
          ),
        ],
      ),
    );
  }
}
