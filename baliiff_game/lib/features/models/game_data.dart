import 'package:baliiff_game/features/utils/language.dart';

class GameItem {
  final String item;
  final String price;

  GameItem({required this.item, required this.price});
}

class GameData {
  // Boutique 1 items with prices
  static List<GameItem> boutique1 = [
    GameItem(item: 'One sofa bench', price: '1-50'), //$1-50
    GameItem(item: 'One piece of cushion', price: '1-50'), //$1-50
    GameItem(item: 'Five potted plants', price: '1-50'), //$1-50
    GameItem(
      item: 'Sixty pieces of fashionable clothes',
      price: '501 or above',
    ), //$501 or above
    GameItem(item: 'Twelve spotlights', price: '101-200'), //$101-200
  ];

  static List<GameItem> boutique1Chinese = [
    GameItem(item: '一個梳化長櫈', price: '1-50'), //$1-50
    GameItem(item: '一個咕𠱸', price: '1-50'), //$1-50
    GameItem(item: '五盆盤栽', price: '1-50'), //$1-50
    GameItem(item: '六十件時裝', price: '501 或以上'), //$501 or above
    GameItem(item: '十二盞射燈', price: '101-200'), //$101-200
  ];

  // Boutique 2 items with prices
  static List<GameItem> boutique2 = [
    GameItem(item: 'Four 1-seater sofa', price: '51-100'), //$51-100
    GameItem(item: 'Three plotted plants', price: '1-50'), //$1-50
    GameItem(item: 'One wooden teapot table', price: '1-50'), //$1-50
    GameItem(item: 'One garment steamer', price: '51-100'), //$51-100
    GameItem(item: 'Five decorative items', price: '1-50'), //$1-50
  ];

  static List<GameItem> boutique2Chinese = [
    GameItem(item: '四個單座位梳化', price: '51-100'), //$51-100
    GameItem(item: '三盆盤栽', price: '1-50'), //$1-50
    GameItem(item: '一個木製茶几', price: '1-50'), //$1-50
    GameItem(item: '一座蒸汽熨斗', price: '51-100'), //$51-100
    GameItem(item: '五個擺設品', price: '1-50'), //$1-50
  ];

  // Boutique 3 items with prices
  static List<GameItem> boutique3 = [
    GameItem(item: 'Two 1 seated sofas', price: '51-100'), //$51-100
    GameItem(item: 'Two teapot tables', price: '1-50'), //$1-50
    GameItem(item: 'One wooden clothes stand rack', price: '1-50'), //$1-50
    GameItem(item: 'One sofa stool', price: '1-50'), //$1-50
    GameItem(item: 'One carpet', price: '1-50'), //$1-50
  ];

  static List<GameItem> boutique3Chinese = [
    GameItem(item: '兩張單座位梳化', price: '51-100'), //$51-100
    GameItem(item: '兩張茶几', price: '1-50'), //$1-50
    GameItem(item: '一個木製座地衣架', price: '1-50'), //$1-50
    GameItem(item: '一張梳化矮櫈', price: '1-50'), //$1-50
    GameItem(item: '一張地氈', price: '1-50'), //$1-50
  ];
  // Domestic 1 items with prices
  static List<GameItem> domestic1 = [
    GameItem(item: 'Four dining tables', price: '51-100'), //$51-100
    GameItem(item: 'Nine dining chairs', price: '51-100'), //$51-100
    GameItem(item: 'Two wooden highchairs', price: '1-50'), //$1-50
    GameItem(item: 'Thirteen potted plants', price: '1-50'), //$1-50
    GameItem(item: 'Four wall-mounted racks', price: '1-50'), //$1-50
  ];

