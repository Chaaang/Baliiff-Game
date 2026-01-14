import 'package:baliiff_game/features/screens/rule.dart';
import 'package:flutter/material.dart';
import 'package:baliiff_game/features/components/my_button.dart';
import 'package:baliiff_game/features/utils/language.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          LanguageHelper.getSelectScene(language),
          style: const TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //const SizedBox(height: 20),
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
                              text: LanguageHelper.getServiceShop(language, 1),
                              color: Colors.orange,
                              onTap:
                                  () => _onSceneTap(
                                    context,
                                    LanguageHelper.getServiceShop(language, 1),
                                  ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Expanded(
                            child: MyButton(
                              text: LanguageHelper.getServiceShop(language, 2),
                              color: Colors.orange,
                              onTap:
                                  () => _onSceneTap(
                                    context,
                                    LanguageHelper.getServiceShop(language, 2),
                                  ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Expanded(
                            child: MyButton(
                              text: LanguageHelper.getServiceShop(language, 3),
                              color: Colors.orange,
                              onTap:
                                  () => _onSceneTap(
                                    context,
                                    LanguageHelper.getServiceShop(language, 3),
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
                              text: LanguageHelper.getRestaurant(language, 1),
                              color: Colors.purple,
                              onTap:
                                  () => _onSceneTap(
                                    context,
                                    LanguageHelper.getRestaurant(language, 1),
                                  ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Expanded(
                            child: MyButton(
                              text: LanguageHelper.getRestaurant(language, 2),
                              color: Colors.purple,
                              onTap:
                                  () => _onSceneTap(
                                    context,
                                    LanguageHelper.getRestaurant(language, 2),
                                  ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Expanded(
                            child: MyButton(
                              text: LanguageHelper.getRestaurant(language, 3),
                              color: Colors.purple,
                              onTap:
                                  () => _onSceneTap(
                                    context,
                                    LanguageHelper.getRestaurant(language, 3),
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
      ),
    );
  }
}
