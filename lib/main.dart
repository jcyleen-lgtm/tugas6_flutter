import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const ProfileFormPage(),
    );
  }
}

class ProfileFormPage extends StatefulWidget {
  const ProfileFormPage({super.key});

  @override
  State<ProfileFormPage> createState() => _ProfileFormPageState();
}

class _ProfileFormPageState extends State<ProfileFormPage> {
  final TextEditingController _nameController = TextEditingController();
  String? gender;
  Map<String, bool> hobbies = {
    "Olahraga": false,
    "Musik": false,
    "Membaca": false,
    "Bermain Game": false,
  };
  bool agreed = false;

  bool get isFormValid =>
      _nameController.text.isNotEmpty && gender != null && agreed;

  void _showProfileData() {
    final selectedHobbies =
    hobbies.entries.where((e) => e.value).map((e) => e.key).join(", ");

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Data Profil Anda"),
        content: Text(
          "Nama: ${_nameController.text}\n"
              "Jenis Kelamin: $gender\n"
              "Hobi: ${selectedHobbies.isEmpty ? '-' : selectedHobbies}\n"
              "Menyetujui Syarat: ${agreed ? "Ya" : "Tidak"}",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Tutup"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Profil Sederhana"),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => debugPrint("Info clicked"),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Nama Lengkap"),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 16),

            // RadioButton Gender
            const Text("Jenis Kelamin:"),
            RadioListTile(
              title: const Text("Laki-laki"),
              value: "Laki-laki",
              groupValue: gender,
              onChanged: (value) => setState(() => gender = value),
            ),
            RadioListTile(
              title: const Text("Perempuan"),
              value: "Perempuan",
              groupValue: gender,
              onChanged: (value) => setState(() => gender = value),
            ),

            const SizedBox(height: 16),
            const Text("Hobi:"),
            ...hobbies.keys.map((hobi) {
              return CheckboxListTile(
                title: Text(hobi),
                value: hobbies[hobi],
                onChanged: (val) => setState(() {
                  hobbies[hobi] = val!;
                }),
              );
            }),

            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text("Saya menyetujui Syarat dan Ketentuan"),
              value: agreed,
              onChanged: (val) => setState(() => agreed = val),
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isFormValid ? _showProfileData : null,
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
