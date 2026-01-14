import 'dart:async';
import 'package:flutter/material.dart';
import 'package:baliiff_game/features/models/game_data.dart';
import 'package:baliiff_game/features/utils/language.dart';
import 'package:baliiff_game/features/screens/result.dart';

class PlayScreen extends StatefulWidget {
  final String scene;
  const PlayScreen({super.key, required this.scene});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  // Use late initialization for state management
  late List<String?> _selectedItems;
  late List<String?> _selectedPrices;
  late ScrollController _leftScrollController;
  late ScrollController _rightScrollController;
  bool _isScrolling = false;

  // Timer state
  Timer? _timer;
  int _timeRemaining = 90; // 10 seconds for testing
  final int _totalTime = 90;

  // Get scene key from display name for game data lookup
  String get _sceneKey {
    final language = LanguageHelper.currentLanguage;
    return LanguageHelper.getSceneKeyFromDisplayName(widget.scene, language);
  }

  @override
  void initState() {
    super.initState();
    final numDropdowns = GameData.getNumberOfDropdowns(_sceneKey);
    _selectedItems = List.filled(numDropdowns, null);
    _selectedPrices = List.filled(numDropdowns, null);
    _leftScrollController = ScrollController();
    _rightScrollController = ScrollController();

    // Synchronize scrolling
    _leftScrollController.addListener(_syncRightScroll);
    _rightScrollController.addListener(_syncLeftScroll);

    // Start timer
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_timeRemaining > 0) {
            _timeRemaining--;
          } else {
            _timer?.cancel();
            // Time is up, automatically calculate score
            _calculateScore();
          }
        });
      }
    });
  }

  void _syncRightScroll() {
    if (!_isScrolling) {
      _isScrolling = true;
      _rightScrollController.jumpTo(_leftScrollController.offset);
      _isScrolling = false;
    }
  }

  void _syncLeftScroll() {
    if (!_isScrolling) {
      _isScrolling = true;
      _leftScrollController.jumpTo(_rightScrollController.offset);
      _isScrolling = false;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _leftScrollController.removeListener(_syncRightScroll);
    _rightScrollController.removeListener(_syncLeftScroll);
    _leftScrollController.dispose();
    _rightScrollController.dispose();
    super.dispose();
  }

  void _calculateScore() {
    // Cancel timer if still running
    _timer?.cancel();

    int itemScore = 0; // Points for selecting items with prices
    int priceScore = 0; // Points for selecting correct prices
    final numDropdowns = GameData.getNumberOfDropdowns(_sceneKey);
    final totalPossibleScore =
        numDropdowns *
        2; // Each row can give 2 points max (1 for item, 1 for price)
    final language = LanguageHelper.currentLanguage;

    // Store results for each row
    List<Map<String, dynamic>> results = [];

    // Check each row to see if the selected item matches the selected price
    for (int i = 0; i < _selectedItems.length; i++) {
      final selectedItem = _selectedItems[i];
      final selectedPrice = _selectedPrices[i];

      // Check if item is selected (even if price is not selected)
      if (selectedItem != null) {
        final correctPrice = GameData.getPriceForItem(_sceneKey, selectedItem);
        // Only count items that have prices (not distractors)
        final itemHasPrice = correctPrice != null;

        // Award 1 point if the selected item has a price (even if price is not selected)
        if (itemHasPrice) {
          itemScore++;
        }

        // Only check price correctness if both item and price are selected
        bool isPriceCorrect = false;
        if (selectedPrice != null) {
          // Parse selectedPrice string - it could be "$50" (integer) or "$101-200" (price range)
          final selectedPriceWithoutDollar =
              selectedPrice.replaceAll('\$', '').trim();
          String selectedPriceRange;

          // Check if it's a price range (contains "-" or "or above" or "或以上")
          if (selectedPriceWithoutDollar.contains('-') ||
              selectedPriceWithoutDollar.contains('or above') ||
              selectedPriceWithoutDollar.contains('或以上')) {
            // It's already a price range, normalize it to match game data format
            // Handle "501 or above" vs "501 或以上" - normalize to match correctPrice format
            if (selectedPriceWithoutDollar.contains('501')) {
              // Check what format the correct price uses
              if (correctPrice != null && correctPrice!.contains('或以上')) {
                selectedPriceRange = '501 或以上';
              } else {
                selectedPriceRange = '501 or above';
              }
            } else {
              selectedPriceRange = selectedPriceWithoutDollar;
            }
          } else {
            // It's an integer price, convert to price range
            final selectedPriceInt =
                int.tryParse(selectedPriceWithoutDollar) ?? 0;
            final priceOrAbove =
                language == Language.chinese ? '或以上' : 'or above';
            if (selectedPriceInt <= 50) {
              selectedPriceRange = '1-50';
            } else if (selectedPriceInt <= 100) {
              selectedPriceRange = '51-100';
            } else if (selectedPriceInt <= 200) {
              selectedPriceRange = '101-200';
            } else if (selectedPriceInt <= 500) {
              selectedPriceRange = '201-500';
            } else {
              selectedPriceRange = '501 $priceOrAbove';
            }
          }
          // Trim both strings for comparison to avoid whitespace issues
          isPriceCorrect =
              itemHasPrice &&
              correctPrice != null &&
              correctPrice!.trim() == selectedPriceRange.trim();

          // Award 1 point if the selected price matches the correct price
          if (isPriceCorrect) {
            priceScore++;
          }
        }

        results.add({
          'item': selectedItem,
          'selectedPrice': selectedPrice,
          'correctPrice': correctPrice,
          'itemHasPrice': itemHasPrice,
          'isPriceCorrect': isPriceCorrect,
        });
      } else {
        // Add row with N/A for empty selections
        results.add({
          'item': selectedItem,
          'selectedPrice': selectedPrice,
          'correctPrice': null,
          'itemHasPrice': false,
          'isPriceCorrect': false,
        });
      }
    }

    // Total score is the sum of item points and price points
    final totalScore = itemScore + priceScore;

    // Show score dialog (non-dismissible - only Result button can close it)
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (BuildContext context) {
        return PopScope(
          canPop: false, // Prevent dismissing with back button
          child: Dialog(
            backgroundColor: Colors.blueGrey.shade900,
            child: Container(
              padding: const EdgeInsets.all(20),
              constraints: const BoxConstraints(maxWidth: 800),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Headers
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[700],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              LanguageHelper.getSelectItemText(language),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.teal.shade200,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              LanguageHelper.getSelectPriceText(language),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    // Results rows
                    ...results.map((result) {
                      final itemHasPrice = result['itemHasPrice'] as bool;
                      final isPriceCorrect = result['isPriceCorrect'] as bool;
                      final itemName = result['item'] as String?;
                      final selectedPrice = result['selectedPrice'] as String?;
                      final correctPrice = result['correctPrice'] as String?;

                      // Check if item or price is empty
                      final itemIsEmpty = itemName == null;
                      final priceIsEmpty = selectedPrice == null;

                      // Item is correct if it has a price (1 point)
                      final itemIsCorrect = !itemIsEmpty && itemHasPrice;
                      // Price is correct if the selected price matches the correct price (1 point)
                      final priceIsCorrect =
                          !itemIsEmpty && !priceIsEmpty && isPriceCorrect;

                      // Item cell: green if item has a price, red if it doesn't or is empty
                      final itemBackgroundColor =
                          itemIsCorrect ? Colors.green : Colors.red;
                      // Price cell: green if price matches, red if it doesn't (or if item has no price or is empty)
                      final priceBackgroundColor =
                          priceIsCorrect ? Colors.green : Colors.red;

                      // Get display text for item and price
                      final String itemDisplayText =
                          itemIsEmpty
                              ? LanguageHelper.getNotAvailable(language)
                              : itemName!;

                      final String priceDisplayText =
                          priceIsEmpty
                              ? LanguageHelper.getNotAvailable(language)
                              : selectedPrice!; // Display the selected price string directly

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: itemBackgroundColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        itemDisplayText,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      itemIsCorrect ? Icons.check : Icons.close,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: priceBackgroundColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        priceDisplayText,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      priceIsCorrect
                                          ? Icons.check
                                          : Icons.close,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: 30),
                    // Score
                    Text(
                      '${LanguageHelper.getAccuracy(language)}: $totalScore/$totalPossibleScore',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Result button
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(); // Close dialog
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ResultScreen(
                                  correctCount: totalScore,
                                  totalItems: totalPossibleScore,
                                ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          LanguageHelper.getResult(language),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool> _onWillPop() async {
    final language = LanguageHelper.currentLanguage;
    final shouldPop = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            padding: const EdgeInsets.all(40),
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  LanguageHelper.getConfirmGoBack(language),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                // Message
                Text(
                  LanguageHelper.getWorkWillBeLost(language),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Cancel button
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(false); // Don't go back
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          LanguageHelper.getCancel(language),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Go Back button
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(true); // Go back
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          LanguageHelper.getGoBack(language),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    return shouldPop ?? false;
  }

  // Get available items for a specific dropdown (excludes items selected in other dropdowns)
  List<String> _getAvailableItemsForDropdown(int dropdownIndex) {
    final allItems = GameData.getItemNamesForScene(_sceneKey);
    // Get items selected in other dropdowns
    final selectedInOtherDropdowns = <String>{};
    for (int i = 0; i < _selectedItems.length; i++) {
      if (i != dropdownIndex && _selectedItems[i] != null) {
        selectedInOtherDropdowns.add(_selectedItems[i]!);
      }
    }
    // Filter out items that are selected in other dropdowns
    // But keep the currently selected item in this dropdown
    return allItems.where((item) {
      if (item == _selectedItems[dropdownIndex]) {
        return true; // Keep the currently selected item
      }
      return !selectedInOtherDropdowns.contains(
        item,
      ); // Exclude items selected elsewhere
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final language = LanguageHelper.currentLanguage;
    final prices = GameData.getPricesForScene(_sceneKey);
    final numDropdowns = GameData.getNumberOfDropdowns(_sceneKey);

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (!didPop) {
          final shouldPop = await _onWillPop();
          if (shouldPop && context.mounted) {
            Navigator.of(context).pop();
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  LanguageHelper.getPlayMessage(language),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                // Timer bar
                Row(
                  children: [
                    // Stopwatch icon
                    Icon(
                      Icons.timer,
                      color: Colors.blueGrey.shade900,
                      size: 30,
                    ),
                    const SizedBox(width: 10),
                    // Timer progress bar
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final progress =
                              (_totalTime - _timeRemaining) / _totalTime;
                          return Stack(
                            children: [
                              // Gradient background bar
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lime.shade400,
                                      Colors.yellow.shade400,
                                      Colors.pink.shade400,
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 2,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                              ),
                              // Grey overlay that fills from right to left
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 100),
                                    height: 30,
                                    width: constraints.maxWidth * progress,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                // Header row
                Row(
                  children: [
                    // Left column header - Items
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          LanguageHelper.getSelectItem(language),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    // Right column header - Prices
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.teal.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          LanguageHelper.getSelectPrice(language),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                // Dropdown columns
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left column - Items
                      Expanded(
                        child: SingleChildScrollView(
                          controller: _leftScrollController,
                          child: Column(
                            children: List.generate(numDropdowns, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: DropdownButtonFormField<String>(
                                  value: _selectedItems[index],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 16,
                                    ),
                                  ),
                                  hint: Center(
                                    child: Text(
                                      LanguageHelper.getSelectItemPlaceholder(
                                        language,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  isExpanded: true,
                                  selectedItemBuilder: (BuildContext context) {
                                    final availableItems =
                                        _getAvailableItemsForDropdown(index);
                                    return availableItems.map((item) {
                                      return Text(
                                        item,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      );
                                    }).toList();
                                  },
                                  items: () {
                                    final availableItems =
                                        _getAvailableItemsForDropdown(index);
                                    return availableItems.map((item) {
                                      return DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                        ),
                                      );
                                    }).toList();
                                  }(),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedItems[index] = value;
                                    });
                                  },
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      // Right column - Prices
                      Expanded(
                        child: SingleChildScrollView(
                          controller: _rightScrollController,
                          child: Column(
                            children: List.generate(numDropdowns, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: DropdownButtonFormField<String>(
                                  value: _selectedPrices[index],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Colors.teal.shade50,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Colors.teal.shade50,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.teal.shade50,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 16,
                                    ),
                                  ),
                                  hint: Center(
                                    child: Text(
                                      LanguageHelper.getSelectPricePlaceholder(
                                        language,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  isExpanded: true,
                                  selectedItemBuilder: (BuildContext context) {
                                    return prices.map((price) {
                                      return Center(
                                        child: Text(
                                          '\$$price',
                                          textAlign: TextAlign.center,
                                        ),
                                      );
                                    }).toList();
                                  },
                                  items:
                                      prices.map((price) {
                                        return DropdownMenuItem<String>(
                                          value: '\$$price',
                                          child: Text('\$$price'),
                                        );
                                      }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedPrices[index] = value;
                                    });
                                  },
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Confirm Button
                // Center(
                //   child: GestureDetector(
                //     onTap: _calculateScore,
                //     child: Container(
                //       padding: const EdgeInsets.symmetric(
                //         horizontal: 80,
                //         vertical: 18,
                //       ),
                //       decoration: BoxDecoration(
                //         color: Colors.deepOrange,
                //         borderRadius: BorderRadius.circular(30),
                //       ),
                //       child: Text(
                //         LanguageHelper.getConfirm(language),
                //         style: const TextStyle(
                //           color: Colors.white,
                //           fontSize: 24,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap: _calculateScore,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 80,
                      vertical: 30,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          LanguageHelper.getConfirm(language),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 28,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
