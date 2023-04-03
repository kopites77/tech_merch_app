import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/models/cart_item.dart';
import 'cart.dart';
import 'home.dart';

/*******************************************************************************
 * Class name: Shop
 * Description: displays the product cards with a bottom navigation bar.
 *   When a product card is tapped, the app navigates to the product's page.
 *******************************************************************************/
class Shop extends StatelessWidget {
  //creates a list of 'Product' objects with the details of the products in the shop
  final List<Product> products = [
    Product(
      'T-shirt',
      'assets/tshirt-black-ilc.jpg',
      15.99,
      'tshirt',
      MaterialPageRoute(builder: (context) => Tshirt()),
    ),
    Product(
      'Hoodie',
      'assets/hoodie-white-while.jpg',
      49.99,
      'hoodie',
      MaterialPageRoute(builder: (context) => Hoodie()),
    ),
    Product(
      'Sweatshirt',
      'assets/sweatshirt-red-binary.jpg',
      29.99,
      'sweatshirt',
      MaterialPageRoute(builder: (context) => Sweatshirt()),
    ),
  ];

  @override
  // 'build' method to create the UI for the Shop page
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        automaticallyImplyLeading: false,
      ),

      //create a grid of cards displaying the products
      body: GridView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              //navigate to the respective product screen when tapped
              Navigator.push(
                context,
                products[index].route,
              );
            },
            child: Card(
              //create a card with an image, name, and price of the product
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.asset(products[index].image),
                  ),
                  Text(products[index].name),
                  Text('\$${products[index].price}'),
                ],
              ),
            ),
          );
        },
      ),

      //create a bottom navigation bar with Home, Cart, and Back icon buttons
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Back',
          ),
        ],

        //Define the onTap behavior for the navigation buttons
        onTap: (int index) {
          if (index == 0) {
            //navigate to the Home page when the Home button is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          } else if (index == 2) {
            //go back to the previous screen when the Back button is tapped
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}

/*******************************************************************************
 * Class name: ProductP
 * Description: store product information, the name, image, price, tag, and route.
 ********************************************************************************/
//Store product information
class Product {
  final String name;
  final String image;
  final double price;
  final String tag;
  final MaterialPageRoute route;

  Product(this.name, this.image, this.price, this.tag, this.route);
}

/*******************************************************************************
 * Class name: Tshirt, Hoodie, Sweatshirt
 * Description: display products details. Each has a build method that creates 
 *   a 'ProductPage' widget with the product's name, price, product tag, and a 
 *   MaterialPageRoute that navigates back to the 'Shop' page.
 *******************************************************************************/
class Tshirt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProductPage(
      productName: 'T-shirt',
      price: 15.99,
      productTag: 'tshirt',
      backPageRoute: MaterialPageRoute(builder: (context) => Shop()),
    );
  }
}

class Hoodie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProductPage(
      productName: 'Hoodie',
      price: 49.99,
      productTag: 'hoodie',
      backPageRoute: MaterialPageRoute(builder: (context) => Shop()),
    );
  }
}

class Sweatshirt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProductPage(
      productName: 'Sweatshirt',
      price: 29.99,
      productTag: 'sweatshirt',
      backPageRoute: MaterialPageRoute(builder: (context) => Shop()),
    );
  }
}

/*******************************************************************************
 * Class name: ProductPage
 * Description: displays product information such as the design print, color,
 * and allows users to select options using dropdown menus and color buttons
 * Functionalities:
 * ->'Add to Cart' - button adds the product with its info to the cart
 * ->bottom navigation bar - contains the Home, Cart, and Back buttons to 
 *   navigate between different pages.
 * 
 *******************************************************************************/
class ProductPage extends StatefulWidget {
  final String productName;
  final double price;
  final String productTag;
  final MaterialPageRoute backPageRoute;

  //contructor with named parameters to initiale the 'ProductPage'
  ProductPage({
    required this.productName,
    required this.price,
    required this.productTag,
    required this.backPageRoute,
  });

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String designPrint = 'ilc';
  String color = 'black';
  String size = 'Small';

  //overide build method to create the UI for the ProductPage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productName),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //display the product name and price
              Text(
                widget.productName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$${widget.price}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              //display the product image
              Center(
                child: Image.asset(
                  'assets/${widget.productTag}-${color}-${designPrint}.jpg',
                  width: MediaQuery.of(context).size.width * 0.7,
                ),
              ),
              SizedBox(height: 20),

              //dropdown for selecting design print
              Center(
                child: DropdownButton<String>(
                  value: designPrint,
                  onChanged: (String? newValue) {
                    setState(() {
                      designPrint = newValue!;
                    });
                  },
                  items: ['ilc', 'while', 'binary']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),

              //row of colow buttons for selecting color
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (Map<String, dynamic> colorData in [
                    {'value': 'black', 'color': Colors.black},
                    {'value': 'white', 'color': Colors.white},
                    {'value': 'red', 'color': Colors.red},
                    {'value': 'gray', 'color': Colors.grey},
                  ])
                    InkWell(
                      onTap: () {
                        setState(() {
                          color = colorData['value'] as String;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: color == colorData['value']
                                ? Colors.black
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: colorData['color'] as Color,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 20),

              //dropdown for selecting size
              Center(
                child: DropdownButton<String>(
                  value: size,
                  onChanged: (String? newValue) {
                    setState(() {
                      size = newValue!;
                    });
                  },
                  items: ['Small', 'Medium', 'Large', 'X-Large']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),

              // Add to Cart button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    final cart =
                        Provider.of<CartProvider>(context, listen: false);
                    cart.addItem(
                      id: widget.productTag,
                      name: widget.productName,
                      designPrint: designPrint,
                      color: color,
                      size: size,
                      price: widget.price,
                    );

                    //display a snack bar when the item is added to the cart
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Added to Cart!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Text('Add to Cart'),
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),

      //create the bottom navigation bar with Home, Cart, and Back icon buttons
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      Provider.of<CartProvider>(context).itemCount.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Back',
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            //navigate to the Home screen when the Home icon button is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          } else if (index == 1) {
            //navigate to the Cart page when the Cart icon button is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          } else if (index == 2) {
            //navigate to the previous page when the Back icon button is tapped
            Navigator.push(
              context,
              widget.backPageRoute,
            );
          }
        },
      ),
    );
  }
}
