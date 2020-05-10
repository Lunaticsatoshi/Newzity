import 'package:newzity/models/category_model.dart';

List<Category> getCategories(){

  List<Category> myCategories = List<Category>();
  Category categoryModel;

  //1
  categoryModel = new Category();
  categoryModel.categoryName = "Business";
  categoryModel.imageAssetUrl = "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60";
  myCategories.add(categoryModel);

  //2
  categoryModel = new Category();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageAssetUrl = "https://images.unsplash.com/photo-1561114601-81d07393ee3d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60";
  myCategories.add(categoryModel);

  //3
  categoryModel = new Category();
  categoryModel.categoryName = "General";
  categoryModel.imageAssetUrl = "https://images.unsplash.com/photo-1489533119213-66a5cd877091?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60";
  myCategories.add(categoryModel);

  //4
  categoryModel = new Category();
  categoryModel.categoryName = "Health";
  categoryModel.imageAssetUrl = "https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60";
  myCategories.add(categoryModel);

  //5
  categoryModel = new Category();
  categoryModel.categoryName = "Science";
  categoryModel.imageAssetUrl = "https://images.unsplash.com/photo-1507413245164-6160d8298b31?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60";
  myCategories.add(categoryModel);

  //6
  categoryModel = new Category();
  categoryModel.categoryName = "Sports";
  categoryModel.imageAssetUrl = "https://images.unsplash.com/photo-1558365849-6ebd8b0454b2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60";
  myCategories.add(categoryModel);

  //7
  categoryModel = new Category();
  categoryModel.categoryName = "Technology";
  categoryModel.imageAssetUrl = "https://images.unsplash.com/photo-1461749280684-dccba630e2f6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60";
  myCategories.add(categoryModel);

  return myCategories;

}