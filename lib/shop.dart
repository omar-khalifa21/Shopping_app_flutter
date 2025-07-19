import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'product_card.dart';
import 'hot_offer_card.dart';

class MainShoppingScreen extends StatefulWidget {
  const MainShoppingScreen({super.key});

  @override
  State<MainShoppingScreen> createState() => _MainShoppingScreenState();
}

class _MainShoppingScreenState extends State<MainShoppingScreen> {
  final List<String> productImages = [
    'assets/shirt.jpg',
    'assets/coat.jpg',
    'assets/crav.jpg',
    'assets/silk.jpg',
    'assets/firl.jpg',
    'assets/girl.jpg',
    'assets/glasses.jpg',
    'assets/men.jpg',
    'assets/yellow.jpg',
    'assets/shoot.jpg',
    'assets/flo.jpg',
  ];

  final List<String> productNames = [
    'Shirt', 'Coat', 'Cravat', 'Silk', 'Firl', 'Girl', 'Glasses', 'Men', 'Yellow', 'Shoot', 'Flo'
  ];

  final List<Map<String, String>> hotOffers = [
    { 'image': 'assets/shirt.jpg', 'desc': '50% off on all shirts!' },
    { 'image': 'assets/coat.jpg', 'desc': 'Buy 1 Get 1 Free on coats!' },
    { 'image': 'assets/girl.jpg', 'desc': 'Special offer on girls wear!' },
    { 'image': 'assets/glasses.jpg', 'desc': 'Trendy glasses at best price!' },
    { 'image': 'assets/yellow.jpg', 'desc': 'Yellow collection sale!' },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TypewriterAnimatedText(
              'our_products'.tr(),
              textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontFamily: 'Suwannaphum',
              ),
              speed: const Duration(milliseconds: 100),
            ),
          ],
          totalRepeatCount: 1,
          pause: const Duration(milliseconds: 500),
          displayFullTextOnTap: true,
          isRepeatingAnimation: true,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 189, 3, 108),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              final newLocale = context.locale.languageCode == 'en'
                  ? const Locale('ar')
                  : const Locale('en');
              context.setLocale(newLocale);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 180,
                child: PageView.builder(
                  itemCount: productImages.length > 5 ? 5 : productImages.length,
                  controller: PageController(viewportFraction: 0.8),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          productImages[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'our_products'.tr(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Suwannaphum',
                ),
              ),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: productImages.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    image: productImages[index],
                    name: productNames[index],
                    onAddToCart: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('item_added'.tr())),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 24),
              Text(
                'hot_offers'.tr(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Suwannaphum',
                ),
              ),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: hotOffers.length,
                itemBuilder: (context, index) {
                  return HotOfferCard(
                    image: hotOffers[index]['image']!,
                    description: hotOffers[index]['desc']!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}