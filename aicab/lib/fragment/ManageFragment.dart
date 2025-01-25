/*import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '/utils/Widgets.dart';
import 'package:provider/provider.dart';



class CartFragment extends StatefulWidget {
  const CartFragment({super.key});

  @override
  CartFragmentState createState() => CartFragmentState();
}

class CartFragmentState extends State<CartFragment> {
  final List<OrderModel> list = getOrders();
  final List<DrinkModel> drinklist = getAllDrinks();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrdersVM>(
      builder: (context, value, child) => Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Color(0x00000000), width: 1),
        ),
        title: Text("Twoje zamówienia", style: boldTextStyle()),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        shrinkWrap: true,
        itemCount: value.list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                DrinkModel res = drinklist.firstWhere(
                  (element) => element.name!.contains(value.list[index].drink!)
                );
                DetailScreen(drink: res).launch(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white12, width: 1),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image(image: AssetImage(value.list[index].img!), height: 80, width: 140, fit: BoxFit.fitHeight),
                    ),
                  ),
                  const SizedBox(height: 16, width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(value.list[index].drink!, textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle()),
                      const SizedBox(height: 4),
                      Text(value.list[index].status!, textAlign: TextAlign.start, overflow: TextOverflow.clip, style: secondaryTextStyle()),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            value.list[index].ordertime!.toString().substring(0,16),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: boldTextStyle(size: 14),
                          ),
                          const SizedBox(width: 32),
                          //Text('x1', style: secondaryTextStyle(size: 14))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
    );
  }
}*/
