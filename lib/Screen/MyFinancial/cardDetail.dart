import 'package:flutter/material.dart';

Widget cardDetail(title, description, price, type) {
  //BUAT CARD
  return Container(
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      //DENGAN MARGIN YANG DISESUAIKAN
      margin: EdgeInsets.only(top: 15, left: 15, right: 15),
      //DENGAN KETEBALAN AGAR MEMBENTUK SHADOW SENILAI 8
      elevation: 8,
      //CHILD DARI CARD MENGGUNAKAN LISTTILE AGAR LEBIH MUDAH MENGATUR AREANYA
      //KARENA SECARA DEFAULT LISTTILE TELAH TERBAGI MENJADI 3 BAGIAN
      //POSISI KIRI (LEADING), TENGAH (TITLE), BAWAH TENGAH (SUBTITLE) DAN KANAN(TRAILING)
      //SEHINGGA KITA HANYA TINGGAL MEMASUKKAN TEKS YANG SESUAI
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
          child: Icon(
            type == 'out' ? Icons.remove : Icons.add,
            color: type == 'out' ? Colors.redAccent : Colors.lightGreen,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: Text(
          "Rp "+price,
          style: TextStyle(color: type == 'out' ? Colors.redAccent:Colors.lightGreen),
        ),
      ),
    ),
  );
}