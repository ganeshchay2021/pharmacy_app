import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/utils/constants.dart';
import 'package:pharmacy_app/utils/text_style_widget.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 50, bottom: 20),
          color: Constants.backgrondColor,
          child: Column(
            children: [
              //back button
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Gap(Constants.spaceBwtSections),

              //product details
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    //medicine image
                    Image.asset(
                      Constants.medicine1,
                      height: MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.cover,
                    ),

                    Gap(Constants.spaceBwtSections),

                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(122, 255, 255, 255),
                        border: Border.all(color: Colors.white, width: 1.5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //medicine name and quantity
                          Row(
                            children: [
                              //medicine name
                              Text(
                                "Paracetamol",
                                style: TextStyleWidget.headlineTextStyle(20),
                              ),

                              Spacer(),

                              //quantity selector
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    //decrease quantity button
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.remove),
                                    ),

                                    Gap(10),

                                    //quantity text
                                    Text("1"),

                                    Gap(10),

                                    //increase quantity button
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Gap(Constants.spaceBwtItems),

                          //medicine description
                          Text(
                            "Description",
                            style: TextStyleWidget.lightTextStyle(18),
                          ),

                          Gap(Constants.spaceBwtItems),

                          //medicine description text
                          Text(
                            "MECHANISM OF ACTION : It is a weak inhibitor of PG synthesis and there is some evidence to indicate relative COX-2 selectivity. Antiinflammatory action may be exerted by other mechanisms as well, eg. reduced generation of superoxide by neutrophils, inhibition of PAF synthesis and TNF release, free radical scavanging, inhibition of metalloproteinase activity in cartilage.",
                          ),

                          Gap(Constants.spaceBwtItems),
                        
                          //total price and order button
                          Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(159, 255, 255, 255),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                //total price
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    //total price text
                                    Text(
                                      "Total Price",
                                      style: TextStyleWidget.headlineTextStyle(
                                        18,
                                      ).copyWith(color: Colors.grey),
                                    ),

                                    //total price value
                                    Text(
                                      "\$90.00",
                                      style: TextStyleWidget.headlineTextStyle(
                                        18,
                                      ).copyWith(color: Colors.black),
                                    ),
                                  ],
                                ),

                                Spacer(),

                                //order button
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    child: Text(
                                      "Order Now",
                                      style: TextStyleWidget.headlineTextStyle(
                                        18,
                                      ).copyWith(color: Colors.white),
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
            ],
          ),
        ),
      ),
    );
  }
}
