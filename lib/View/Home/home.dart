import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hackerkernel_task_mohit_verma/ViewModel/home_viewmodel.dart';
import 'package:hackerkernel_task_mohit_verma/main.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: Text('Home'),
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: mq.height * 0.06,
          width: mq.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: mq.height * 0.1,
                width: mq.width * 0.13,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 209, 205, 205),
                    borderRadius: BorderRadius.circular(12)),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey,
                ),
              ),
              Container(
                height: mq.height * 0.1,
                width: mq.width * 0.12,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 240, 234, 234),
                    borderRadius: BorderRadius.circular(12)),
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Consumer<HomeViewmodel>(
            builder: (context, homemodel, child) {
              return Column(
                children: [
                  SizedBox(
                    height: mq.height * 0.01,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Hi-Fi Shop & Service',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Audio shop on rustaveli ave 57.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'This shop offers both products and services.',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  homemodel.productsList.isEmpty
                      ? SizedBox()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Prpoducts ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                                children: [
                                  TextSpan(
                                    text: homemodel.productsList.length
                                        .toString(),
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      //decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Navigate to the Register screen
                                        // Use Navigator.of(context).pushNamed('/register') if you have named routes
                                      },
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Show all',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                  Container(
                    width: double.infinity,
                    height: mq.height * 0.28,
                    child: homemodel.productsList.isEmpty
                        ? Center(child: Text('No Product Found!'))
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            //  physics: ,
                            itemCount: homemodel.productsList.length,
                            itemBuilder: (context, index) {
                              var items = homemodel.productsList[index];
                              return Container(
                                height: mq.height * 0.6,
                                width: mq.width * 0.45,
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CachedNetworkImage(
                                          fit: BoxFit.fitWidth,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1.0,
                                          imageUrl:
                                              items['image'].toString() ?? '',
                                          placeholder: (context, url) => Center(
                                              child: CupertinoActivityIndicator(
                                            color: Colors.black12,
                                          )),
                                          errorWidget: (context, url, error) =>
                                              Image.network(
                                                  fit: BoxFit.cover,
                                                  'https://cdn3.vectorstock.com/i/1000x1000/51/87/404-page-not-found-banner-error-design-vector-21065187.jpg'),
                                        ),

                                        // RatingStars(
                                        //   editable: false,
                                        //   rating: item["rating"],
                                        //   color: Colors.amber,
                                        //   iconSize: 15,
                                        // ),
                                        const SizedBox(
                                          height: 3,
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 5, left: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                //item['price'].toString() ?? 'price',
                                                '\$' +
                                                        items['price']
                                                            .toString() ??
                                                    '',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                    color: Color(0xff4CD47B)),
                                              ),
                                            ],
                                          ),
                                        ),

                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 5, left: 5),
                                            child: Text(
                                              // item["brand_name"].toString(),
                                              items['name'].toString() ?? '',
                                              overflow: TextOverflow
                                                  .ellipsis, // Clip the text without ellipsis if it overflows
                                              maxLines: 2,
                                              softWrap: false,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                              // maxLines: 2, // Adjust the max lines as per your requirement
                                              // overflow: TextOverflow.ellipsis, // Handle overflow
                                              // textAlign: TextAlign.left, // Optional: center the text
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: IconButton(
                                          onPressed: () {
                                            homemodel.removeItem(index);
                                          },
                                          icon: Icon(
                                              Icons.delete_outline_outlined)),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  homemodel.accessoriesList.isEmpty
                      ? SizedBox()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Accessories ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                                children: [
                                  TextSpan(
                                    text: homemodel.accessoriesList.length
                                        .toString(),
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      //decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Navigate to the Register screen
                                        // Use Navigator.of(context).pushNamed('/register') if you have named routes
                                      },
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Show all',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                  Container(
                    width: double.infinity,
                    height: mq.height * 0.3,
                    child: homemodel.accessoriesList.isEmpty
                        ? Center(child: Text('No Product Found!'))
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            //  physics: ,
                            itemCount: homemodel.accessoriesList.length,
                            itemBuilder: (context, index) {
                              var items = homemodel.accessoriesList[index];
                              return Container(
                                height: mq.height * 0.6,
                                width: mq.width * 0.45,
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CachedNetworkImage(
                                          fit: BoxFit.scaleDown,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1.0,
                                          imageUrl:
                                              items['image'].toString() ?? '',
                                          placeholder: (context, url) => Center(
                                              child: CupertinoActivityIndicator(
                                            color: Colors.black12,
                                          )),
                                          errorWidget: (context, url, error) =>
                                              Image.network(
                                                  fit: BoxFit.cover,
                                                  'https://cdn3.vectorstock.com/i/1000x1000/51/87/404-page-not-found-banner-error-design-vector-21065187.jpg'),
                                        ),

                                        // RatingStars(
                                        //   editable: false,
                                        //   rating: item["rating"],
                                        //   color: Colors.amber,
                                        //   iconSize: 15,
                                        // ),
                                        const SizedBox(
                                          height: 3,
                                        ),

                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 5, left: 5),
                                            child: Text(
                                              // item["brand_name"].toString(),
                                              items['name'].toString() ?? '',
                                              overflow: TextOverflow
                                                  .ellipsis, // Clip the text without ellipsis if it overflows
                                              maxLines: 2,
                                              softWrap: false,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                              // maxLines: 2, // Adjust the max lines as per your requirement
                                              // overflow: TextOverflow.ellipsis, // Handle overflow
                                              // textAlign: TextAlign.left, // Optional: center the text
                                            ),
                                          ),
                                        ),

                                        Row(
                                          children: [
                                            Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: items['status']
                                                              .toString() ==
                                                          'Available'
                                                      ? Colors.green
                                                      : Colors.red),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              items['status'].toString(),
                                              style: TextStyle(
                                                  color: items['status']
                                                              .toString() ==
                                                          'Available'
                                                      ? Colors.green
                                                      : Colors.red,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 5, left: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                //item['price'].toString() ?? 'price',
                                                '\$' +
                                                        items['price']
                                                            .toString() ??
                                                    '',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                    color: Color(0xff4CD47B)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: IconButton(
                                          onPressed: () {
                                            homemodel.removeAccessories(index);
                                          },
                                          icon: Icon(
                                            Icons.delete_forever,
                                            size: 30,
                                          )),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showLogoutDialog(context);
                    },
                    child: Container(
                      // padding: EdgeInsets.only(top: 10),
                      margin: EdgeInsets.only(
                          top: mq.height * 0.04, bottom: mq.height * 0.02),
                      height: mq.height * 0.05,
                      width: mq.width * 0.8,
                      child: Text(
                        'LogOut',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            // color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/addproduct');
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }

  Future<void> showLogoutDialog(
    BuildContext context,
  ) {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // Prevents closing the dialog by tapping outside
      builder: (BuildContext context) {
        return Consumer<HomeViewmodel>(
          builder: (context, homevmodel, child) {
            return AlertDialog(
              title: Text('Logout'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Are you sure you want to log out?'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
                TextButton(
                  child: Text('Logout'),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                    // Call the logout function
                    homevmodel.logout(context);
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
