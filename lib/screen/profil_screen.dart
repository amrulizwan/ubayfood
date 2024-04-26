import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffC70039),
      appBar: AppBar(
        backgroundColor: const Color(0xffC70039),
        elevation: 0,
        title: const Text("PROFILE"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 10),
          Center(
            child: Container(
              width: screenWidth * 0.4,
              height: screenHeight * 0.2,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                color: Colors.black,
                size: 100,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.white,
              width: 2,
            ))),
            padding: const EdgeInsets.all( 15),
            child: const Row(
              children: [
                Icon(
                  Icons.person_outline_outlined,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(width: 30),
                Text(
                  "I GEDE BAYU BALAWA",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.white,
              width: 2,
            ))),
            padding: const EdgeInsets.all(15),
            child: const Row(
              children: [
                Icon(
                  Icons.cake_outlined,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(width: 30),
                Text(
                  "29 June 2004",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.white,
              width: 2,
            ))),
            padding: const EdgeInsets.all(15),
            child: const Row(
              children: [
                Icon(
                  Icons.mail_outline,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(width: 30),
                Text(
                  "Bayubalawa1@gmail.com",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
           Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.white,
              width: 2,
            ))),
            padding: const EdgeInsets.all(15),
            child: const Row(
              children: [
                Icon(
                  Icons.phone_outlined,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(width: 30),
                Text(
                  "+62 898-6648-730",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
