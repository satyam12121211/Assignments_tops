import 'package:flutter/material.dart';

class shoping4 extends StatefulWidget {
  const shoping4({super.key});

  @override
  State<shoping4> createState() => _shoping4State();
}

class _shoping4State extends State<shoping4> {
  int myindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 90),
            Text('Cart', style: TextStyle(fontSize: 20)),
            SizedBox(width: 120),
            Icon(Icons.shopping_cart_outlined),
          ],
        ),
      ),

      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Row(
                children: [
                  SizedBox(width: 32),
                  Container(
                    height: 160,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/t-1.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  'Nike air Max',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 40),
                                Icon(Icons.subscript),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  'Size:9',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  " ₹100.00",
                                  style: TextStyle(color: Colors.red),
                                ),
                                SizedBox(width: 4),
                                CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  child: Icon(Icons.subscript),
                                ),
                                SizedBox(width: 4),
                                Text('02', style: TextStyle(fontSize: 15)),
                                SizedBox(width: 4),
                                CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 32),
                  Container(
                    height: 160,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/t-2.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  'Nike air Max',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 40),
                                Icon(Icons.subscript),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  'Size:9',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  " ₹100.00",
                                  style: TextStyle(color: Colors.red),
                                ),
                                SizedBox(width: 4),
                                CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  child: Icon(Icons.subscript),
                                ),
                                SizedBox(width: 4),
                                Text('02', style: TextStyle(fontSize: 15)),
                                SizedBox(width: 4),
                                CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 32),
                  Container(
                    height: 160,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/t-1.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  'Nike air Max',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 40),
                                Icon(Icons.subscript),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  'Size:9',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  " ₹100.00",
                                  style: TextStyle(color: Colors.red),
                                ),
                                SizedBox(width: 4),
                                CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  child: Icon(Icons.subscript),
                                ),
                                SizedBox(width: 4),
                                Text('02', style: TextStyle(fontSize: 15)),
                                SizedBox(width: 4),
                                CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 32),
                  Container(
                    height: 160,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/t-2.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  'Nike air Max',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 40),
                                Icon(Icons.subscript),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  'Size:9',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  " ₹100.00",
                                  style: TextStyle(color: Colors.red),
                                ),
                                SizedBox(width: 4),
                                CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  child: Icon(Icons.subscript),
                                ),
                                SizedBox(width: 4),
                                Text('02', style: TextStyle(fontSize: 15)),
                                SizedBox(width: 4),
                                CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 30),
                  Text(
                    'Total Amount',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 80),
                  Text(
                    '₹400.00',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(backgroundColor: Colors.red),
                child: SizedBox(
                  height: 30,
                  width: 250,
                  child: Row(
                    children: [
                      Text(
                        'Proceed to Check Out',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        child: Icon(
                          Icons.chevron_right_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            myindex = value;
          });
        },
        currentIndex: myindex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_sharp),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
