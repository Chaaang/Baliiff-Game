import 'package:baliiff_game/features/screens/rule.dart';
import 'package:baliiff_game/features/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:baliiff_game/features/components/my_button.dart';
import 'package:baliiff_game/features/utils/language.dart';
import 'package:baliiff_game/features/components/background_wrapper.dart';

class SceneScreen extends StatelessWidget {
  const SceneScreen({super.key});

  void _onSceneTap(BuildContext context, String scene) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RuleScreen(scene: scene)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final language = LanguageHelper.currentLanguage;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: BackgroundWrapper(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 80.0,
                vertical: 90.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //const SizedBox(height: 20),
                  Text(
                    LanguageHelper.getSelectScene(language),
                    style: const TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left column - Orange buttons
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: MyButton(
                                  text: LanguageHelper.getServiceShop(
                                    language,
                                    1,
                                  ),
                                  color: Colors.orange,
                                  onTap:
                                      () => _onSceneTap(
                                        context,
                                        LanguageHelper.getServiceShop(
                                          language,
                                          1,
                                        ),
                                      ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Expanded(
                                child: MyButton(
                                  text: LanguageHelper.getServiceShop(
                                    language,
                                    2,
                                  ),
                                  color: Colors.orange,
                                  onTap:
                                      () => _onSceneTap(
                                        context,
                                        LanguageHelper.getServiceShop(
                                          language,
                                          2,
                                        ),
                                      ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Expanded(
                                child: MyButton(
                                  text: LanguageHelper.getServiceShop(
                                    language,
                                    3,
                                  ),
                                  color: Colors.orange,
                                  onTap:
                                      () => _onSceneTap(
                                        context,
                                        LanguageHelper.getServiceShop(
                                          language,
                                          3,
                                        ),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 50),
                        // Right column - Teal buttons
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: MyButton(
                                  text: LanguageHelper.getHome(language, 1),
                                  color: Colors.teal,
                                  onTap:
                                      () => _onSceneTap(
                                        context,
                                        LanguageHelper.getHome(language, 1),
                                      ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Expanded(
                                child: MyButton(
                                  text: LanguageHelper.getHome(language, 2),
                                  color: Colors.teal,
                                  onTap:
                                      () => _onSceneTap(
                                        context,
                                        LanguageHelper.getHome(language, 2),
                                      ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Expanded(
                                child: MyButton(
                                  text: LanguageHelper.getHome(language, 3),
                                  color: Colors.teal,
                                  onTap:
                                      () => _onSceneTap(
                                        context,
                                        LanguageHelper.getHome(language, 3),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 70),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Lower left column - Green buttons
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: MyButton(
                                  text: LanguageHelper.getOffice(language, 1),
                                  color: Colors.green,
                                  onTap:
                                      () => _onSceneTap(
                                        context,
                                        LanguageHelper.getOffice(language, 1),
                                      ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Expanded(
                                child: MyButton(
                                  text: LanguageHelper.getOffice(language, 2),
                                  color: Colors.green,
                                  onTap:
                                      () => _onSceneTap(
                                        context,
                                        LanguageHelper.getOffice(language, 2),
                                      ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Expanded(
                                child: MyButton(
                                  text: LanguageHelper.getOffice(language, 3),
                                  color: Colors.green,
                                  onTap:
                                      () => _onSceneTap(
                                        context,
                                        LanguageHelper.getOffice(language, 3),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 50),
                        // Lower right column - Purple buttons
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: MyButton(
                                  text: LanguageHelper.getRestaurant(
                                    language,
                                    1,
                                  ),
                                  color: Colors.purple,
                                  onTap:
                                      () => _onSceneTap(
                                        context,
                                        LanguageHelper.getRestaurant(
                                          language,
                                          1,
                                        ),
                                      ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Expanded(
                                child: MyButton(
                                  text: LanguageHelper.getRestaurant(
                                    language,
                                    2,
                                  ),
                                  color: Colors.purple,
                                  onTap:
                                      () => _onSceneTap(
                                        context,
                                        LanguageHelper.getRestaurant(
                                          language,
                                          2,
                                        ),
                                      ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Expanded(
                                child: MyButton(
                                  text: LanguageHelper.getRestaurant(
                                    language,
                                    3,
                                  ),
                                  color: Colors.purple,
                                  onTap:
                                      () => _onSceneTap(
                                        context,
                                        LanguageHelper.getRestaurant(
                                          language,
                                          3,
                                        ),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Home icon button at bottom right
            Positioned(
              bottom: 30,
              right: 30,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (route) => false,
                  );
                },
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.home,
                    color: Colors.blueGrey,
                    size: 50,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
