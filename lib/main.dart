import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Doctor {
  final String name;
  final String specialization;
  final double rating;
  final String image;

  Doctor({
    required this.name,
    required this.specialization,
    required this.rating,
    required this.image,
  });
}

class MyApp extends StatelessWidget {

  final List<Doctor> doctors = [
    Doctor(name: 'Dr. John Doe', specialization: 'Cardiologist', rating: 4.5, image: 'doctor1.jpg'),
    Doctor(name: 'Dr. Jane Smith', specialization: 'Dermatologist', rating: 4.8, image: 'doctor2.jpg'),
    Doctor(name: 'Dr. Michael Brown', specialization: 'Pediatrician', rating: 4.2, image: 'doctor3.jpg'),
    // Add more doctors as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal, 
          leading: IconButton(
            icon: Icon(Icons.arrow_circle_left, color: Colors.white), 
            onPressed: () {
              
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.white), 
              onPressed: () {
               
              },
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.white), 
              onPressed: () {
                
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 20.0),
              child: Text(
                'Dokter Kami',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 16.0),
                          Icon(Icons.search, color: Colors.white),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Cari dokter...',
                                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(width: 16.0),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: DropdownButton<String>(
                          
                          dropdownColor: Colors.teal,
                          items: <String>['Spesialis 1', 'Spesialis 2', 'Spesialis 3', 'Spesialis 4']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.white.withOpacity(1)),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            // Fungsi saat pilihan dropdown diganti
                            // Tambahkan fungsi jika diperlukan
                          },
                          hint: Text(
                            'Spesialis',
                            style: TextStyle(color: Colors.white.withOpacity(1)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: DropdownButton<String>(
                          dropdownColor: Colors.teal,
                          items: <String>['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.white.withOpacity(1)),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            // Fungsi saat pilihan dropdown diganti
                            // Tambahkan fungsi jika diperlukan
                          },
                          hint: Text(
                            'Hari',
                            style: TextStyle(color: Colors.white.withOpacity(0.5)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                           leading: CircleAvatar(
                            radius: 75,
                            backgroundColor: Color(0XFFEEEEFF),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                doctors[index].image
                              ),
                              backgroundColor: Color(0XFFEEEEFF),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctors[index].name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                doctors[index].specialization,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  for (int i = 0; i < 5; i++)
                                    Icon(
                                      Icons.star,
                                      color: i < doctors[index].rating.floor() ? Colors.yellow : Colors.grey,
                                    ),
                                  SizedBox(width: 4),
                                  Text(
                                    doctors[index].rating.toString(),
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                     
                      ElevatedButton(
                        onPressed: () {
                          // Tambahkan logika saat tombol ditekan
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal, // Warna tombol teal
                        ),
                        child: Text(
                          'Profil Dokter',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                       Divider( // Garis horizontal untuk memisahkan antar dokter
                        color: Colors.grey,
                        thickness: 1,
                        height: 1,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}