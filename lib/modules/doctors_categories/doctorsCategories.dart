import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medically/models/cateModel.dart';
import 'package:medically/modules/doctors_categories/doctors/doctors.dart';
import 'package:medically/shared/componnet/component.dart';

import '../../shared/cubit/app_cubit.dart';
import '../../shared/cubit/app_states.dart';
import '../../shared/style/themes/dark_theme.dart';
import '../../shared/style/themes/dark_theme.dart';
import '../../shared/style/themes/light_theme.dart';
import '../../shared/style/themes/light_theme.dart';
import '../../shared/style/themes/light_theme.dart';

class DoctorsCategoriesScreen extends StatelessWidget {
  List<CatModel> catModel = [
    CatModel(
      catName: "اسنان",
      imageUrl:
          ("https://cdn.mosoah.com/wp-content/uploads/2019/03/31145946/%D8%A7%D9%81%D8%B6%D9%84-%D8%AF%D9%83%D8%AA%D9%88%D8%B1-%D8%A7%D8%B3%D9%86%D8%A7%D9%86-%D9%81%D9%8A-%D8%A7%D8%A8%D9%88%D8%B8%D8%A8%D9%8A.jpg"),
    ),
    CatModel(
      catName: "جلدية و تناسلية",
      imageUrl:
          ("https://alriyadh-city.com/wp-content/uploads/2020/06/%D8%AA%D8%AC%D9%87%D9%8A%D8%B2-%D8%B9%D9%8A%D8%A7%D8%AF%D8%A9-%D8%AC%D9%84%D8%AF%D9%8A%D8%A9.jpg"),
    ),
    CatModel(
      catName: "جراحة مخ و أعصاب",
      imageUrl:
      ("https://www.elbalad.news/Upload/libfiles/855/7/326.jpg"),
    ),
    CatModel(
      catName: "جراحة مسالك بولية",
      imageUrl:
          ("https://lh3.googleusercontent.com/-UbAOhjHWf1k/WNevJV8S1eI/AAAAAAAAAQw/26CHWMbt58Y/Alyasmeen-Urology-Clinics%25255B11%25255D.jpg?imgmax=800"),
    ),
    CatModel(
      catName: "اطفال",
      imageUrl:
          ("https://www.sayidaty.net/sites/default/files/styles/800x510/public/2020/07/09/6864631-2035020558.jpg"),
    ),
    CatModel(
      catName: "جراحة عظام",
      imageUrl:
          ("https://docmedc.com/wp-content/uploads/2021/03/Orthopedics-Surgery-2.jpg"),
    ),
    CatModel(
      catName: "نساء و توليد",
      imageUrl:
          ("https://www.masralyoum.net/content/uploads/2020/04/16/1967fd27f6.jpg"),
    ),
    CatModel(
      catName: "جراحة أنف و أذن",
      imageUrl:("https://cute1.cc/wp-content/uploads/2016/08/20160817-5761.jpg")),
    CatModel(
      catName: "قلـب و أوعية دموية",
      imageUrl:
          ("https://ikb4.ru/wp-content/uploads/2019/06/1d4ed18872e46457fb25159b627c79b1.png"),
    ),
    CatModel(
      catName: "جراحة عامة",
      imageUrl:
          ("https://noborderhealth.com/wp-content/uploads/2019/07/%D8%A7%D9%84%D8%AC%D8%B1%D8%A7%D8%AD%D8%A9-%D8%A7%D9%84%D8%B9%D8%A7%D9%85%D8%A9.jpg"),
    ),
    CatModel(
      catName: "باطنة عامة",
      imageUrl:
          ("https://alnaharhospital.com/uploads/department/_2796293_2020-09-22-21-17-37.jpg"),
    ),
    CatModel(
      catName: "امراض كلي",
      imageUrl:
          ("https://cdn.al-ain.com/images/2018/5/10/129-001459-kidney-diseases-types-causes-treatment-2.jpeg"),
    ),
    CatModel(
      catName: "جراحة قلب و صدر",
      imageUrl:
          ("https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT4a3279/Facilities/doctor-ihab-omar-cardiology-and-thoracic-surgery-1_20171226090451537.jpg"),
    ),
    CatModel(
      catName: "صدر",
      imageUrl:
      ("https://bit.ly/3x01sqA"),
    ),
    CatModel(
      catName: "رمد",
      imageUrl:
      ("https://aawsat.com/sites/default/files/styles/article_img_top/public/2017/05/18/health-180517-1_0.jpg?itok=SGP9CGhL"),
    ),
    CatModel(
      catName: "نفسية و عصبية",
      imageUrl:
      ("https://images.akhbarelyom.com/images/images/large/20200213234803914.jpg"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,states)=>{},
      builder: (context,states){
        return  SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: GridView.count(
                                childAspectRatio: 2,
                                crossAxisSpacing: 20.0,
                                mainAxisSpacing: 10,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                crossAxisCount: 1,
                                children: List.generate(catModel.length, (index) {
                                  return AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      columnCount: 1,
                                      duration: const Duration(milliseconds: 500),
                                      child: ScaleAnimation(
                                          child: FadeInAnimation(
                                              child: buildCatItem(
                                                  catModel[index], context))));
                                }),
                              ),
                            ),
                          ]))
                ])),
          ),
        );
      },
    );
  }

  Widget buildCatItem(CatModel catModel, context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        navigateTo(
            context,
            Doctors(
              catName: catModel.catName,
              catImage: catModel.imageUrl,
            ));
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue[100],),
          //Category name
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              //Category image
              Container(
                width: width,
                height: height ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    colorFilter:
                        ColorFilter.mode(Colors.black12, BlendMode.overlay),
                    image: NetworkImage(catModel.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //Category name
              Container(
                width: width,
                height: height / 16,
                decoration: BoxDecoration(
                  color: AppCubit.get(context).isDark?
                  lightTheme.scaffoldBackgroundColor.withOpacity(0.8):lightTheme.scaffoldBackgroundColor.withOpacity(0.8),
                  borderRadius: BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(30),
                      bottomEnd: Radius.circular(30)),
                ),
                // catName
                child: Center(
                  child: Text(
                    "${catModel.catName}",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppCubit.get(context).isDark
                        ? darkTheme.textTheme.headline1.copyWith(
                      color: darkTheme.primaryColorDark
                    )
                        : lightTheme.textTheme.headline1
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
