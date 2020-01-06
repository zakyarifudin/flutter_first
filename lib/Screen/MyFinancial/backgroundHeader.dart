import 'package:flutter/material.dart';

Widget backgroundHeader() {
  //KITA BUAT CONTAINER DENGAN TINGGI SEBESAR 300, DAN LEBAR SEJAUH YANG BISA DIJANGKAU
  //BOXDECORATIONNYA KITA SET WARNANYA PINKACCENT DAN PADA BAGIAN BAWAH KIRI-KANAN DIBUAT LENGKUNGAN
  return Container(
    height: 250,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
    ),
    //ADAPUN CHILD DARI CONTAINER DIATAS KITA ATUR POSISINYA MENGGUNAKAN PADDING
    child: Padding(
      //PADDINGNYA DI-SET HANYA UNTUK TOP DAN LEFT
      padding: const EdgeInsets.only(top: 60, left: 20),
      //KARENA KITA AKAN MENAMPILKAN LEBIH DARI 1 OBJEK YANG BERUSUSUN KEBAWAH
      //MAKA KITA GUNAKAN COLUMN
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //BAGIAN INI NORMAL, HANYA MENAMPILKAN TEXT DENGAN STYLE MASING-MASING
          Text(
            "Zaky Arifudin",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "zakyarifudin9@gmail.com",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}