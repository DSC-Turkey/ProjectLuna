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
  int _value = 1;
  DateTime selectedDate;
  bool _languegeController = true;
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   elevation: 5,
          //   title: Text("Proje Oluştur"),
          //   backgroundColor: Color(0xFFF5A046),
          // ),
          body: SingleChildScrollView(
            child: Container(
              height: s.height,
              width: s.width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appBar(s),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
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
                          timePicker(s),
                          //Spacer(),
                          sendProject(),
                          SizedBox(height: s.height * 0.025),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  appBar(Size s) {
    return Container(
      height: s.height * 0.07,
      width: s.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1.0, 0.0),
          end: Alignment(-1.0, 0.0),
          colors: [
            const Color(0xfffabd5e),
            const Color(0xfff7b053),
            const Color(0xfff49d42),
            const Color(0xfff3963d)
          ],
          stops: [0.0, 0.232, 0.687, 1.0],
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 35,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Text(
            "     Proje Oluşturuluyor",
            style: TextStyle(color: Colors.white, fontSize: 25),
          )
        ],
      ),
    );
  }

  sendProject() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            begin: Alignment(1.0, 0.0),
            end: Alignment(-1.0, 0.0),
            colors: [
              const Color(0xfffabd5e),
              const Color(0xfff7b053),
              const Color(0xfff49d42),
              const Color(0xfff3963d)
            ],
            stops: [0.0, 0.232, 0.687, 1.0],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 56.0, vertical: 6),
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

  timePicker(Size s) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            _selectDate(); // Refer step 3
          },
          child: Container(
              height: s.height * 0.045,
              width: s.width * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  begin: Alignment(1.0, 0.0),
                  end: Alignment(-1.0, 0.0),
                  colors: [
                    const Color(0xfffabd5e),
                    const Color(0xfff7b053),
                    const Color(0xfff49d42),
                    const Color(0xfff3963d)
                  ],
                  stops: [0.0, 0.232, 0.687, 1.0],
                ),
              ),
              child: Center(
                child: Text(
                  'Başlangıç Tarihi',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )),
        ),
        // RaisedButton(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(25),
        //   ),
        //   color: Color(0xFFF5A046),
        // ),
        //   Spacer(),
        Container(
          height: s.height * 0.045,
          width: s.width * 0.35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              // gradient: LinearGradient(
              //   begin: Alignment(1.0, 0.0),
              //   end: Alignment(-1.0, 0.0),
              //   colors: [
              //     const Color(0xfffabd5e),
              //     const Color(0xfff7b053),
              //     const Color(0xfff49d42),
              //     const Color(0xfff3963d)
              //   ],
              //   stops: [0.0, 0.232, 0.687, 1.0],
              // ),
              border: Border.all(
                color: Color(0xfff3963d),
              )),
          child: Center(
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
    return Align(
      alignment: Alignment.center,
          child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Container(
          width: s.width * 0.5,
          height: s.height * 0.05,
          color: Color(0xfff2f3f6),
          child: DropdownButtonFormField(
              // itemHeight: 50,
              dropdownColor: Color(0xfff2f3f6),
              value: _value,
              items: [
                DropdownMenuItem(
                    child: Text(
                      "Türkçe",
                    ),
                    value: 1),
                DropdownMenuItem(child: Text("İngilizce"), value: 2),
                DropdownMenuItem(child: Text("Rusça"), value: 3),
                DropdownMenuItem(child: Text("Almanca"), value: 4),
                DropdownMenuItem(child: Text("Arapça"), value: 5),
                DropdownMenuItem(child: Text("İtalyanca"), value: 6),
                DropdownMenuItem(child: Text("Farsça"), value: 7),
              ],
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              }),
        ),
      ),
    );
  }

  alanSelector() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: DropdownButton(
          // itemHeight: 50,
          value: _value,
          items: [
            DropdownMenuItem(child: Text("Türkçe"), value: 1),
            DropdownMenuItem(child: Text("İngilizce"), value: 2),
            DropdownMenuItem(child: Text("Rusça"), value: 3),
            DropdownMenuItem(child: Text("Almanca"), value: 4),
            DropdownMenuItem(child: Text("Arapça"), value: 5),
            DropdownMenuItem(child: Text("İtalyanca"), value: 6),
            DropdownMenuItem(child: Text("Farsça"), value: 7),
          ],
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          }),
    );
  }

  // languegeSelector(Size s) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       Container(
  //         width: s.width / 2 - 40,
  //         child: RadioListTile<bool>(
  //           title: const Text('Türkçe'),
  //           value: true,
  //           activeColor: Colors.orange,
  //           groupValue: _languegeController,
  //           onChanged: (bool value) {
  //             setState(() {
  //               _languegeController = value;
  //             });
  //           },
  //         ),
  //       ),
  //       Container(
  //         width: s.width / 2 - 40,
  //         child: RadioListTile<bool>(
  //           title: const Text('English'),
  //           value: false,
  //           activeColor: Colors.orange,
  //           groupValue: _languegeController,
  //           onChanged: (bool value) {
  //             setState(() {
  //               _languegeController = value;
  //             });
  //           },
  //         ),
  //       ),
  //     ],
  //   );
  // }

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
