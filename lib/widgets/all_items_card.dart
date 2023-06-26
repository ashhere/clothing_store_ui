import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clothing_store_ui/app_style.dart';

class AllItemsCard extends StatelessWidget {
   AllItemsCard({
    super.key,
    required this.current,
     required this.indexing,
  });

  final int current;
 
  final int indexing;

   final List<String> categories = [
    'All Items',
    'Dress',
    'Hat',
    'Watch',
  ];

 final  List<String> icon = [
    'all_items_icon_',
    'dress_icon_',
    'hat_icon_',
    'watch_icon_',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 10),
      margin: const EdgeInsets.only(right: 15),
      height: 30,
      decoration: BoxDecoration(
          color:  current == indexing ? kBrown : kWhite,
          borderRadius: BorderRadius.circular(kBorderRadius)),
      child: Row(
        children: [
          SvgPicture.asset(current==indexing?
            'assets/${icon[indexing]}selected.svg':
            'assets/${icon[indexing]}unselected.svg',
            height: 20,
            width: 10,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            categories[indexing],
            style: kEncodSansMedium.copyWith(
                fontSize: 12, color: current!=indexing?kDarkBrown:kWhite),
          ),
        ],
      ),
    );
  }
}