  static List<GameItem> domestic1Chinese = [
    GameItem(item: '四張餐桌', price: '51-100'), //$51-100
    GameItem(item: '九張餐椅', price: '51-100'), //$51-100
    GameItem(item: '兩張木製高櫈', price: '1-50'), //$1-50
    GameItem(item: '十三盆盤栽', price: '1-50'), //$1-50
    GameItem(item: '四個掛牆架', price: '1-50'), //$1-50
  ];
  // Domestic 2 items with prices
  static List<GameItem> domestic2 = [
    GameItem(item: 'Two 1-seater chairs', price: '51-100'), //$51-100
    GameItem(item: 'Eight pieces of pictures', price: '51-100'), //$51-100
    GameItem(item: 'Twenty-two decorative items', price: '1-50'), //$1-50
    GameItem(item: 'One table lamp', price: '1-50'), //$1-50
    GameItem(item: 'One wooden cabinet', price: '1-50'), //$1-50
  ];

  static List<GameItem> domestic2Chinese = [
    GameItem(item: '兩個單座位櫈', price: '51-100'), //$51-100
    GameItem(item: '八幅畫', price: '51-100'), //$51-100
    GameItem(item: '二十二個擺設品', price: '1-50'), //$1-50
    GameItem(item: '一盞枱燈', price: '1-50'), //$1-50
    GameItem(item: '一個木櫃', price: '1-50'), //$1-50
  ];

  // Domestic 3 items with prices
  static List<GameItem> domestic3 = [
    GameItem(item: 'One sofa', price: '1-50'), //$1-50
    GameItem(item: 'One heater', price: '1-50'), //$1-50
    GameItem(
      item: 'One floor stand 4-burner gas stove',
      price: '201-500',
    ), //$101-200
    GameItem(item: 'One piece of picture', price: '1-50'), //$1-50
    GameItem(item: 'One 2-door refrigerator', price: '1-50'), //$1-50
  ];

  // Domestic 3 items with prices
  static List<GameItem> domestic3Chinese = [
    GameItem(item: '一張梳化', price: '1-50'), //$1-50
    GameItem(item: '一個暖爐', price: '1-50'), //$1-50
    GameItem(item: '一個座地四頭燃氣煮食爐', price: '201-500'), //$101-200
    GameItem(item: '一幅畫', price: '1-50'), //$1-50
    GameItem(item: '一個雙門雪櫃', price: '1-50'), //$1-50
  ];
  // Office 1 items with prices
  static List<GameItem> office1 = [
    GameItem(item: 'Three printers', price: '51-100'), //$51-100
    GameItem(
      item: 'Twelve computer monitors',
      price: '501 or above',
    ), //$501 or above
    GameItem(item: 'One 3-door cabinet', price: '1-50'), //$1-50
    GameItem(item: 'Six office tables', price: '101-200'), //$101-200
    GameItem(item: 'Seven swivel chairs', price: '51-100'), //$51-100
  ];

  static List<GameItem> office1Chinese = [
    GameItem(item: '三部打印機', price: '51-100'), //$51-100
    GameItem(item: '十二個電腦顯示屏', price: '501 或以上'), //$501 or above
    GameItem(item: '一個三門櫃', price: '1-50'), //$1-50
    GameItem(item: '六張辦公枱', price: '101-200'), //$101-200
    GameItem(item: '七張旋轉櫈', price: '51-100'), //$51-100
  ];
  // Office 2 items with prices
  static List<GameItem> office2 = [
    GameItem(item: 'One high chair', price: '1-50'), //$1-50
    GameItem(item: 'One wall-mounted television', price: '1-50'), //$1-50
    GameItem(item: 'One document tray', price: '1-50'), //$1-50
    GameItem(item: 'One microwave oven', price: '1-50'), //$1-50
    GameItem(item: 'Two cup sterilizer cabinets', price: '101-200'), //$101-200
  ];

  static List<GameItem> office2Chinese = [
    GameItem(item: '一張高櫈', price: '1-50'), //$1-50
    GameItem(item: '一個掛牆電視', price: '1-50'), //$1-50
    GameItem(item: '一個文件托盤', price: '1-50'), //$1-50
    GameItem(item: '一個微波爐', price: '1-50'), //$1-50
    GameItem(item: '兩個消毒杯櫃', price: '101-200'), //$101-200
  ];
  // Office 3 items with prices
  static List<GameItem> office3 = [
    GameItem(item: 'Six swivel armchairs', price: '51-100'), //$51-100
    GameItem(item: 'Seven wooden writing desks', price: '101-200'), //$101-200
    GameItem(item: 'Two computer main units', price: '51-100'), //$51-100
    GameItem(item: 'Six computer monitors', price: '201-500'), //$201-500
    GameItem(item: 'Two wall-mounted wooden racks', price: '1-50'), //$1-50
  ];

