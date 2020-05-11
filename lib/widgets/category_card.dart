import 'package:flutter/material.dart';
import 'package:newzity/UI/category_screen.dart';

class CategoryCard extends StatelessWidget {
  final String imageAssetUrl, categoryName;
  const CategoryCard({Key key, this.imageAssetUrl, this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CategoryScreen(
                category: categoryName.toLowerCase(),
              ))),
    child: Container(
      margin: EdgeInsets.only(right: 14.0),
      child: Column(
        children: <Widget>[
          Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                color: Colors.black45,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              )
            ]),
            child: CircleAvatar(
              child: ClipOval(
                child: Image(image: AssetImage(imageAssetUrl), height: 60.0, width: 60.0, fit: BoxFit.cover,),
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            categoryName,
            style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
      );
  }
}
