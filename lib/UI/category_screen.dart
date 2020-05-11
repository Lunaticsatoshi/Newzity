import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newzity/repositories/categorynews_repository.dart';
import 'package:newzity/widgets/category_tile.dart';

class CategoryScreen extends StatefulWidget {
  final String category;
  CategoryScreen({Key key, this.category}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with AutomaticKeepAliveClientMixin {
  bool _loading = true;
  var newslist;
  bool keepAlive = false;

  @override
  void initState() {
    super.initState();
    getNews();
  _doAsyncStuff();
  }

  void getNews() async {
    CategoryNewsRepository _categoryNewsRepository =
         CategoryNewsRepository();
    newslist = await _categoryNewsRepository.getCategoryNews(
        category: widget.category);
    print(newslist);
    setState(() {
      _loading = false;
    });
  }

  Future _doAsyncStuff() async {
    keepAlive = true;
    updateKeepAlive();
    //Keeping Alive

    await Future.delayed(Duration(hours: 1));
    
    keepAlive = false;
    updateKeepAlive();
    //Can be disposed whenever required
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category,
          style: TextStyle(
              fontFamily: 'Billabong', fontSize: 35.0, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFEDF0F6),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Color(0xFFEDF0F6),
      body: _loading
          ? Center(
              child: SpinKitFoldingCube(
                color: Colors.red,
                size: 50.0,
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Container(
                  margin: EdgeInsets.only(top: 16.0),
                  child: ListView.builder(
                    itemCount: newslist.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return CategoryTile(
                        article: newslist[index],
                      );
                    },
                  ),
                ),
              ),
            ),
    );
  }

  @override
  bool get wantKeepAlive =>  keepAlive;
}
