import 'package:flutter/material.dart';
import 'package:whats_app_series/pages/verify_page.dart';
import 'package:whats_app_series/widgets/ui_helper.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? selectedCountry;
  List<String> country = [
    "America",
    "Africa",
    "Italy",
    "Pakistan",
    "India",
    "Japan",
    "USA",
    "UK",
    "Canada",
  ];

  @override
  void initState() {
    super.initState();
    selectedCountry = country.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: UiHelper.customText(
            text: 'Enter your phone number',
            height: 16,
            color: Color(0xff00A884),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          _buildInfoText(),
          SizedBox(height: 50),
          _buildCountryDropdown(),
          SizedBox(height: 50),
          _enterCountryNumber(),
        ],
      ),
      floatingActionButton: UiHelper.customButton(
        callback: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VerifyPage()),
          );
        },
        buttonname: 'Next',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildInfoText() {
    return Column(
      children: [
        Center(
          child: RichText(
            text: TextSpan(
              text: 'WhatsApp will need to verify your phone',
              style: TextStyle(color: Color(0xff5E5E5E), fontSize: 14),
            ),
          ),
        ),
        SizedBox(height: 4),
        Center(
          child: RichText(
            text: TextSpan(
              text: 'number. Carrier charges may apply',
              style: TextStyle(color: Color(0xff5E5E5E), fontSize: 14),
            ),
          ),
        ),
        SizedBox(height: 4),
        Center(
          child: RichText(
            text: TextSpan(
              text: "What’s my number?",
              style: TextStyle(color: Color(0xff00A884), fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCountryDropdown() {
    return Container(
      width: 200,
      child: DropdownButtonFormField(
        items:
            country.map((String countries) {
              return DropdownMenuItem(
                child: Text(countries.toString()),
                value: countries,
              );
            }).toList(),
        onChanged: (value) {
          setState(() {
            selectedCountry = value as String?;
          });
        },
        value: selectedCountry,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff00A884)),
          ),
        ),
      ),
    );
  }

  Widget _enterCountryNumber() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 45,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '+92',
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff00A884)),
              ),
            ),
          ),
        ),
        // For Entering Number
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: SizedBox(
            width: 200,
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff00A884)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
