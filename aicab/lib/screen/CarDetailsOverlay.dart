import 'package:aicab/model/CarModel.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';



class CarDetailsOverlay extends StatefulWidget {
  final CarModel car;
  final Function(CarModel) onConfirm;

  CarDetailsOverlay({required this.car, required this.onConfirm});

  @override
  _CarDetailsOverlayState createState() => _CarDetailsOverlayState();
}

class _CarDetailsOverlayState extends State<CarDetailsOverlay> {
  late bool isInUse;

  @override
  void initState() {
    super.initState();
    isInUse = widget.car.inUse;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ID: ${widget.car.id}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Text("Status: ${widget.car.status}", style: TextStyle(fontSize: 16)),
          SizedBox(height: 16),
          Text("Ostatni przegląd: ${widget.car.service}", style: TextStyle(fontSize: 16)),
          SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("W użyciu:", style: TextStyle(fontSize: 16)),
              Switch(
                value: isInUse,
                onChanged: (value) {
                  setState(() {
                    isInUse = value;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                child: Text("Anuluj"),
              ),
              ElevatedButton(
                onPressed: () {
                  widget.onConfirm(CarModel(
                    id: widget.car.id,
                    status: widget.car.status,
                    service: widget.car.service,
                    inUse: isInUse,
                  ));
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Text("OK"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}