import 'package:flutter/material.dart';
import 'package:sazzadfood/staticdata/constants.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({super.key});

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showPlaceOrderPopup() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Place My Order"),
          content: Text("Your order has been placed successfully."),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: sPrimaryColor,
          bottom: TabBar(
            labelColor: sPrimaryColor,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: sPrimaryDeepLightColor,
            ),
            controller: _tabController,
            tabs: [
              Tab(text: 'ADDRESS'),
              Tab(text: 'SHIPPING'),
              Tab(text: 'PREVIEW'),
              Tab(text: 'PAYMENT'),
            ],
          ),
          title: Text('Place Order'),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Column(
              children: [
                Text("Address tab content"),
                TextFormField(),
                ElevatedButton(
                  onPressed: () {
                    _tabController.animateTo(1); // Move to the next tab (SHIPPING)
                  },
                  child: Text("Next Shipping"),
                ),
              ],
            ),
            Column(
              children: [
                Text("Shipping tab content"),
                ElevatedButton(
                  onPressed: () {
                    _tabController.animateTo(2); // Move to the next tab (PREVIEW)
                  },
                  child: Text("Next Preview"),
                ),
              ],
            ),
            Column(
              children: [
                Text("Preview tab content"),
                ElevatedButton(
                  onPressed: () {
                    _tabController.animateTo(3); // Move to the next tab (PAYMENT)
                  },
                  child: Text("Next Payment"),
                ),
              ],
            ),
            Column(
              children: [
                Text("Payment tab content"),
                ElevatedButton(
                  onPressed: _showPlaceOrderPopup, // Show a pop-up for 'PLACE MY ORDER'
                  child: Text("PLACE MY ORDER POP UP"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
