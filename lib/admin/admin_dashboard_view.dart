import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/controller/admin_comtroller.dart';
import 'package:pharmacy_app/utils/constants.dart';
import 'package:pharmacy_app/utils/text_style_widget.dart';
import 'package:pharmacy_app/widgets/common_button.dart';
import 'package:pharmacy_app/widgets/common_snackbar.dart';
import 'package:pharmacy_app/widgets/common_text_field.dart';
import 'package:pharmacy_app/widgets/selected_category_widgets.dart';

class AdminDashBoardView extends GetView<AdminController> {
  AdminDashBoardView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Stack(
            children: [
              //top container
              Container(
                height: size.height / 2,
                width: size.width,
                decoration: BoxDecoration(
                  color: Color(0xfff7bc3c),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                ),
                child: Column(
                  children: [
                    Gap(Constants.spaceBwtSections * 1.5),
                    //title text
                    Text(
                      "Admin Login",
                      style: TextStyleWidget.headlineTextStyle(
                        50,
                      ).copyWith(fontFamily: "Fredoka-Bold", height: 0),
                    ),
                  ],
                ),
              ),

              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUnfocus,
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: size.width,
                  margin: EdgeInsets.only(
                    top: size.height / 8,
                    left: 20,
                    right: 20,
                    bottom: 0,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 240, 247, 234),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //image uploader
                      // Obx(
                      //   () => GestureDetector(
                      //     onTap: () {
                      //       _showPicker(context);
                      //     },
                      //     child: Container(
                      //       height: size.height * 0.2,
                      //       width: size.width,
                      //       decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         borderRadius: BorderRadius.circular(15),
                      //         border: Border.all(color: Color(0xfff7bc3c)),
                      //       ),
                      //       child: controller.image.value != null
                      //           ? ClipRRect(
                      //             borderRadius: BorderRadius.circular(15),
                      //               child: Image.file(
                      //                 controller.image.value!,
                      //                 fit: BoxFit.cover,
                      //               ),
                      //             )
                      //           : Icon(Icons.camera_alt),
                      //     ),
                      //   ),
                      // ),

                      // Gap(Constants.spaceBwtItems),

                      //product name text field
                      CommonTextField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "product name is empty";
                          }
                          return null;
                        },
                        controller: controller.productNameController,
                        keyboardType: TextInputType.text,
                        label: "Product Name",
                        hintText: "Enter product name",
                        prefixIcon: Icon(Icons.person_3),
                      ),

                      Gap(Constants.spaceBwtItems),

                      //Product Price textfield
                      CommonTextField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "product price is empty";
                          }
                          return null;
                        },
                        controller: controller.productPriceController,
                        keyboardType: TextInputType.number,
                        label: "Product Price",
                        hintText: "रु 125..",
                        prefixIcon: Icon(Icons.person_3),
                      ),

                      Gap(Constants.spaceBwtItems),

                      //Category Drop Down
                      SelectedCategoryWidgets(),

                      //product company name text field
                      CommonTextField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Company name is empty";
                          }
                          return null;
                        },
                        controller: controller.companyNameController,
                        keyboardType: TextInputType.text,
                        label: "Company Name",
                        hintText: "Enter company name",
                      ),

                      Gap(Constants.spaceBwtItems),

                      //product description text field
                      CommonTextField(
                        maxLine: 5,
                        borderRadius: 10,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Description is empty";
                          }
                          return null;
                        },
                        controller: controller.productDescriptionController,
                        keyboardType: TextInputType.text,
                        label: "Product Description",
                        hintText: "Write something about product....",
                      ),

                      Gap(Constants.spaceBwtItems * 2),

                      //add product button
                      CommonButton(
                        text: "Add Product",
                        onTap: () async {
                          if (controller.categoryName.value != null) {
                            if (_formKey.currentState!.validate()) {
                              Loader.show(context);
                              await controller.addProduct();
                              Loader.hide();
                            }
                          } else {
                            snackBar(
                              msgType: "Warning",
                              message: "Select Category",
                              color: Colors.red,
                            );
                          }
                        },
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

  // void _showPicker(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.white,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //     ),
  //     builder: (BuildContext context) {
  //       return SafeArea(
  //         child: Wrap(
  //           children: <Widget>[
  //             ListTile(
  //               leading: const Icon(Icons.photo_library),
  //               title: const Text('Choose from Gallery'),
  //               onTap: () async {
  //                 Loader.show(context);
  //                 await controller.pickGalleryImage();
  //                 Get.back();
  //                 Loader.hide();
  //               },
  //             ),
  //             ListTile(
  //               leading: const Icon(Icons.camera_alt),
  //               title: const Text('Open Camera'),
  //               onTap: () async {
  //                 Loader.show(context);
  //                 await controller.pickCameraImage();
  //                 Get.back();
  //                 Loader.hide();
  //               },
  //             ),
  //             const SizedBox(height: 20), // Bottom padding
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}
