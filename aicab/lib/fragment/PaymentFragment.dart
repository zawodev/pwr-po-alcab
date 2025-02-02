import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


class PaymentFragment extends StatefulWidget {
  const PaymentFragment({super.key});

  @override
  _PaymentFragmentState createState() => _PaymentFragmentState();
}

class _PaymentFragmentState extends State<PaymentFragment> {
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Podsumowanie", style: boldTextStyle()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (selectedPaymentMethod == null) ...[
              Text("Cena: 34,56 zł", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Text("Wybierz metodę płatności:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              PaymentOption(label: "PayPal", icon: Icons.paypal, onTap: () => selectPayment("PayPal")),
              SizedBox(height: 16),
              PaymentOption(label: "BLIK", icon: Icons.payment, onTap: () => selectPayment("BLIK")),
              SizedBox(height: 16),
              PaymentOption(label: "Card", icon: Icons.credit_card, onTap: () => selectPayment("Card")),
            ] else ...[
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => setState(() => selectedPaymentMethod = null),
              ),
              Text("Zapłać za pomocą $selectedPaymentMethod", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              getPaymentForm(),
            ],
          ],
        ),
      ),
    );
  }

  void selectPayment(String method) {
    setState(() {
      selectedPaymentMethod = method;
    });
  }

  Widget getPaymentForm() {
    switch (selectedPaymentMethod) {
      case "PayPal":
        return PayPalForm();
      case "BLIK":
        return BlikForm();
      case "Card":
        return CardForm();
      default:
        return Container();
    }
  }
}

class PaymentOption extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  PaymentOption({required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 24),
      label: Text(label, style: TextStyle(fontSize: 16)),
      style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
    );
  }
}

// PayPal Form
class PayPalForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(decoration: InputDecoration(labelText: "PayPal Email")),
        SizedBox(height: 16),
        ElevatedButton(onPressed: () {}, child: Text("Zapłać PayPalem")),
      ],
    );
  }
}

// BLIK Form
class BlikForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(decoration: InputDecoration(labelText: "Wpisz kod BLIK")),
        SizedBox(height: 16),
        ElevatedButton(onPressed: () {}, child: Text("Potwierdź płatność")),
      ],
    );
  }
}

// Card Form
class CardForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(decoration: InputDecoration(labelText: "Numer karty")),
        TextField(decoration: InputDecoration(labelText: "Data ważności")),
        TextField(decoration: InputDecoration(labelText: "CVV")),
        SizedBox(height: 16),
        ElevatedButton(onPressed: () {}, child: Text("Zapłać kartą")),
      ],
    );
  }
}