  static List<GameItem> office3Chinese = [
    GameItem(item: '六張旋轉扶手櫈', price: '51-100'), //$51-100
    GameItem(item: '七張木製辦公室枱', price: '101-200'), //$101-200
    GameItem(item: '兩台電腦主機', price: '51-100'), //$51-100
    GameItem(item: '六個電腦顯示屏', price: '201-500'), //$201-500
    GameItem(item: '兩個掛牆木架', price: '1-50'), //$1-50
  ];

  // Kitchen 1 items with prices
  static List<GameItem> kitchen1 = [
    GameItem(item: 'Six blenders', price: '1-50'), //$1-50
    GameItem(item: 'Nine wall-mounted metal racks', price: '51-100'), //$51-100
    GameItem(
      item: 'One lot of cooking and dining instrument',
      price: '51-100',
    ), //$51-100
    GameItem(
      item: 'One U-shape kitchen desk with four ovens and 2-door cabinets',
      price: '201-500',
    ), //$201-500
    GameItem(item: 'One kettle', price: '1-50'), //$1-50
  ];

  static List<GameItem> kitchen1Chinese = [
    GameItem(item: '六個攪拌機', price: '1-50'), //$1-50
    GameItem(item: '九個掛牆金屬架', price: '51-100'), //$51-100
    GameItem(item: '一批廚房煮食及餐飲用具', price: '51-100'), //$51-100
    GameItem(item: '一個U型廚房枱連4個焗爐及兩個兩門櫃', price: '201-500'), //$201-500
    GameItem(item: '一個熱水煲', price: '1-50'), //$1-50
  ];
  // Kitchen 2 items with prices
  static List<GameItem> kitchen2 = [
    GameItem(item: 'One coffee maker', price: '51-100'), //$51-100
    GameItem(item: 'Two blenders', price: '51-100'), //$51-100
    GameItem(item: 'Four ovens', price: '51-100'), //$51-100
    GameItem(
      item:
          'One lot of kitchenware (Approx. 120 units) (Including bowls, plates, pots, jar)',
      price: '101-200',
    ), //$101-200
    GameItem(item: 'Two wall-mounted metal racks', price: '1-50'), //$1-50
  ];

  static List<GameItem> kitchen2Chinese = [
    GameItem(item: '一部咖啡機', price: '51-100'), //$51-100
    GameItem(item: '兩個攪拌機', price: '51-100'), //$51-100
    GameItem(item: '四個焗爐', price: '51-100'), //$51-100
    GameItem(item: '一批約120件廚房廚具 (包括碗,碟,鍋,罐)', price: '101-200'), //$101-200
    GameItem(item: '兩個掛牆金屬架', price: '1-50'), //$1-50
  ];

  // Kitchen 3 items with prices
  static List<GameItem> kitchen3 = [
    GameItem(item: 'Sixteen dining chairs', price: '101-200'), //$101-200
    GameItem(item: 'Nine dining tables', price: '101-200'), //$101-200
    GameItem(item: 'Two sofa benches', price: '1-50'), //$1-50
    GameItem(item: 'Three 1-door refrigerator', price: '201-500'), //$201-500
    GameItem(item: 'Two coffee makers', price: '101-200'), //$101-200
  ];

  static List<GameItem> kitchen3Chinese = [
    GameItem(item: '十六張餐椅', price: '101-200'), //$101-200
    GameItem(item: '九張餐枱', price: '101-200'), //$101-200
    GameItem(item: '兩張梳化櫈', price: '1-50'), //$1-50
    GameItem(item: '兩個單門雪櫃', price: '201-500'), //$201-500
    GameItem(item: '兩部咖啡機', price: '101-200'), //$101-200
  ];

