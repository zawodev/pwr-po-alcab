import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '/main.dart';
import '/screen/DashBoardScreen.dart';
import '/utils/Widgets.dart';
import '/utils/DataExamples.dart';
import '/model/UserModel.dart';

class RegisterFragment extends StatefulWidget {
  const RegisterFragment({super.key});

  @override
  State<RegisterFragment> createState() => _RegisterFragmentState();
}

class _RegisterFragmentState extends State<RegisterFragment> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool acceptTerms = false;
  List<UserModel> mockEmailDatabase = getUsers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Rejestracja użytkownika", style: boldTextStyle()),
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
              _buildTextField("Imię", firstNameController, false, Icons.person),
              const SizedBox(height: 16),
              _buildTextField("Nazwisko", lastNameController, false, Icons.person_outline),
              const SizedBox(height: 16),
              _buildTextField("Adres email", emailController, false, Icons.email),
              const SizedBox(height: 16),
              _buildTextField("Numer telefonu", phoneController, false, Icons.phone,
                  keyboardType: TextInputType.phone),
              const SizedBox(height: 16),
              _buildTextField("Hasło", passwordController, true, Icons.lock),
              const SizedBox(height: 16),
              CheckboxListTile(
                title: const Text("Akceptuję regulamin"),
                value: acceptTerms,
                onChanged: (bool? value) {
                  setState(() {
                    acceptTerms = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _registerUser,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.arrow_forward),
                    SizedBox(width: 8),
                    Text("Rejestruj"),
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

  void _registerUser() {
    if (!_formKey.currentState!.validate()) return;

    String email = emailController.text;
    bool emailExists = mockEmailDatabase.any((user) => user.email == email);

    if (emailExists) {
      _showErrorDialog("Adres email już istnieje w bazie danych.");
      return;
    }

    if (!acceptTerms) {
      _showErrorDialog("Musisz zaakceptować regulamin.");
      return;
    }

    UserModel newUser = UserModel(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      phoneNumber: phoneController.text,
      password: passwordController.text,
    );

    mockEmailDatabase.add(newUser);

    _showSuccessDialog();
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

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Sukces"),
        content: const Text("Konto zostało pomyślnie utworzone!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _resetTextFields();
            },
            child: const Text("Ok"),
          ),
        ],
      ),
    );
  }

  void _resetTextFields() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    setState(() {
      acceptTerms = false;
    });
  }

}
