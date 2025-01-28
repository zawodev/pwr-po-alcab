import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '/utils/Widgets.dart';
import 'MapScreen.dart';


import '/model/CarModel.dart';

class DetailScreen extends StatefulWidget {
  final CarModel? car;

  const DetailScreen({super.key, this.car});

  @override
  DetailScreenState createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {
  int index = 0;
  List<String> img = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    img.insert(0, widget.car!.img.validate());
    img.insert(1, widget.car!.img2.validate());
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero, side: BorderSide(color: Color(0x00000000), width: 1)),
        leading: InkWell(
          onTap: () {
            finish(context);
          },
          child: Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
        ),
        actions: [
          Icon(Icons.favorite_border, color: context.iconColor, size: 20).paddingOnly(right: 16),
        ],
      ),


      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
              child: Column(
                children: [
                  Image(
                    image: AssetImage(img[index]),
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitHeight,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: img.map((e) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        radius: 8,
                        onTap: () {
                          setState(() {
                            index = img.indexOf(e);
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: context.cardColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: index == img.indexOf(e) ? Colors.red : Colors.transparent,
                            ),
                          ),
                          child: Image(image: AssetImage(e.validate()), height: 40, width: 40, fit: BoxFit.cover),
                        ),
                      ).paddingRight(8);
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.car!.year!.toString(), textAlign: TextAlign.start, overflow: TextOverflow.clip, style: secondaryTextStyle()),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(widget.car!.name!, textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle()),
                      Text("500ml", textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle()),
                    ],
                  ),
                  

                  const SizedBox(height: 16, width: 16),
                  Text("Opis", textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle()),
                  const SizedBox(height: 8),
                  Text(
                      widget.car!.price!.toString(),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: secondaryTextStyle()),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: ChooseCarAppButton(
                context: context,
                title: 'Wybierz',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapScreen(
                        carName: widget.car!.name!,
                        price: widget.car!.price!,
                        carImagePath: widget.car!.img!,
                      ),
                    ),
                  );
                },
              ),
            ),
            

          ],
        ),
      ),
    );
  }
}
