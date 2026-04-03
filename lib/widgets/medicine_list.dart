import 'package:flutter/material.dart';
import 'package:pharmacy_app/model/product_model.dart';
import 'package:pharmacy_app/utils/constants.dart';
import 'package:pharmacy_app/utils/text_style_widget.dart';

class MedicineList extends StatelessWidget {
  final ProductModel productData;
  final VoidCallback onTap;

  const MedicineList({
    super.key,
    required this.onTap,
    required this.productData,
  });

  @override
  Widget build(BuildContext context) {
    //medicine list item
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: Constants.spaceBwtSections),
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(right: 20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffbab3a6), Color(0xffddd7cd), Color(0xffa59c8f)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              //medicine image
              Center(
                child: Image.asset(
                  Constants.medicine1,
                  height: 200,
                  fit: BoxFit.fill,
                ),
              ),

              //medicine details
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.5),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffbab3a6),
                        Color(0xffddd7cd),
                        Color(0xffa59c8f),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //medicine name and price
                      Row(
                        children: [
                          // medicine name
                          Expanded(
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              productData.name!,
                              style: TextStyleWidget.headlineTextStyle(
                                18,
                              ).copyWith(color: Colors.white),
                            ),
                          ),

                          //medicine price
                          Text(
                            "रु ${productData.price}",
                            style: TextStyleWidget.headlineTextStyle(
                              18,
                            ).copyWith(color: Colors.white),
                          ),
                        ],
                      ),

                      //medicine company
                      Text(
                        productData.companyName!,
                        style: TextStyleWidget.headlineTextStyle(
                          18,
                        ).copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
