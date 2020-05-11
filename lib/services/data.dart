import 'package:newzity/models/category_model.dart';

List<Category> getCategories(){

  List<Category> myCategories = List<Category>();
  Category categoryModel;

  //1
  categoryModel = new Category();
  categoryModel.categoryName = "Business";
  categoryModel.imageAssetUrl = "assets/images/Business.jpg";
  myCategories.add(categoryModel);

  //2
  categoryModel = new Category();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageAssetUrl = "assets/images/Entertainment.jpg";
  myCategories.add(categoryModel);

  //3
  categoryModel = new Category();
  categoryModel.categoryName = "General";
  categoryModel.imageAssetUrl = "assets/images/General.jpg";
  myCategories.add(categoryModel);

  //4
  categoryModel = new Category();
  categoryModel.categoryName = "Health";
  categoryModel.imageAssetUrl = "assets/images/Health.jpg";
  myCategories.add(categoryModel);

  //5
  categoryModel = new Category();
  categoryModel.categoryName = "Science";
  categoryModel.imageAssetUrl = "assets/images/Science.jpg";
  myCategories.add(categoryModel);

  //6
  categoryModel = new Category();
  categoryModel.categoryName = "Sports";
  categoryModel.imageAssetUrl = "assets/images/Sports.jpg";
  myCategories.add(categoryModel);

  //7
  categoryModel = new Category();
  categoryModel.categoryName = "Technology";
  categoryModel.imageAssetUrl = "assets/images/Technology.jpg";
  myCategories.add(categoryModel);

  return myCategories;

}