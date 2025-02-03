import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '/main.dart';
import '/screen/DashBoardScreen.dart';
import '/utils/Widgets.dart';
import '/utils/DataExamples.dart';
import '/model/UserModel.dart';
import '/model/ReportModel.dart';

class SupportFragment extends StatefulWidget {
  const SupportFragment({super.key});

  @override
  State<SupportFragment> createState() => _SupportFragmentState();
}

class _SupportFragmentState extends State<SupportFragment> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController problemController = TextEditingController();

  String? _selectedCategory;
  String? _selectedOrder;
  
  final List<String> categories = [
    "Problem z płatnością",
    "Nie mam przejazdu",
    "Zły wybór przejazdu",
    "Problemy techniczne",
    "Inne"
  ];

  final List<String> pastOrders = [
    "Przejazd #12345",
    "Przejazd #67890",
    "Przejazd #11223",
    "Przejazd #44556",
    "Przejazd #78901"
  ];

  List<UserModel> mockEmailDatabase = getUsers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Wsparcie użytkownika", style: boldTextStyle()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 32),
              _buildTextField("Adres email", emailController, false, Icons.email),
              const SizedBox(height: 16),
              //Text("Category", style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                labelText: "Kategoria",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.list_alt_outlined, color: Colors.grey.withOpacity(0.7)),
                ),
                value: _selectedCategory,
                items: categories.map((category) {
                  return DropdownMenuItem(value: category, child: Text(category));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                validator: (value) => value == null ? "Proszę wybrać kategorię" : null,
              ),
              const SizedBox(height: 16),
              _buildTextField("Opis problemu", problemController, false, Icons.lock),
              
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                labelText: "Przejazd",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.car_crash, color: Colors.grey.withOpacity(0.7)),
                ),
                value: _selectedOrder,
                items: pastOrders.map((order) {
                  return DropdownMenuItem(value: order, child: Text(order));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedOrder = value;
                  });
                },
                validator: (value) => value == null ? "Proszę wybrać przejazd" : null,
              ),

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _SupportUser,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.arrow_forward),
                    SizedBox(width: 8),
                    Text("Wyślij"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, bool obscureText, IconData icon,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        suffixIcon: Icon(icon, color: Colors.grey.withOpacity(0.7)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Proszę wprowadzić $label";
        }
        if (label == "Numer telefonu" && value.length != 9) {
          return "Niepoprawny numer telefonu (wymagane 9 cyfr)";
        }
        return null;
      },
    );
  }

  void _SupportUser() {
    if (!_formKey.currentState!.validate()) return;

    String email = emailController.text;
    bool emailExists = mockEmailDatabase.any((user) => user.email == email);

    if (!emailExists) {
      _showErrorDialog("Adres email nie istnieje w bazie danych.");
      return;
    }

    if (_selectedCategory==null) {
      _showErrorDialog("Musisz wybrać kategorię");
      return;
    }

    _submitReport();


  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Błąd"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }


  void _resetTextFields() {
    emailController.clear();
    problemController.clear();
    setState(() {
      _selectedCategory = null;
    });
  }


  void _submitReport() {
    if (_formKey.currentState!.validate()) {
      // Navigate to the Report Sent screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReportSentScreen()),
      );
    }
  }

}


class ReportSentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Zgłoszenie wysłane")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 80),
            SizedBox(height: 16),
            Text("Zgłoszenie przyjęte!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Padding(padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text("Zgłoszenie zostało przyjęte. Dziękujemy za kontakt. Odezwiemy się do Ciebie w przeciągu 2 dni na skrzynkę pocztową. Dziękujemy za wyrozumiałość!", textAlign: TextAlign.center),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the report form screen
              },
              child: Text("Wróc do ekranu głównego"),
            ),
          ],
        ),
      ),
    );
  }
}