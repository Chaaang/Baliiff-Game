import 'package:flutter/material.dart';
import 'package:baliiff_game/features/utils/language.dart';
import 'package:baliiff_game/features/screens/scene.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ' 請選擇語言：',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text(
                'Please Select Language:',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(400, 150), // width, height
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {
                  LanguageHelper.setLanguage(Language.chinese);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SceneScreen(),
                    ),
                  );
                },
                child: Text(
                  '中文',
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(400, 150), // width, height
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  LanguageHelper.setLanguage(Language.english);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SceneScreen(),
                    ),
                  );
                },
                child: Text(
                  'ENG',
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
