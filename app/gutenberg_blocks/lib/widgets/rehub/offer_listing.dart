import 'package:flutter/material.dart';

class OfferListingItem extends StatelessWidget {
  final Widget image;
  final Widget name;
  final Widget? description;
  final Widget? price;
  final Widget? badge;
  final Widget? button;
  final Widget? disclaimer;
  final double? width;
  final Color color;
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry padding;

  OfferListingItem({
    Key? key,
    required this.image,
    required this.name,
    this.description,
    this.price,
    this.badge,
    this.button,
    this.disclaimer,
    this.width,
    required this.color,
    this.boxShadow,
    this.padding = const EdgeInsets.all(16),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        double maxWidth = constraints.maxWidth;
        double widthScreen = MediaQuery.of(context).size.width;
        double widthDefault = maxWidth == double.infinity ? widthScreen : maxWidth;
        double widthItem = width ?? widthDefault;

        return SizedBox(
          width: widthItem,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: padding,
                decoration: BoxDecoration(
                  color: color,
                  boxShadow: boxShadow ??
                      [
                        BoxShadow(
                          color: const Color.fromRGBO(0, 0, 0, 0.08),
                          offset: Offset(0, 4),
                          blurRadius: 24,
                          spreadRadius: 0,
                        )
                      ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    image,
                    SizedBox(height: 16),
                    name,
                    if (price is Widget || badge is Widget) ...[
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(child: price ?? Container()),
                          if (price is Widget && badge is Widget) SizedBox(width: 12),
                          badge ?? Container(),
                        ],
                      ),
                    ],
                    if (description is Widget) ...[
                      SizedBox(height: 8),
                      description ?? SizedBox(),
                    ],
                    if (button is Widget) ...[
                      SizedBox(height: 8),
                      button ?? SizedBox(),
                    ],
                  ],
                ),
              ),
              if (disclaimer is Widget)
                SizedBox(
                  width: double.infinity,
                  child: disclaimer ?? Container(),
                )
            ],
          ),
        );
      },
    );
  }
}
