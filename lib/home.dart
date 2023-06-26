import 'package:clothing_store_ui/app_style.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clothing_store_ui/widgets/all_items_card.dart';

class HomePAge extends StatefulWidget {
  const HomePAge({super.key});

  @override
  State<HomePAge> createState() => _HomePAgeState();
}

final List<String> images = [
  'images0.png',
  'images1.jpg',
  'images2.png',
  'images3.png',
  'images4.png',
  'images5.jpg',
];

final List<String> clothsName = [
  'Modern Light Clothes',
  'Modern Heavy Clothes',
  'Modern Dark Clothes',
  'Modern Moody Clothes',
  'Modern Yellow Clothes',
  'Modern Orange Clothes',
];

final List<String> clothesPrice = [
  "212.33",
  "323.56",
  "400.13",
  "323.03",
  "500.99",
  "299.44",
];

 List<int> doubleTapped = [1,1,1,1,1,1];

class _HomePAgeState extends State<HomePAge> {
  int current = 0;
  int seletectedIndex = 0;
  int tapped = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Hello, Welcome 👋",
                        style: kEncodSansRegular.copyWith(
                            color: kDarkBrown, fontSize: 14),
                      ),
                      Text(
                        'Albert Stevano!',
                        style: kEncodSansBlod.copyWith(
                            color: kDarkBrown, fontSize: 16),
                      )
                    ],
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                    radius: 20,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 13),
                          focusColor: kDarkGrey,
                          hintText: "Search cloths. . .",
                          hintStyle: kEncodSansRegular.copyWith(fontSize: 16),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: kDarkGrey,
                          ),
                          focusedBorder: kInputOutputBorder,
                          border: kInputOutputBorder),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    height: 49,
                    width: 48,
                    decoration: BoxDecoration(
                        color: kBrown,
                        borderRadius: BorderRadius.circular(kBorderRadius)),
                    child: SvgPicture.asset('assets/filter_icon.svg'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: kPaddingHorizontal),
              child: SizedBox(
                height: 36,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: AllItemsCard(
                          current: current,
                          indexing: index,
                        ));
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),

    
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: MasonryGridView.count(
                shrinkWrap: true,
                itemCount: images.length,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 23,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.asset(
                                'assets/images/${images[index]}',
                                fit: BoxFit.cover,
                              )),
                          Positioned(
                              top: 12,
                              right: 12,
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      tapped = tapped + 1;
                                     
                                      print(doubleTapped);
                                      
                                    });
                                  },
                                  child: SvgPicture.asset(
                                  
                                    
                                    tapped == doubleTapped[index]
                                      ? 'assets/favorite_cloth_icon_selected.svg'
                                      : 'assets/favorite_cloth_icon_unselected.svg'))),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            clothsName[index],
                            style: kEncodSansSemiBlod.copyWith(
                                fontSize: 14, color: kBrown),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Dress Modern',
                            style: kEncodSansRegular.copyWith(
                                fontSize: 10, color: const Color(0xffA4AAAD)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${clothesPrice[index]}',
                                style: kEncodSansSemiBlod.copyWith(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 19, left: 10),
                                    child: Text(
                                      '5.0',
                                      style: kEncodSansRegular.copyWith(
                                          fontSize: 14, color: kBrown),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: seletectedIndex,
          backgroundColor: const Color(0xff292526),
          selectedItemColor: kBlack,
          unselectedItemColor: Colors.black.withAlpha(400),
          showSelectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    setState(() {
                      seletectedIndex = 0;
                    });
                  },
                  icon: const Icon(
                    Icons.home,
                    size: 35,
                  ),
                ),
                label: "home"),
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    setState(() {
                      seletectedIndex = 1;
                    });
                  },
                  icon: const Icon(
                    Icons.shopping_bag,
                    size: 35,
                  ),
                ),
                label: "shop"),
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    setState(() {
                      seletectedIndex = 2;
                    });
                  },
                  icon: const Icon(
                    Icons.favorite,
                    size: 35,
                  ),
                ),
                label: "favorite"),
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    setState(() {
                      seletectedIndex = 3;
                    });
                  },
                  icon: const Icon(
                    Icons.account_circle,
                    size: 35,
                  ),
                ),
                label: "profile"),
          ]),
    );
  }
}
