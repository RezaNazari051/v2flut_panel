import 'package:flutter/material.dart';
import 'package:yo_panel/config/theme/app_colors.dart';
import 'package:yo_panel/core/widgets/responsive.dart';

class WalletInfoCardWidget extends StatelessWidget {
  const WalletInfoCardWidget({super.key, required this.backgroundColor});
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 5,
      ),
      width: 400,
      height: 150,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // FittedBox(child: Text('موجودی کیف پول',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),)
        AnimatedDefaultTextStyle(
            style: TextStyle(
                fontSize: !isMobile ? 17 : 13, fontWeight: FontWeight.bold),
            duration: const Duration(milliseconds: 200),
            child: const Text('موجودی کیف پول',style: TextStyle(color:  Colors.white),)),
        AnimatedDefaultTextStyle(
          style: TextStyle(
              fontSize: !isMobile ? 25 : 20, fontWeight: FontWeight.bold),
          duration: const Duration(milliseconds: 200),
          child: const Text('120000 ریال',style: TextStyle(color:  Colors.white),),
        ),
      ]),
    );
  }
}

class WalletInfoCardGridView extends StatelessWidget {
  final int crossAxisCount;
  const WalletInfoCardGridView({
    super.key,
    required this.crossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 150,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: crossAxisCount,
      ),
      itemBuilder: (context, index) => const WalletInfoCardWidget(
        backgroundColor: AppColor.darkCardBackgroundColor
      ),
    );
  }
}
