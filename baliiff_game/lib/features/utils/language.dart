enum Language { chinese, english }

class LanguageHelper {
  static Language _currentLanguage = Language.chinese;

  static Language get currentLanguage => _currentLanguage;

  static void setLanguage(Language language) {
    _currentLanguage = language;
  }

  // Rule screen texts
  static String getGamePlayTitle(Language lang) {
    return lang == Language.chinese ? '遊戲玩法' : 'Game Play';
  }

  static String getRule1(Language lang) {
    return lang == Language.chinese
        ? '細心觀察相片, 找出物品並選擇相對的估算價值。'
        : 'Carefully observe the photos, find the items and select the corresponding appraisal option.';
  }

  static String getRule2(Language lang) {
    return lang == Language.chinese
        ? '估價基礎:假定為二手市場價格。'
        : 'Appraisal background: Assumed to be second-hand market prices.';
  }

  static String getRule3(Language lang) {
    return lang == Language.chinese ? '遊戲時間為90秒。' : 'Game time is 90 seconds';
  }

  static String getRule4(Language lang) {
    return lang == Language.chinese
        ? '找出5件物件和相對的價值共10個答案。'
        : 'Find 5 items and their relative values (10 answers in total)';
  }

  static String getStartGame(Language lang) {
    return lang == Language.chinese ? '開始遊戲' : 'Start Game';
  }

  // Scene screen texts
  static String getSelectScene(Language lang) {
    return lang == Language.chinese ? '請選擇場景:' : 'Please Select the Scene:';
  }

  static String getServiceShop(Language lang, int number) {
    return lang == Language.chinese ? '時裝店($number)' : 'Boutique ($number)';
  }

  static String getHome(Language lang, int number) {
    return lang == Language.chinese ? '家居($number)' : 'Domestic ($number)';
  }

  static String getOffice(Language lang, int number) {
    return lang == Language.chinese ? '辦公室($number)' : 'Office ($number)';
  }

  static String getRestaurant(Language lang, int number) {
    return lang == Language.chinese ? '餐廳($number)' : 'Restaurant ($number)';
  }

  // Play screen texts
  static String getSelectItem(Language lang) {
    return lang == Language.chinese ? '扣押物品' : 'Please select item:';
  }

  static String getSelectPrice(Language lang) {
    return lang == Language.chinese ? '估算價值' : 'Please select price:';
  }

  static String getSelectItemPlaceholder(Language lang) {
    return lang == Language.chinese ? '點擊選擇物品' : 'Select item';
  }

  static String getSelectPricePlaceholder(Language lang) {
    return lang == Language.chinese ? '點擊選擇價值' : 'Select price';
  }

  static String getSelectItemText(Language lang) {
    return lang == Language.chinese ? '物品' : 'Item';
  }

  static String getSelectPriceText(Language lang) {
    return lang == Language.chinese ? '價格' : 'Price';
  }

  static String getConfirm(Language lang) {
    return lang == Language.chinese ? '提交' : 'Submit';
  }

  static String getResult(Language lang) {
    return lang == Language.chinese ? '查看成績' : 'Result';
  }

  static String getGameOver(Language lang) {
    return lang == Language.chinese ? '遊戲結束' : 'Game Over';
  }

  static String getRating(Language lang) {
    return lang == Language.chinese ? '評級:' : 'Rating:';
  }

  static String getGoodStep(Language lang) {
    return lang == Language.chinese
        ? '已踏出良好的一步,'
        : 'You have taken a good step,';
  }

  static String getKeepWorking(Language lang) {
    return lang == Language.chinese ? '繼續努力。' : 'Keep up the hard work.';
  }

  static String getRestart(Language lang) {
    return lang == Language.chinese ? '重新開始' : 'Restart';
  }

  static String getConfirmGoBack(Language lang) {
    return lang == Language.chinese
        ? '確定要返回嗎？'
        : 'Are you sure you want to go back?';
  }

  static String getWorkWillBeLost(Language lang) {
    return lang == Language.chinese
        ? '現有進度將無法恢復。'
        : 'Existing work cannot be brought back.';
  }

  static String getCancel(Language lang) {
    return lang == Language.chinese ? '取消' : 'Cancel';
  }

  static String getGoBack(Language lang) {
    return lang == Language.chinese ? '返回' : 'Go Back';
  }

  static String getScore(Language lang) {
    return lang == Language.chinese ? '分數' : 'Score';
  }

  static String getCorrect(Language lang) {
    return lang == Language.chinese ? '正確' : 'Correct';
  }

  static String getOutOf(Language lang) {
    return lang == Language.chinese ? '共' : 'out of';
  }

  static String getAccuracy(Language lang) {
    return lang == Language.chinese ? '正確率' : 'Accuracy';
  }

  static String getPriceOrAbove(Language lang) {
    return lang == Language.chinese ? '或以上' : 'or above';
  }

  static String getNotAvailable(Language lang) {
    return 'N/A';
  }

  static String getPlayMessage(Language lang) {
    return lang == Language.chinese
        ? '細心觀察相片, 找出扣押物品並選擇相對的估算價值。'
        : 'Carefully examine the photos to identify the items and their estimated values.';
  }

  // Get scene display name from scene key
  static String getSceneDisplayName(String sceneKey, Language lang) {
    if (sceneKey.startsWith('Boutique ')) {
      final number = int.tryParse(sceneKey.split(' ').last) ?? 1;
      return getServiceShop(lang, number);
    } else if (sceneKey.startsWith('Domestic ')) {
      final number = int.tryParse(sceneKey.split(' ').last) ?? 1;
      return getHome(lang, number);
    } else if (sceneKey.startsWith('Office ')) {
      final number = int.tryParse(sceneKey.split(' ').last) ?? 1;
      return getOffice(lang, number);
    } else if (sceneKey.startsWith('Kitchen ')) {
      final number = int.tryParse(sceneKey.split(' ').last) ?? 1;
      return getRestaurant(lang, number);
    }
    return sceneKey; // Fallback to original key
  }

  // Get scene key from display name (reverse mapping)
  static String getSceneKeyFromDisplayName(String displayName, Language lang) {
    // Extract number from display name (handles both "服務店(1)" and "Boutique (1)" formats)
    final numberMatch = RegExp(r'\((\d+)\)').firstMatch(displayName);
    final number =
        numberMatch != null
            ? int.tryParse(numberMatch.group(1) ?? '1') ?? 1
            : 1;

    if (lang == Language.chinese) {
      if (displayName.contains('時裝店')) {
        return 'Boutique $number';
      } else if (displayName.contains('家居')) {
        return 'Domestic $number';
      } else if (displayName.contains('辦公室')) {
        return 'Office $number';
      } else if (displayName.contains('餐廳')) {
        return 'Kitchen $number';
      }
    } else {
      // English format
      if (displayName.contains('Boutique')) {
        return 'Boutique $number';
      } else if (displayName.contains('Domestic')) {
        return 'Domestic $number';
      } else if (displayName.contains('Office')) {
        return 'Office $number';
      } else if (displayName.contains('Kitchen')) {
        return 'Kitchen $number';
      }
    }
    return displayName; // Fallback to original if no match
  }
}