  // Items without prices (distractor items) for Boutique 1 and 2
  static List<String> itemsWithoutPrices = [
    'One water dispenser',
    'One vacuum cleaner',
    'One induction cooker',
    'One photocopier',
    'One exhaust fan',
  ];

  static List<String> itemsWithoutPricesBoutique1 = [
    'One water dispenser',
    'One vacuum cleaner',
    'One induction cooker',
    'One photocopier',
    'One exhaust fan',
  ];

  static List<String> itemsWithoutPricesBoutique1Chinese = [
    '一部飲用水機',
    '一部吸塵機',
    '一個電磁煮食爐',
    '一部影印機',
    '一部抽氣扇',
  ];

  static List<String> itemsWithoutPricesBoutique2 = [
    'One exhaust fan',
    'One shower basin',
    'One projector',
    'One gas water heater',
    'One rice cooker',
  ];

  static List<String> itemsWithoutPricesBoutique2Chinese = [
    '一部抽氣扇',
    '一個浴盤',
    '一部投影機',
    '一部氣體熱水爐',
    '一個電飯煲',
  ];
  // Items without prices (distractor items) for Boutique 3
  static List<String> itemsWithoutPricesBoutique3 = [
    'One exhaust fan',
    'One showser basin',
    'One projector',
    'One gas water heater',
    'One rice cooker',
  ];

  static List<String> itemsWithoutPricesBoutique3Chinese = [
    '一部抽氣扇',
    '一個浴盤',
    '一部投影機',
    '一部氣體熱水爐',
    '一個電飯煲',
  ];

  // Items without prices (distractor items) for Domestic 1
  static List<String> itemsWithoutPricesDomestic1 = [
    'One washing machine',
    'One range hood',
    'One printer',
    'One 2-layer metal trolley',
    'One television',
  ];
  static List<String> itemsWithoutPricesDomestic1Chinese = [
    '一部洗衣機',
    '一部抽油煙機',
    '一部打印機',
    '一部雙層金屬手推車',
    '一部電視',
  ];
  // Items without prices (distractor items) for Domestic 2
  static List<String> itemsWithoutPricesDomestic2 = [
    'One computer monitor',
    'One dehumidifier',
    'One range hood',
    'One printer',
    'One 2-layer metal trolley',
  ];
  static List<String> itemsWithoutPricesDomestic2Chinese = [
    '一個電腦顯示屏',
    '一部抽濕機',
    '一部抽油煙機',
    '一部打印機',
    '一部雙層金屬手推車',
  ];
  // Items without prices (distractor items) for Domestic 3
  static List<String> itemsWithoutPricesDomestic3 = [
    'One keyboard',
    'One automatic water boiler',
    'One wall fan',
    'One computer monitor',
    'One dehumidifier',
  ];

  static List<String> itemsWithoutPricesDomestic3Chinese = [
    '一個鍵盤',
    '一個自動煲水器',
    '一個掛牆風扇',
    '一個電腦顯示屏',
    '一部抽濕機',
  ];

  // Items without prices (distractor items) for Office 1
  static List<String> itemsWithoutPricesOffice1 = [
    'One keyboard',
    'One automatic water boiler',
    'One wall fan',
    'One computer monitor',
    'One dehumidifier',
  ];

  static List<String> itemsWithoutPricesOffice1Chinese = [
    '一個鍵盤',
    '一個自動煲水器',
    '一個掛牆風扇',
    '一個電腦顯示屏',
    '一部抽濕機',
  ];

  // Items without prices (distractor items) for Office 2
  static List<String> itemsWithoutPricesOffice2 = [
    'One keyboard',
    'One automatic water boiler',
    'One wall fan',
    'One computer monitor',
    'One dehumidifier',
  ];

  static List<String> itemsWithoutPricesOffice2Chinese = [
    '一個鍵盤',
    '一個自動煲水器',
    '一個掛牆風扇',
    '一個電腦顯示屏',
    '一部抽濕機',
  ];

  // Items without prices (distractor items) for Office 3
  static List<String> itemsWithoutPricesOffice3 = [
    'One keyboard',
    'One automatic water boiler',
    'One wall fan',
    'One computer monitor',
    'One dehumidifier',
  ];

