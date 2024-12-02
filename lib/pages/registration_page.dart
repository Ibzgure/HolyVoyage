import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  final int numberOfPeople;
  final int totalPrice;
  final Function onComplete;

  const RegistrationPage({
    super.key,
    required this.numberOfPeople,
    required this.totalPrice,
    required this.onComplete,
    required String price,
    required String packageName, // Assuming you may want to use 'price' later
  });

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  int currentPersonIndex = 0; // Track the current person to be registered
  late List<TextEditingController> nameControllers;
  late List<TextEditingController> phoneControllers;
  late List<TextEditingController> emailControllers;
  late List<TextEditingController> addressControllers;
  late List<TextEditingController> passportControllers;
  late List<TextEditingController> idControllers;
  late List<String> names;
  late List<String> phoneNumbers;
  late List<String> emails;
  late List<String> addresses;
  late List<String> passports;
  late List<String> ids;
  bool isPassportSelected = true; // Track if the user selects Passport or ID

  @override
  void initState() {
    super.initState();
    // Initialize controllers and data lists for the number of people to register
    nameControllers =
        List.generate(widget.numberOfPeople, (_) => TextEditingController());
    phoneControllers =
        List.generate(widget.numberOfPeople, (_) => TextEditingController());
    emailControllers =
        List.generate(widget.numberOfPeople, (_) => TextEditingController());
    addressControllers =
        List.generate(widget.numberOfPeople, (_) => TextEditingController());
    passportControllers =
        List.generate(widget.numberOfPeople, (_) => TextEditingController());
    idControllers =
        List.generate(widget.numberOfPeople, (_) => TextEditingController());

    names = List.generate(widget.numberOfPeople, (_) => '');
    phoneNumbers = List.generate(widget.numberOfPeople, (_) => '');
    emails = List.generate(widget.numberOfPeople, (_) => '');
    addresses = List.generate(widget.numberOfPeople, (_) => '');
    passports = List.generate(widget.numberOfPeople, (_) => '');
    ids = List.generate(widget.numberOfPeople, (_) => '');
  }

  void nextPerson() {
    if (currentPersonIndex < widget.numberOfPeople - 1) {
      setState(() {
        currentPersonIndex++;
      });
    } else {
      widget.onComplete(); // Proceed to billing if all people are registered
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration for Umrah Package'),
        backgroundColor: const Color.fromARGB(255, 231, 76, 255),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/basic-umrah-package'); // Navigate back to LandingPage
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Register Person ${currentPersonIndex + 1} of ${widget.numberOfPeople}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // Form for current person
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: nameControllers[currentPersonIndex],
                  decoration: const InputDecoration(
                    labelText: 'Enter Full Name',
                    contentPadding: EdgeInsets.all(16), // Add padding inside the input field
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    names[currentPersonIndex] = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Enter Phone Number',
                    contentPadding: EdgeInsets.all(16),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    phoneNumbers[currentPersonIndex] = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Enter Email Address',
                    contentPadding: EdgeInsets.all(16),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    emails[currentPersonIndex] = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Enter Address',
                    contentPadding: EdgeInsets.all(16),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    addresses[currentPersonIndex] = value;
                  },
                ),
              ),
              const SizedBox(height: 8),
              // Toggle between Passport or ID number
              Row(
                children: [
                  Radio<bool>(
                    value: true,
                    groupValue: isPassportSelected,
                    onChanged: (value) {
                      setState(() {
                        isPassportSelected = value!;
                      });
                    },
                  ),
                  const Text('Passport'),
                  const SizedBox(width: 16),
                  Radio<bool>(
                    value: false,
                    groupValue: isPassportSelected,
                    onChanged: (value) {
                      setState(() {
                        isPassportSelected = value!;
                      });
                    },
                  ),
                  const Text('ID Number'),
                ],
              ),
              const SizedBox(height: 8),
              // Show either passport or ID input based on the selected option
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: isPassportSelected
                      ? passportControllers[currentPersonIndex]
                      : idControllers[currentPersonIndex],
                  decoration: InputDecoration(
                    labelText: isPassportSelected
                        ? 'Enter Passport Number'
                        : 'Enter ID Number',
                    contentPadding: const EdgeInsets.all(16),
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (isPassportSelected) {
                      passports[currentPersonIndex] = value;
                    } else {
                      ids[currentPersonIndex] = value;
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),
              // Floating Action Button for Next/Proceed
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    if (names[currentPersonIndex].isNotEmpty &&
                        phoneNumbers[currentPersonIndex].isNotEmpty &&
                        emails[currentPersonIndex].isNotEmpty &&
                        addresses[currentPersonIndex].isNotEmpty &&
                        (isPassportSelected
                            ? passports[currentPersonIndex].isNotEmpty
                            : ids[currentPersonIndex].isNotEmpty)) {
                      nextPerson(); // Move to the next person or proceed to billing
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'Please complete the registration for this person')),
                      );
                    }
                  },
                  label: currentPersonIndex < widget.numberOfPeople - 1
                      ? const Text('Next')
                      : const Text('Proceed to Billing'),
                  backgroundColor: Colors.teal,
                  elevation: 6.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
