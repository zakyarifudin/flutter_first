import 'package:flutter/material.dart';

Widget summaryCash() {
  //CONTAINER KEDUA INI BERWARNA PUTIH, KITA SET POSITIONEDNYA DENGAN MENENTUKAN VALUE DARI TOP DAN LEFT AGAR BERADA DITENGAH, DISESUAIKAN SAJA
  return Positioned(
    top: 130,
    left: 20,
    //CONTAINER KEDUA INI KITA BUAT LEBIH KECIL DENGAN MENENTUKAN WIDTH DAN HEIGHNYA TERBATAS
    child: Container(
      width: 370,
      height: 115,
      //SAMA HALNYA DENGAN CONTAINER SEBELUMNYA, WARNANYA DI-SET DAN BORDERRADIUSNYA KALI INI BERBEDA KITA SET KE-4 SISINYA AGAR MELENGKUNG
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      //CHILD DARI CONTAINER INI DI-SET PADDINGNYA AGAR TERDAPAT JARAK DARI ATAS
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        //KARENA ADA DUA BAGIAN YANG BERBARIS DARI KIRI KE KANAN MAKA KITA GUNAKAN ROW()
        child: Row(
          //MAIN ALIGMENTNYA DI-SET SPACEAROUND AGAR KEDUA OBJEKNYA ADA JARAK YANG SESUAI
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //MASING-MASING OBJECT MENGGUNAKAN COLUMN LAGI ADA DUA BUAH TEKS YANG INGIN DITAMPILKAN SECARA VERTICAL
            Column(
              children: <Widget>[
                Text("Pemasukan"),
                Divider(),
                Text(
                  "Rp 2.500.000",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.lightGreen),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text("Pengeluaran"),
                Divider(),
                Text(
                  "Rp 260.000",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.redAccent),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}