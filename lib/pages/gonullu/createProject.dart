import 'package:Luna/widgets/myTextField.dart';
import 'package:flutter/material.dart';

class CreateProject extends StatefulWidget {
  @override
  _CreateProject createState() => _CreateProject();
}

class _CreateProject extends State<CreateProject> {
  final nameController = TextEditingController();
  final subjectController = TextEditingController();
  final alanController = TextEditingController();
  final timeController = TextEditingController();
  final hourController = TextEditingController();
  DateTime selectedDate;
  bool _languegeController = true;
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text("Proje Oluştur"),
        backgroundColor: Color(0xFFF5A046),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: s.height*0.9,
          width: s.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text("Proje Adı Giriniz:"),
                  textField(nameController),
                  text("Proje Dili Seçiniz:"),
                  languegeSelector(s),
                  text("Proje Alanı Giriniz:"),
                  textField(alanController),
                  text("Proje Konusu Seçiniz:"),
                  textField(subjectController),
                  text("Proje Süresi Giriniz:"),
                  textField(timeController),
                  text("Proje Ders Saati Giriniz:"),
                  textField(hourController),
                  text("Proje Başlangıç Tarihi Giriniz:"),
                  timePicker(),
                  Spacer(),
                  sendProject(),
                  SizedBox(height: s.height * 0.025),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  sendProject() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFF5A046), borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 16),
          child: Column(
            children: [
              Text(
                "Projeyi",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              Text(
                "Oluştur",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }

  timePicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RaisedButton(
          onPressed: () => _selectDate(), // Refer step 3
          child: Text(
            'Başlangıç Tarihi',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          color: Color(0xFFF5A046),
        ),
        //   Spacer(),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color(0xFFF5A046),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              selectedDate == null
                  ? "Seçtiğiniz Tarih"
                  : "${selectedDate.day} / ${selectedDate.month} / ${selectedDate.year} ",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _selectDate() async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Refer step 1
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  languegeSelector(Size s) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: s.width / 2 - 40,
          child: RadioListTile<bool>(
            title: const Text('Türkçe'),
            value: true,
            activeColor: Colors.orange,
            groupValue: _languegeController,
            onChanged: (bool value) {
              setState(() {
                _languegeController = value;
              });
            },
          ),
        ),
        Container(
          width: s.width / 2 - 40,
          child: RadioListTile<bool>(
            title: const Text('English'),
            value: false,
            activeColor: Colors.orange,
            groupValue: _languegeController,
            onChanged: (bool value) {
              setState(() {
                _languegeController = value;
              });
            },
          ),
        ),
      ],
    );
  }

  textField(TextEditingController _controller) {
    return MyTextFormField(
      controller: _controller,
    );
  }

  text(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}
