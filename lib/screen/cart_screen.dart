import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubayfood/class/model.dart';
import 'package:ubayfood/screen/payment_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, required this.selectedItems});
  final List<MenuItem> selectedItems;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _increaseQuantity(int index) {
    setState(() {
      widget.selectedItems[index].quantity++;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (widget.selectedItems[index].quantity > 1) {
        widget.selectedItems[index].quantity--;
      } else {
        widget.selectedItems.removeAt(index);
      }
    });
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Keranjang Masih Kosong'),
          content:
              const Text('Silahkan isi keranjang untuk menuju halaman payment'),
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
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = widget.selectedItems
        .fold(0, (sum, item) => sum + (item.price * item.quantity));

    return Scaffold(
      backgroundColor: const Color(0xffEBE5DD),
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
                      'My Cart',
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
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                height: 385,
                child: ListView.builder(
                    itemCount: widget.selectedItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Container(
                              width: 122,
                              height: 122,
                              decoration: BoxDecoration(
                                  color: const Color(0xffC70039),
                                  borderRadius: BorderRadius.circular(24)),
                              child: Container(
                                width: 84,
                                height: 87,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(widget
                                            .selectedItems[index].image))),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.selectedItems[index].name,
                                  style: const TextStyle(
                                    color: Color(0xFF383838),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  widget.selectedItems[index].description,
                                  style: const TextStyle(
                                    color: Color(0xFF968B7B),
                                    fontSize: 10,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '\$${widget.selectedItems[index].price.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    color: Color(0xFF968B7B),
                                    fontSize: 10,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _decreaseQuantity(index);
                                        });
                                      },
                                      child: const SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: Icon(
                                            CupertinoIcons.minus_circled,
                                            color: Color(0xff968B7B),
                                          )),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      '${widget.selectedItems[index].quantity}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Color(0xFF383838),
                                        fontSize: 10,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    InkWell(
                                      onTap: () {
                                        _increaseQuantity(index);
                                      },
                                      child: const SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: Icon(
                                            Icons.add_circle_outline_rounded,
                                            color: Color(0xff968B7B),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          '\$${totalAmount.toStringAsFixed(2)}',
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 1,
                      child: CustomPaint(
                        painter: DashedLinePainter(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
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
                          '\$${(totalAmount + 10.00 + 5.00).toStringAsFixed(2)}',
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
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (totalAmount == 0) {
                            _showAlertDialog(context);
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentScreen(
                                        sub: totalAmount,
                                        total: totalAmount + 10.00 + 5.00,
                                      )),
                            );
                          }
                        });
                      },
                      child: Container(
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
                            'Checkout',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
