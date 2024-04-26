import 'package:flutter/material.dart';
import 'package:ubayfood/class/model.dart';
import 'package:ubayfood/screen/home_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.sub, required this.total});
  final double sub;
  final double total;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int kondisi = 0;
  Color k1 = Colors.white;

  Color k2 = Colors.white;
  Color k3 = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBE5DD),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60)),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          icon: const Icon(Icons.arrow_back_rounded)),
                    ),
                    const Text(
                      'Payment Method',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF383838),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60)),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.format_list_bulleted)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Choose a Payment',
                          style: TextStyle(
                            color: Color(0xFF383838),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        setState(() {
                          kondisi = 1;
                          k1 = const Color(0xffD5FFD0);
                          k2 = Colors.white;
                          k3 = Colors.white;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            color: k1,
                            borderRadius: BorderRadiusDirectional.circular(14)),
                        child: const Center(
                          child: Row(
                            children: [
                              SizedBox(width: 20),
                              Icon(
                                Icons.payments_outlined,
                                color: Color(0xffA9411D),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Cash Payment',
                                style: TextStyle(
                                  color: Color(0xFF383838),
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        setState(() {
                          kondisi = 1;
                          k1 = Colors.white;
                          k2 = const Color(0xffD5FFD0);
                          k3 = Colors.white;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            color: k2,
                            borderRadius: BorderRadiusDirectional.circular(14)),
                        child: const Center(
                          child: Row(
                            children: [
                              SizedBox(width: 20),
                              Icon(
                                Icons.account_balance_wallet_outlined,
                                color: Color(0xffA9411D),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Bank Transfer',
                                style: TextStyle(
                                  color: Color(0xFF383838),
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        setState(() {
                          kondisi = 1;
                          k1 = Colors.white;
                          k2 = Colors.white;
                          k3 = const Color(0xffD5FFD0);
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            color: k3,
                            borderRadius: BorderRadiusDirectional.circular(14)),
                        child: const Row(
                          children: [
                            SizedBox(width: 20),
                            Icon(
                              Icons.credit_card,
                              color: Color(0xffA9411D),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Credit / Debit Card',
                              style: TextStyle(
                                color: Color(0xFF383838),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              children: [
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Sub total',
                                      style: TextStyle(
                                        color: Color(0xFF968B7B),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      '\$${widget.sub.toStringAsFixed(2)}',
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        color: Color(0xFFA9411D),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Taxes & fees',
                                      style: TextStyle(
                                        color: Color(0xFF968B7B),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      '\$10.00',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFFA9411D),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Delivery Fee',
                                      style: TextStyle(
                                        color: Color(0xFF968B7B),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      '\$5.00',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFFA9411D),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 1,
                            child: CustomPaint(
                              painter: DashedLinePainter2(),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total Price',
                                  style: TextStyle(
                                    color: Color(0xFF383838),
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '\$${widget.total.toStringAsFixed(2)}',
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                    color: Color(0xFF383838),
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
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
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  setState(() {
                    if (kondisi == 0) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title:
                                const Text('Belum Memilih Metode Pembayaran'),
                            content: const Text(
                                'Silahkan Klik salah satu metode pembayaran'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Tutup'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Center(child: Text('Payment Succes')),
                            content: const Icon(
                              Icons.check_circle_outline_outlined,
                              size: 150,
                              color: Colors.green,
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Close'),
                                onPressed: () {
                                  setState(() {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen()),
                                      (route) => true,
                                    );
                                  });
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  width: double.infinity,
                  height: 70,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(-0.71, 0.71),
                      end: Alignment(0.71, -0.71),
                      colors: [Color(0xFF181516), Color(0xFF414141)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Payment',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
