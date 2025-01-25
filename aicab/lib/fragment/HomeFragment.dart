import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '/component/CarRowWidget.dart';
//import '/screen/DetailScreen.dart';
import '/utils/DataExamples.dart';
//import '/utils/Widgets.dart';

import '/model/CarModel.dart';





class HomeFragment extends StatefulWidget {

  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}


class _HomeFragmentState extends State<HomeFragment> {
  final List<CarModel> list = getAvailableCars();

  //int currentIndex = 0;
  //String filterAlcohol = '';
  //List<DrinkModel> FilteredList = [];


  @override
  void initState() {
    //FilteredList = list; 
    super.initState();
  }


  /*void filterDrinksByAlcohol(String alcohol) {
    setState(() {
      filterAlcohol = alcohol;
      // Use the 'where' method to filter products by price
      FilteredList = list
          .where((drink) =>
              drink.includedAlcohols!.contains(filterAlcohol))
          .toList();
      if (alcohol=='Wszystko'){
        FilteredList = list;
      }
    });
  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Color(0x00000000), width: 1),
        ),
        title: Text("Wybierz taksówkę", style: boldTextStyle()),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            //const SizedBox(height: 16),
            /*SizedBox(
              height: 35,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 8, right: 8),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: drinktypes.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      currentIndex = index;
                      setState(() {});
                      filterDrinksByAlcohol(drinktypes[index]);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                      decoration: BoxDecoration(
                        color: currentIndex == index ? const Color(0xff000000) : context.cardColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
                      ),
                      child: Text(
                        drinktypes[index],
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: boldTextStyle(size: 12, color: currentIndex == index ? Colors.white : Colors.grey),
                      ),
                    ),
                  );
                },
              ),
            ),
            */
            


            //const SizedBox(height: 16),
            Responsive(
              mobile: ListView.separated(
                padding: const EdgeInsets.all(16),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: list.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 24);
                },
                itemBuilder: (_, index) {
                  return InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    //DetailScreen(car: list[index]).launch(context);
                  },
                  child: CarRowWidget(name: list[index].name, img: list[index].img, year: list[index].year, price: list[index].price),
                );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
