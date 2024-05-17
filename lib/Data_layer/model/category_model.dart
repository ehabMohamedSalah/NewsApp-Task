import 'dart:ui';

class CategoryModel{
  String id;
  String title;
  String imagePath;
  Color backgroundColor;
  CategoryModel({required this.title,required this.id , required this.backgroundColor,required this.imagePath});

  static List<CategoryModel> AllCategory()=>[
    CategoryModel(title: "ALL", id: "ALL", backgroundColor: Color(0xffC91C22), imagePath:"asset/images/sports.png"),
    CategoryModel(title:"Business", id: "Business", backgroundColor: Color(0xff003E90), imagePath: "asset/images/Politics.png"),
    CategoryModel(title: "Health", id: "Health", backgroundColor: Color(0xffED1E79), imagePath: "asset/images/health.png"),
    CategoryModel(title: "Science", id: "Science", backgroundColor: Color(0xffCF7E48), imagePath: "asset/images/bussines.png"),
    CategoryModel(title: "Technology", id: "Technology", backgroundColor: Color(0xff4882CF), imagePath: "asset/images/environment.png"),
    CategoryModel(title: "Science", id: "Science", backgroundColor: Color(0xffF2D352), imagePath: "asset/images/science.png"),

  ];
}