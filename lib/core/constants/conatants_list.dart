import '../model/category_filter_model.dart';
import '../model/category_model.dart';
import 'app_images.dart';
import 'app_string.dart';

class ConstantsList {
  static List<CategoryModel> categoriesList = [
    CategoryModel(image: AppImages.menImage, name: AppString.menName),
    CategoryModel(image: AppImages.womenImage, name: AppString.womenName),
    CategoryModel(image: AppImages.kidsImage, name: AppString.kidsName),
    CategoryModel(image: AppImages.dealsImage, name: AppString.dealsName),
    CategoryModel(image: AppImages.homeImage, name: AppString.homeName),
  ];

  static List<CategoryFilterModel> categoryFilterModel = [
    CategoryFilterModel(
      name: 'Gray coat and white T-shirt',
      price: '\$20',
      image: AppImages.men3Image,
    ),
    CategoryFilterModel(
      name: 'Classic white hoodie',
      price: '\$30',
      image: AppImages.men2Image,
    ),
    CategoryFilterModel(
      name: 'Casual black outfit',
      price: '\$40',
      image: AppImages.men3Image,
    ),
    CategoryFilterModel(
      name: 'Deep gray essential regular',
      price: '\$20',
      image: AppImages.men4Image,
    ),
    CategoryFilterModel(
      name: 'Top man black with trousers',
      price: '\$70',
      image: AppImages.men3Image,
    ),
    CategoryFilterModel(
      name: 'Minimal black style',
      price: '\$100',
      image: AppImages.men2Image,
    ),
  ];
}