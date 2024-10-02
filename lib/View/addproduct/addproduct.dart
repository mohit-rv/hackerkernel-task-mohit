import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hackerkernel_task_mohit_verma/CustomWidgets/custom_textform.dart';
import 'package:hackerkernel_task_mohit_verma/ViewModel/home_viewmodel.dart';
import 'package:hackerkernel_task_mohit_verma/main.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class AddProductInList extends StatelessWidget {
  const AddProductInList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Consumer<HomeViewmodel>(
            builder: (context, homeModel, child) {
              return Form(
                key: homeModel.homeformKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: mq.height * 0.04,
                    ),
                    Text(
                      'Add product in List',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(
                      height: mq.height * 0.04,
                    ),

                    // Image display area
                    homeModel.selectedImage != null
                        ? Image.file(homeModel.selectedImage!,
                            height: 150, width: 150)
                        : Container(
                            height: 150,
                            width: 150,
                            color: Colors.grey[300],
                            child: Icon(Icons.image, color: Colors.grey),
                          ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            homeModel.pickImage(ImageSource.camera);
                          },
                          icon: Icon(Icons.camera),
                          label: Text('Camera'),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton.icon(
                          onPressed: () {
                            homeModel.pickImage(ImageSource.gallery);
                          },
                          icon: Icon(Icons.photo),
                          label: Text('Gallery'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: mq.height * 0.04,
                    ),
                    Container(
                      height: 30,
                      width: mq.width * 0.8,
                      margin: EdgeInsets.only(left: mq.width * 0.02),
                      child: CustomTextFormField(
                        hintText: 'Enter product name',
                        controller: homeModel.nameController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter product name';
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: mq.height * 0.04,
                    ),
                    Container(
                      height: 30,
                      width: mq.width * 0.8,
                      margin: EdgeInsets.only(left: mq.width * 0.02),
                      child: CustomTextFormField(
                        hintText: 'Enter product price',
                        controller: homeModel.priceController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please Enter product price';
                          }
                        },
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        //  showLogoutDialog(context);
                        if (homeModel.homeformKey.currentState!.validate()) {
                          //  homeModel.productsList.add(value)
                          homeModel.addProductToList(
                              homeModel.nameController.text,
                              homeModel.priceController.text,
                              homeModel.selectedImage!,
                              context);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 5),
                        margin: EdgeInsets.only(
                            top: mq.height * 0.05,
                            bottom: mq.height * 0.02,
                            left: mq.width * 0.02),
                        height: mq.height * 0.05,
                        width: mq.width * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blueAccent),
                        child: Text(
                          'Add product',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              //  decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
