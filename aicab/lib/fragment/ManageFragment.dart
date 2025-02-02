import 'package:aicab/screen/CarDetailsOverlay.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '/component/CarRowWidget.dart';
import '/screen/DetailScreen.dart';
import '/screen/CarDetailsOverlay.dart';
import '/utils/DataExamples.dart';
import '/utils/Widgets.dart';

import '/model/CarModel.dart';





class ManageFragment extends StatefulWidget {

  const ManageFragment({super.key});

  @override
  State<ManageFragment> createState() => _ManageFragmentState();
}


class _ManageFragmentState extends State<ManageFragment> {
  final List<CarModel> list = getAvailableCars();



  @override
  void initState() {
    super.initState();
  }




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
                  onTap: () => _showCarDetailsDialog(list[index]),
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

  void _showCarDetailsDialog(CarModel car) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), // Rounded corners
          child: CarDetailsOverlay(car: car, onConfirm: (updatedCar) {
            setState(() {
              car.inUse = updatedCar.inUse; // Update car status in the list
            });
            Navigator.pop(context); // Close overlay
          }),
        );
      },
    );
  }

}
