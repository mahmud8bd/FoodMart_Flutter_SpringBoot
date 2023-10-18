import 'package:flutter/material.dart';
import 'package:sazzadfood/screen/food/foodDetails/components/rounded_container.dart';
import 'package:sazzadfood/staticdata/constants.dart';


//riga -> pulsante -, pulsante + e Numero che rappresenta la quantità
class QuantityHandler extends StatefulWidget {
  final Function(int) onBtnTapped;
  final int getquantity;
  const QuantityHandler({
    Key? key,
    required this.onBtnTapped, required this.getquantity,
  }) : super(key: key);

  @override
  State<QuantityHandler> createState() => _QuantityHandlerState();
}

class _QuantityHandlerState extends State<QuantityHandler> {
  int quantity = 1;
  @override
  void initState() {
    quantity = widget.getquantity;
    super.initState();
  }
  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: (context, cons) {
        return Row(
          children: [
            RoundedContainer(
              width: cons.maxWidth * 0.10,
              height: cons.maxWidth * 0.09,
              color: sPrimaryColor,
              child: GestureDetector(
                  onTap: quantity <= 1
                      ? null
                      : () {
                          quantity--;
                          widget.onBtnTapped(quantity);
                          setState(() {});
                        },
                  child: const FittedBox(
                    child: Icon(
                      Icons.remove,
                      color: Colors.red,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "$quantity",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            RoundedContainer(
              width: cons.maxWidth * 0.09,
              height: cons.maxWidth * 0.09,
              color: sPrimaryColor,
              child: GestureDetector(
                onTap: () => setState(() {
                  quantity++;
                  widget.onBtnTapped(quantity);
                }),
                child: const FittedBox(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      });
}
