import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medically/models/doctorsModel.dart';
import 'package:medically/modules/doctors_categories/profile_doctor/profile_screen.dart';
import 'package:medically/shared/componnet/component.dart';

import '../../../shared/cubit/app_cubit.dart';
import '../../../shared/cubit/app_states.dart';
import '../../../shared/style/themes/dark_theme.dart';
import '../../../shared/style/themes/light_theme.dart';
part 'doctors_list.dart';
class Doctors extends StatelessWidget {

  final String catName;
  final String catImage;
  static var  _modelList= <DoctorsModel>[];

  Doctors({
    @required this.catName,
    @required this.catImage,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,states)=>{},
      builder:(context,states){
        return SafeArea(
            child: Scaffold(
              backgroundColor: AppCubit.get(context).isDark?darkTheme.scaffoldBackgroundColor:Color(0xfff9f9fa),
              body: getBody(context),
            ));
      }
    );
  }
  Widget getBody(context) {
    var size = MediaQuery.of(context).size;
    _modelList=doctorsModel.where((element) => element.categoryName==catName).toList();
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),

      child: Stack(
        children: <Widget>[
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: size.height * 0.35,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("$catImage"),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  color: AppCubit.get(context).isDark?darkTheme.scaffoldBackgroundColor.withOpacity(0.7):lightTheme.primaryColorDark.withOpacity(0.7),
                  child:Padding(
                    padding: const EdgeInsets.only(top: 0,bottom:120,right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "اختـــــــــــــــر  طبيــــــــــــــباً",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30, color: Colors.white,fontFamily: "ElMessiri-Bold"),
                        ),
                        SizedBox(height: 20,),
                        Text(
                          "$catName",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: "ElMessiri-Bold"),
                        ),
                        Divider(
                          color: Colors.white,
                          height: 20,
                          thickness: 2.0,
                          indent: 60,endIndent: 60,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: SafeArea(
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 325,top: 10,),
                    child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Card(
                          elevation: 15,
                          color: Colors.white38,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                          ),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white38,
                            child: Icon(Icons.arrow_forward_ios_rounded,
                              color: Color(0xff6B011F),
                            ),
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
          // container of listView to display List Of doctors
          Container(
            margin: EdgeInsets.only(top: size.height * 0.2),
            width: double.infinity,
            decoration: BoxDecoration(
               color: AppCubit.get(context).isDark?darkTheme.scaffoldBackgroundColor:Color(0xfff9f9fa),
                //color: Color(0xfff9f9fa),
                borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return buildDoctorsCard(
                                context, _modelList[index]);
                          },
                          itemCount:_modelList.length,
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) =>
                              SizedBox(
                                height: 15,
                              )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  //
  Widget buildDoctorsCard(context, DoctorsModel model) => GestureDetector(
    onTap: () {
      navigateTo(context, ProfileScreen(
        rate: model.rate,
        job: model.job,
        address: model.address,
        city: model.city,
        price: model.price,
        numOfPatients: model.numOfPatients,
        phone: model.phone,
        name: model.name,
        info: model.info,
        time: model.time,
        image: model.image,
        day: model.day,
      ));
    },
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      elevation: 2,
      child: Container(
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30,right: 10,top: 5,bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${model.name}",
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      style: AppCubit.get(context).isDark?darkTheme.textTheme.caption:lightTheme.textTheme.caption
                    ),

                    Text(
                      "${model.job}",
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      style: AppCubit.get(context).isDark?darkTheme.textTheme.subtitle1
                          :lightTheme.textTheme.subtitle1
                    ),

                    Text(
                      "العنوان/ ${model.address}",
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      style: AppCubit.get(context).isDark?darkTheme.textTheme.subtitle1
                          :lightTheme.textTheme.subtitle1
                    ),

                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${model.price} جنيهاً",
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: AppCubit.get(context).isDark?darkTheme.textTheme.subtitle1
                              :lightTheme.textTheme.subtitle1
                        ),
                        Text(
                          "سعر الكشف: ",
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: AppCubit.get(context).isDark?darkTheme.textTheme.subtitle1
                              :lightTheme.textTheme.subtitle1
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[100].withOpacity(0),
                        borderRadius: BorderRadius.circular(12)),
                    child: Image(
                      image: NetworkImage("${model.image}"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
