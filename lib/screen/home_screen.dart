import 'package:flutter/material.dart';
import 'package:ubayfood/class/model.dart';
import 'package:ubayfood/screen/cart_screen.dart';
import 'package:ubayfood/screen/chat_screen.dart';
import 'package:ubayfood/screen/profil_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<MenuItem> _menuItems = [
    MenuItem(
      name: 'Yakisoba Noodles',
      image: 'assets/image/1.png',
      price: 10.00,
      description: 'Noodle with Pork',
    ),
    MenuItem(
      name: 'Thai Fried Noodles',
      image: 'assets/image/2.png',
      price: 12.00,
      description: 'Noodle with Shrimp',
    ),
    MenuItem(
      name: 'Stir-Fried Chicken',
      image: 'assets/image/3.png',
      price: 12.00,
      description: 'Chicken with Peanuts',
    ),
    MenuItem(
        name: 'Prawn Fried Rice',
        image: 'assets/image/4.png',
        price: 12.00,
        description: 'Fried Rice with Prawns'),
    MenuItem(
        name: 'Pork Fried Noodles',
        image: 'assets/image/5.png',
        price: 10.00,
        description: 'Fried Noodles with Pork'),
    MenuItem(
        name: 'Sauté fried fish',
        image: 'assets/image/6.png',
        price: 11.00,
        description: 'Sauteed Fried Fish with Chili'),
    MenuItem(
        name: 'Egg Noodle Soup',
        image: 'assets/image/7.png',
        price: 10.00,
        description: 'Egg Noodle Soup with Pork'),
    MenuItem(
        name: 'Roast Pork Salad',
        image: 'assets/image/8.png',
        price: 12.00,
        description: 'Pork Salad with Berry Rice'),
    MenuItem(
        name: 'Wok Noodles',
        image: 'assets/image/9.png',
        price: 13.00,
        description: 'Pasta with Chicken Fillet'),
    MenuItem(
        name: 'Wheat Noodles Tofu',
        image: 'assets/image/10.png',
        price: 15.00,
        description: 'Wheat Noodles with Tofu'),
  ];

  final List<MenuItem> _selectedItems = [];

  String _searchQuery = '';

  void _addToCart(MenuItem menuItem) {
    int existingIndex =
        _selectedItems.indexWhere((item) => item.name == menuItem.name);

    setState(() {
      if (existingIndex != -1) {
        _selectedItems[existingIndex] = MenuItem(
          name: menuItem.name,
          price: menuItem.price,
          quantity: _selectedItems[existingIndex].quantity + 1,
          image: menuItem.image,
          description: menuItem.description,
        );
      } else {
        _selectedItems.add(MenuItem(
          name: menuItem.name,
          price: menuItem.price,
          quantity: 1,
          image: menuItem.image,
          description: menuItem.description,
        ));
      }
    });
  }

  List<MenuItem> get _filteredMenuItems {
    if (_searchQuery.isEmpty) {
      return _menuItems;
    } else {
      return _menuItems
          .where((item) =>
              item.name.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screemWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffFFF5E0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffC70039),
        elevation: 0,
        title: const Text("UBAYS FOODS"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: const BoxDecoration(
                    color: Color(0xffC70039),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatScreen()),
                          );
                        });
                      },
                      icon: const Icon(
                        Icons.chat_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CartScreen(selectedItems: _selectedItems)),
                          );
                        });
                      },
                      icon: const Icon(
                        Icons.shopping_cart_sharp,
                        color: Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfilScreen()),
                          );
                        });
                      },
                      icon: const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFF443010),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 20, top: 30, bottom: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "#eatwelleveryday",
                                style: TextStyle(
                                  color: Colors.white
                                      .withOpacity(0.3499999940395355),
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Do you have a 70%",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const Text(
                                "off meal cupppon!",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const Spacer(),
                              const Text(
                                "promo period 4 - 15 Apr 2023",
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: screemWidht * 0.32,
                          height: 130,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage("assets/image/1.png"),
                              ),
                              borderRadius: BorderRadius.circular(130)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: double.infinity,
                    // height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                      style: const TextStyle(
                        color: Color(0xFF958B7A),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Find what you want...',
                        prefixIcon: Container(
                          margin: const EdgeInsets.only(left: 15, right: 10),
                          child: const Icon(
                            Icons.search,
                            color: Color(0xFF958B7A),
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: _filteredMenuItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            top: 25,
                          ),
                          decoration: BoxDecoration(
                              color: const Color(0xffC70039),
                              borderRadius: BorderRadius.circular(24)),
                          width: 184,
                          height: 194,
                          child: Center(
                            child: Column(
                              children: [
                                const SizedBox(height: 93),
                                Text(
                                  _filteredMenuItems[index].name,
                                  style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _filteredMenuItems[index].description,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Color(0xFFF8BF40),
                                    fontSize: 10,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  '\$${_filteredMenuItems[index].price.toStringAsFixed(2)}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 45,
                          ),
                          width: 115,
                          height: 115,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage(_filteredMenuItems[index].image),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          left: 85,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "${_filteredMenuItems[index].name} Telah ditambahkan ke keranjang"),
                                    duration: const Duration(seconds: 1),
                                  ),
                                );
                                _addToCart(_filteredMenuItems[index]);
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 4, color: const Color(0xffEBE5DD)),
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
