import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '/main.dart';
import '/screen/DashBoardScreen.dart';
import '/utils/Widgets.dart';


class RegisterFragment extends StatefulWidget {
  const RegisterFragment({super.key});

  @override
  State<RegisterFragment> createState() => _RegisterFragmentState();
}


class _RegisterFragmentState extends State<RegisterFragment> {

  @override
  void initState() {
    super.initState();
    init();
  }


  Future<void> init() async {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Rejestracja uzytkownika", style: boldTextStyle()),
        

      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 32),
            Text(
              "Register",
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: boldTextStyle(size: 18),
            ),
            const SizedBox(height: 8),
            Text(
              "Create your new account",
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: primaryTextStyle(),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: TextEditingController(),
              obscureText: false,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 14,
              ),
              decoration: RegisterInputDecoration(
                context: context,
                name: 'Imie',
                icon: Icon(Icons.email, color: Colors.grey.withOpacity(0.4), size: 24),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: TextEditingController(),
              obscureText: false,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 14,
              ),
              decoration: RegisterInputDecoration(
                context: context,
                name: 'Nazwisko',
                icon: Icon(Icons.email, color: Colors.grey.withOpacity(0.4), size: 24),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: TextEditingController(),
              obscureText: false,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: const TextStyle(fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: 14),
              decoration: RegisterInputDecoration(
                context: context,
                name: 'Numer telefonu',
                icon: Icon(Icons.call, color: Colors.grey.withOpacity(0.4), size: 24),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: TextEditingController(),
              obscureText: false,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: const TextStyle(fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: 14),
              decoration: RegisterInputDecoration(
                context: context,
                name: 'Email',
                icon: Icon(Icons.email, color: Colors.grey.withOpacity(0.4), size: 24),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: TextEditingController(),
              obscureText: false,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 14,
              ),
              decoration: RegisterInputDecoration(
                context: context,
                name: 'Hasło',
                icon: Icon(Icons.lock, color: Colors.grey.withOpacity(0.4), size: 24),
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  dialog();
                  //finish(context);
                  //const DashBoardScreen().launch(context);
                },
                child: Container(
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(0),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xff010101),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0x4df2e4e4), width: 1),
                  ),
                  child: const Icon(Icons.arrow_forward, color: Color(0xfffcfdff), size: 24),
                ),
              ),
            ),

            //SEKCJA DO LOGOWANIA

            /*const SizedBox(height: 16),
            Text(
              "Already have an account?",
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: primaryTextStyle(),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                finish(context);
              },
              child: Text(
                "Sign in",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: boldTextStyle(color: Colors.red),
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  Future<void> dialog() async {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: SizedBox(
            height: 300,
            width: 300,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  width: context.width(),
                  color: context.cardColor,
                  child:  Text("Wprowadzono bledne dane",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: boldTextStyle(size: 18),
                  ),
                ),
                Container(
                  height: 80,
                  padding: const EdgeInsets.all(16),
                  width: context.width(),
                  color: context.cardColor,
                  child: ChooseCarAppButton(
                    textColor: Colors.white,
                    title: 'Popraw',
                    context: context,
                    onPressed: () {
                      finish(context);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }


}
