import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewmodel extends ChangeNotifier {
  final homeformKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  // Sample product list with multiple items
  List<Map<String, dynamic>> productsList = [
    {
      'name': 'AKG N0N7MCFGJH Wireless Headphones',
      'price': '199.0',
      'image':
          'https://headsetsindia.com/wp-content/uploads/2020/06/evolve2_65b-1-750x750.jpg', // Replace with your actual image path
    },
    {
      'name': 'Sony WH-1000XM4 Noise Cancelling Headphones',
      'price': '349.99',
      'image':
          'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTv3MIZZhzEYRslBmuby99jALnB6suL9KtIetIQ45Scc2eHklsYFViD8tv_syw27LQHPS5BcePZvHnCSAK4WmkIoFezPKMD-vYSV7-896_6Ibe3wywdow7fW8EvIcjTSstzEu3BdYE&usqp=CAc',
    },
    {
      'name': 'Bose QuietComfort 35 II',
      'price': '299.99',
      'image':
          'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQGPgb2a4e87BfeaevwfOh-PNkXku_b6BEJPQzsopttlMcc2JXQF9FYHDRo-FF1KHz67rh2vUWWTCnFENGtbyppoosbrSOw1Ctk54Hk3lqsiUT7rCe8wwJSWrAB1qNBOvd4XpA9kLjcJg&usqp=CAc',
    },
    {
      'name': 'JBL Live 650BTNC Wireless Headphones',
      'price': '149.99',
      'image':
          'https://headsetsindia.com/wp-content/uploads/2020/06/evolve2_65b-1-750x750.jpg',
    },
  ];

  File? selectedImage; // Store the selected image

  final ImagePicker _picker = ImagePicker();

  // Method to pick image from camera or gallery
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      log('pickedFile:  $pickedFile');
      selectedImage = File(pickedFile.path);
      notifyListeners();
    } else {
      log('Error: $pickedFile');
    }
  }

// Method to add product to the list
  void addProductToList(
      String name, String price, File image, BuildContext context) {
    if (selectedImage != null) {
      productsList.add({
        'name': name,
        'price': price,
        'image': image.path, // Store the image path
      });
      log('product added');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product added successfully!')),
      );
      nameController.clear();
      priceController.clear();
      selectedImage = null; // Clear the selected image
      notifyListeners(); // Notify listeners to update the UI
    } else {
      // Handle the case where the image is not selected
      log('Please select an image');
    }
  }

  // Method to remove an item from the list
  void removeItem(int index) {
    productsList.removeAt(index);
    notifyListeners(); // Notify listeners to update the UI
  }

  List<Map<String, dynamic>> accessoriesList = [
    {
      'name': 'AKG N0N7MCFGJH Wireless Headphones',
      'price': '199.0',
      'image':
          'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcR-FpkjJZXlFgwYqILUj19olOQovh2uAA5TK74kMxSMwQ0Fwwf2y0uJGJF6X-L6nel13boICjUGiTpBQaLvCgBOOB9zT_3DvV4keC92SGI60FXzfMMKM2i1Usah6KOVMmGHUv8XSAg&usqp=CAc', // Replace with your actual image path
      'status': 'Available'
    },
    {
      'name': 'Sony WH-1000XM4 Noise Cancelling Headphones',
      'price': '349.99',
      'image':
          'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSp51gMEi-oAzQM5ndgm-DNhl8J-XjG-8v_j-9oe8GayPnFdYLkH3ceMAUxe0LCp-faI5mSkP_oaGLol9z6kHMIOFN6Cd6uijOegAj-LJLlUaaE9sV73ca6tUMJio-kjdmEgGcbBONf1A&usqp=CAc',
      'status': 'Unavailable'
    },
    {
      'name': 'Bose QuietComfort 35 II',
      'price': '299.99',
      'image':
          'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQKGLOCcuvEAlMw8JcJD2sAFtq0sR6-rn9BrclHC0wt_KfB0WiOEYXsqz5neTs4tpzYlzWYcoFeInO1gYMvAgRJR8IuT8tq0whh0xpXvfmJdAXwQjvqKMw-yTph8-5yZ6RN6t857ZRAQw&usqp=CAc',
      'status': 'Available'
    },
    {
      'name': 'JBL Live 650BTNC Wireless Headphones',
      'price': '149.99',
      'image':
          'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQKGLOCcuvEAlMw8JcJD2sAFtq0sR6-rn9BrclHC0wt_KfB0WiOEYXsqz5neTs4tpzYlzWYcoFeInO1gYMvAgRJR8IuT8tq0whh0xpXvfmJdAXwQjvqKMw-yTph8-5yZ6RN6t857ZRAQw&usqp=CAc',
      'status': 'Available'
    },
  ];
  void removeAccessories(int index) {
    accessoriesList.removeAt(index);
    notifyListeners(); // Notify listeners to update the UI
  }

  // Logout method
  Future<void> logout(BuildContext context) async {
    log('logout action');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear the login status
    Navigator.pushReplacementNamed(
        context, '/login'); // Navigate back to login screen
  }
}
