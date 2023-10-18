import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sazzadfood/Api/api_service_food.dart';
import 'package:sazzadfood/component/rounded_button.dart';
import 'package:sazzadfood/models/cartitem.dart';
import 'package:sazzadfood/myproviders/CartCounterProvider.dart';
import 'package:sazzadfood/screen/food/cart/component/quantity_handler.dart';
import 'package:sazzadfood/screen/food/cart/component/rounded_container.dart';
import 'package:sazzadfood/screen/food/place_order/place_order.dart';
import 'package:sazzadfood/staticdata/constants.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
class CartScreen extends StatefulWidget {
  CartScreen({super.key});
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  ApiServiceFood _apiServiceFood = ApiServiceFood();
  int quantity = 0;
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartCounterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: sPrimaryColor,
      ),
      body: FutureBuilder<List<CartItem>?>(
        future: _apiServiceFood.fetchCart(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('Your cart is empty.'),
            );
          } else {
            final data = snapshot.data;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.white60, Colors.white60])),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(2, 2, 10, 2),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [sPrimaryLightColor, sPrimaryLightColor])),
                              child: ListTile(
                                leading: ClipOval(
                                  child: Image.asset("assets/food/${data![index].img}"),
                                ),
                                title: Text(
                                  data![index].foodName,
                                  style: TextStyle(color: Colors.black),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Quantity: ${data![index].quantity.toString()}'),
                                    Text('Price: \৳${data![index].foodPrice.toString()}'),
                                  ],
                                ),
                                contentPadding: EdgeInsets.all(5),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 100,
                                      margin: EdgeInsets.zero,
                                      padding: EdgeInsets.all(0),
                                      child: QuantityHandler(
                                        onBtnTapped: (val) => quantity = val,
                                        getquantity: int.parse(data[index].quantity.toString()),
                                      ),
                                    ),
                                    Container(
                                      width: 20,
                                      margin: EdgeInsets.zero,
                                      padding: EdgeInsets.all(0),
                                      child: IconButton(
                                        onPressed: () {
                                          _apiServiceFood.deleteCartItem(data![index].foodId.toString());
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
                                        },
                                        icon: Icon(Icons.delete, color: Colors.red),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  child: Text("Order Details",
                  style: TextStyle(
                    fontSize: 20
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal:'),
                      Text('\৳${calculateSubtotal(data)}'), // Calculate the subtotal
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delevery Charge:'),
                      Text('\৳${60.00}'), // Calculate the subtotal
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Vat 5%:'),
                      Text('\৳${calculateVat(data)}'), // Calculate the subtotal
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black45,   // Change the color to your desired color
                  height: 15,            // Change the height to your desired height
                  thickness: 1,          // Change the thickness as needed
                  indent: 8,            // Change the starting point of the line
                  endIndent: 8,         // Change the ending point of the line
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total:'),
                      Text('\৳${calculateTotal(data)}'), // Calculate the subtotal
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 20, bottom: 5.00),
                  child: SwipeableButtonView(
                    buttonText: 'SLIDE TO ORDER',
                    buttonWidget: Container(
                      child: Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                      ),),
                    activeColor: sPrimaryColor,
                    isFinished: isFinished,
                    onWaitingProcess: () {
                      Future.delayed(Duration(seconds: 2), () {
                        setState(() {
                          isFinished = true;
                        });
                      });
                    },
                    onFinish: () async {
                      await Navigator.push(context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: PlaceOrder()));

                      //TODO: For reverse ripple effect animation
                      setState(() {
                        isFinished = false;
                      });
                    },
                  ),
                ),

              ],
            );
          }
        },
      ),
    );
  }

  double calculateSubtotal(List<CartItem>? cartItems) {
    double subtotal = 0;
    if (cartItems != null) {
      for (var item in cartItems) {
        double price = double.tryParse(item.foodPrice.toString()) ?? 0.0;
        subtotal += int.parse(item.quantity.toString()) * price;
      }
    }
    return subtotal;
  }

  double calculateVat(List<CartItem>? cartItems) {
    double vat = 0;
    if (cartItems != null) {
      for (var item in cartItems) {
        double price = double.tryParse(item.foodPrice.toString()) ?? 0.0;
        vat += (int.parse(item.quantity.toString()) * price)*5/100;
      }
    }
    return double.parse(vat.toStringAsFixed(2));
  }

  double calculateTotal(List<CartItem>? cartItems) {
    double subtotal = 0;
    if (cartItems != null) {
      for (var item in cartItems) {
        double price = double.tryParse(item.foodPrice.toString()) ?? 0.0;
        subtotal += int.parse(item.quantity.toString()) * price;
      }
    }
    subtotal=subtotal+60+calculateVat(cartItems);
    return double.parse(subtotal.toStringAsFixed(2));
  }
}
