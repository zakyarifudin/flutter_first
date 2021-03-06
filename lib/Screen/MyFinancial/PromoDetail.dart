import 'package:flutter/material.dart';
import 'package:flutter_first/Screen/ImageList/index.dart';
import 'package:flutter_first/language/App_localizations.dart';

class PromoDetail extends StatefulWidget {
  PromoDetail({Key key, this.image}) : super(key: key);

  final ImageModel image;

  @override
  _PromoDetail createState() => _PromoDetail();
}


class _PromoDetail extends State<PromoDetail> with SingleTickerProviderStateMixin{
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                //Sliver Overlap ini berguna pas children scroll sampai habis baru yg headernya ikut scroll
                SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  child: SliverSafeArea(
                    sliver: SliverAppBar(
                      leading: IconButton(
                        icon : Icon(Icons.arrow_back_ios, size: 20), 
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      expandedHeight: 200.0,
                      floating: true,
                      pinned: true,
                      snap: true,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        background: Hero(
                          tag: widget.image.id, 
                          child: Image(
                            image: NetworkImage(widget.image.url),
                            fit: BoxFit.fill,
                          )
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    TabBar(          
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                      controller: tabController,
                      tabs: [
                        Tab(text: AppLocalizations.of(context).translate("Info")),
                        Tab(text: AppLocalizations.of(context).translate("How To")),
                      ],
                    ),
                  ),
                  pinned: true,
                  floating: false,
                ),
                
              ];
            },
            body: TabBarView(
              controller: tabController,
              children: <Widget>[
                Container(
                  child: ListView(
                    children: <Widget>[
                      Container(color: Colors.red, height: 300, margin: EdgeInsets.all(10)),
                      Container(color: Colors.green, height: 300, margin: EdgeInsets.all(10)),
                      Container(color: Colors.black, height: 300, margin: EdgeInsets.all(10)),
                      Container(color: Colors.blue, height: 300, margin: EdgeInsets.all(10)),
                      Container(color: Colors.yellow, height: 300, margin: EdgeInsets.all(10)),
                      Container(color: Colors.purple, height: 300, margin: EdgeInsets.all(10))
                    ],
                  ),
                ),
                Container(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(20),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black
                            ),
                            children: <TextSpan>[
                              TextSpan(text: 'Tab Cara ', style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: 'merupakan ', style: TextStyle(color: Colors.blue)),
                              TextSpan(text: 'Tab ', style: TextStyle(color: Colors.red)),
                              TextSpan(text: 'untuk ', style: TextStyle(color: Colors.green)),
                              TextSpan(
                                text: 'Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an, saat seorang tukang cetak yang tidak dikenal mengambil sebuah kumpulan teks dan mengacaknya untuk menjadi sebuah buku contoh huruf. Ia tidak hanya bertahan selama 5 abad, tapi juga telah beralih ke penataan huruf elektronik, tanpa ada perubahan apapun. Ia mulai dipopulerkan pada tahun 1960 dengan diluncurkannya lembaran-lembaran Letraset yang menggunakan kalimat-kalimat dari Lorem Ipsum, dan seiring munculnya perangkat lunak Desktop Publishing seperti Aldus PageMaker juga memiliki versi Lorem Ipsum. Sudah merupakan fakta bahwa seorang pembaca akan terpengaruh oleh isi tulisan dari sebuah halaman saat ia melihat tata letaknya. Maksud penggunaan Lorem Ipsum adalah karena ia kurang lebih memiliki penyebaran huruf yang normal, ketimbang menggunakan kalimat seperti "Bagian isi disini, bagian isi disini", sehingga ia seolah menjadi naskah Inggris yang bisa dibaca. Banyak paket Desktop Publishing dan editor situs web yang kini menggunakan Lorem Ipsum sebagai contoh teks. Karenanya pencarian terhadap kalimat "Lorem Ipsum" akan berujung pada banyak situs web yang masih dalam tahap pengembangan. Berbagai versi juga telah berubah dari tahun ke tahun, kadang karena tidak sengaja, kadang karena disengaja (misalnya karena dimasukkan unsur humor atau semacamnya)',
                                style: TextStyle(fontSize: 20)
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
      
    );
  }
}

// Buat 
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
      return new Container(
        color: Colors.white,
        child: _tabBar,
      );
    }

}