  static List<String> itemsWithoutPricesOffice3Chinese = [
    '一個鍵盤',
    '一個自動煲水器',
    '一個掛牆風扇',
    '一個電腦顯示屏',
    '一部抽濕機',
  ];

  // Items without prices (distractor items) for Kitchen 1
  static List<String> itemsWithoutPricesKitchen1 = [
    'One exhaust fan',
    'One shower basin',
    'One projector',
    'One gas water heater',
    'One rice cooker',
  ];

  static List<String> itemsWithoutPricesKitchen1Chinese = [
    '一部抽氣扇',
    '一個浴盤',
    '一部投影機',
    '一部氣體熱水爐',
    '一個電飯煲',
  ];

  // Items without prices (distractor items) for Kitchen 2
  static List<String> itemsWithoutPricesKitchen2 = [
    'One rice cooker',
    'One 2-burner gas stove',
    'One server box',
    'One binding machine',
    'One wall clock',
  ];

  static List<String> itemsWithoutPricesKitchen2Chinese = [
    '一個電飯煲',
    '一個雙頭氣體煮食爐',
    '一個伺服器盒',
    '一個文件釘裝機',
    '一個掛牆鐘',
  ];

  // Items without prices (distractor items) for Kitchen 3
  static List<String> itemsWithoutPricesKitchen3 = [
    'One show basin',
    'One projector',
    'One gas water heater',
    'One rice cooker',
    'One 2-burner gas stove',
  ];

  static List<String> itemsWithoutPricesKitchen3Chinese = [
    '一個浴盤',
    '一部投影機',
    '一部氣體熱水爐',
    '一個電飯煲',
    '一個雙頭氣體煮食爐',
  ];
  // Get all items for a scene
  static List<GameItem> getItemsForScene(String scene) {
    if (LanguageHelper.currentLanguage == Language.chinese) {
      if (scene == 'Boutique 1') {
        return boutique1Chinese;
      } else if (scene == 'Boutique 2') {
        return boutique2Chinese;
      } else if (scene == 'Boutique 3') {
        return boutique3Chinese;
      } else if (scene == 'Domestic 1') {
        return domestic1Chinese;
      } else if (scene == 'Domestic 2') {
        return domestic2Chinese;
      } else if (scene == 'Domestic 3') {
        return domestic3Chinese;
      } else if (scene == 'Office 1') {
        return office1Chinese;
      } else if (scene == 'Office 2') {
        return office2Chinese;
      } else if (scene == 'Office 3') {
        return office3Chinese;
      } else if (scene == 'Kitchen 1') {
        return kitchen1Chinese;
      } else if (scene == 'Kitchen 2') {
        return kitchen2Chinese;
      } else if (scene == 'Kitchen 3') {
        return kitchen3Chinese;
      }
      // Default to Boutique 1
      return boutique1;
    } else {
      if (scene == 'Boutique 1') {
        return boutique1;
      } else if (scene == 'Boutique 2') {
        return boutique2;
      } else if (scene == 'Boutique 3') {
        return boutique3;
      } else if (scene == 'Domestic 1') {
        return domestic1;
      } else if (scene == 'Domestic 2') {
        return domestic2;
      } else if (scene == 'Domestic 3') {
        return domestic3;
      } else if (scene == 'Office 1') {
        return office1;
      } else if (scene == 'Office 2') {
        return office2;
      } else if (scene == 'Office 3') {
        return office3;
      } else if (scene == 'Kitchen 1') {
        return kitchen1;
      } else if (scene == 'Kitchen 2') {
        return kitchen2;
      } else if (scene == 'Kitchen 3') {
        return kitchen3;
      }
      // Default to Boutique 1
      return boutique1;
    }
  }

  // Get the number of dropdowns needed for a scene
  // Now fixed at 5 dropdowns, each showing 10 items (5 with prices + 5 distractors)
  static int getNumberOfDropdowns(String scene) {
    return 5;
  }

