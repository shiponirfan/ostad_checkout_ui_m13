import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  List<Map> cartItems = [
    {
      'title': 'Pullover',
      'image': 'assets/images/tshirt1.jpg',
      'color': 'Black',
      'size': 'L',
      'price': 51,
      'quantity': 1,
    },
    {
      'title': 'T-Shirt',
      'image': 'assets/images/tshirt2.png',
      'color': 'Gray',
      'size': 'L',
      'price': 30,
      'quantity': 1,
    },
    {
      'title': 'Sport Dress',
      'image': 'assets/images/tshirt3.jpeg',
      'color': 'Black',
      'size': 'M',
      'price': 43,
      'quantity': 1,
    },
  ];

  int get totalAmount {
    int total = 0;
    for (Map item in cartItems) {
      total += item['price'] * item['quantity'] as int;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf9f9f9),
      appBar: AppBar(
        title: const Text(
          'My Bag',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                Map item = cartItems[index];
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              item['image'],
                              width: 100,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['title'],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                Row(
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                            text: 'Color: ',
                                            style: const TextStyle(
                                                color: Colors.black26,
                                                fontSize: 16),
                                            children: <TextSpan>[
                                          TextSpan(
                                              text: item['color'],
                                              style: const TextStyle(
                                                  color: Colors.black))
                                        ])),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    RichText(
                                        text: TextSpan(
                                            text: 'Size: ',
                                            style: const TextStyle(
                                                color: Colors.black26,
                                                fontSize: 16),
                                            children: <TextSpan>[
                                          TextSpan(
                                              text: item['size'],
                                              style: const TextStyle(
                                                  color: Colors.black))
                                        ])),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Card(
                                        elevation: 5,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (item['quantity'] > 1) {
                                                item['quantity']--;
                                              }
                                            });
                                          },
                                          icon: const Icon(Icons.remove),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Text(
                                        '${item['quantity']}',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Card(
                                        elevation: 5,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              item['quantity']++;
                                            });
                                          },
                                          icon: const Icon(Icons.add),
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.more_vert),
                              Text(
                                '${item['price']}\$',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total amount:',
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '$totalAmount\$',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    SnackBar snackBar = const SnackBar(
                      content: Text('Thank you for the purchase'),
                      padding: EdgeInsets.all(20),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100)),
                    child: Text(
                      'Check Out'.toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