  // Get all unique prices for a scene
  // Always returns the 5 standard price ranges
  static List<String> getPricesForScene(String scene) {
    final language = LanguageHelper.currentLanguage;
    final priceOrAbove = language == Language.chinese ? '或以上' : 'or above';

    return ['1-50', '51-100', '101-200', '201-500', '501 $priceOrAbove'];
  }

  // Get all item names for a scene (including items without prices)
  static List<String> getItemNamesForScene(String scene) {
    final items = getItemsForScene(scene);
    final itemsWithPrices = items.map((item) => item.item).toList();
    // Get the appropriate distractor items for the scene
    List<String> distractors;
    if (LanguageHelper.currentLanguage == Language.chinese) {
      if (scene == 'Boutique 1') {
        distractors = itemsWithoutPricesBoutique1Chinese;
      } else if (scene == 'Boutique 2') {
        distractors = itemsWithoutPricesBoutique2Chinese;
      } else if (scene == 'Boutique 3') {
        distractors = itemsWithoutPricesBoutique3Chinese;
      } else if (scene == 'Domestic 1') {
        distractors = itemsWithoutPricesDomestic1Chinese;
      } else if (scene == 'Domestic 2') {
        distractors = itemsWithoutPricesDomestic2Chinese;
      } else if (scene == 'Domestic 3') {
        distractors = itemsWithoutPricesDomestic3Chinese;
      } else if (scene == 'Office 1') {
        distractors = itemsWithoutPricesOffice1Chinese;
      } else if (scene == 'Office 2') {
        distractors = itemsWithoutPricesOffice2Chinese;
      } else if (scene == 'Office 3') {
        distractors = itemsWithoutPricesOffice3Chinese;
      } else if (scene == 'Kitchen 1') {
        distractors = itemsWithoutPricesKitchen1Chinese;
      } else if (scene == 'Kitchen 2') {
        distractors = itemsWithoutPricesKitchen2Chinese;
      } else if (scene == 'Kitchen 3') {
        distractors = itemsWithoutPricesKitchen3Chinese;
      } else {
        distractors = itemsWithoutPrices;
      }
    } else {
      if (scene == 'Boutique 1') {
        distractors = itemsWithoutPricesBoutique1;
      } else if (scene == 'Boutique 2') {
        distractors = itemsWithoutPricesBoutique2;
      } else if (scene == 'Boutique 3') {
        distractors = itemsWithoutPricesBoutique3;
      } else if (scene == 'Domestic 1') {
        distractors = itemsWithoutPricesDomestic1;
      } else if (scene == 'Domestic 2') {
        distractors = itemsWithoutPricesDomestic2;
      } else if (scene == 'Domestic 3') {
        distractors = itemsWithoutPricesDomestic3;
      } else if (scene == 'Office 1') {
        distractors = itemsWithoutPricesOffice1;
      } else if (scene == 'Office 2') {
        distractors = itemsWithoutPricesOffice2;
      } else if (scene == 'Office 3') {
        distractors = itemsWithoutPricesOffice3;
      } else if (scene == 'Kitchen 1') {
        distractors = itemsWithoutPricesKitchen1;
      } else if (scene == 'Kitchen 2') {
        distractors = itemsWithoutPricesKitchen2;
      } else if (scene == 'Kitchen 3') {
        distractors = itemsWithoutPricesKitchen3;
      } else {
        distractors = itemsWithoutPrices;
      }
    }

    // Combine items with prices and items without prices
    final allItems = [...itemsWithPrices, ...distractors];
    // Remove duplicates and ensure exactly 10 items (5 with prices + 5 distractors)
    final uniqueItems = allItems.toSet().toList();
    // If we have more than 10, take only the first 10
    if (uniqueItems.length > 10) {
      return uniqueItems.take(10).toList();
    }
    return uniqueItems;
  }

  // Get the correct price for a specific item
  static String? getPriceForItem(String scene, String itemName) {
    final items = getItemsForScene(scene);
    for (var item in items) {
      if (item.item == itemName) {
        return item.price;
      }
    }
    // If item is not in the priced items list, it doesn't have a price
    return null;
  }

  // Check if an item has a price
  static bool hasPrice(String scene, String itemName) {
    return getPriceForItem(scene, itemName) != null;
  }
}
