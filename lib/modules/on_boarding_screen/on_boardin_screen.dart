import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medically/layout/home_layout/home_layout.dart';
import 'package:medically/models/boarding_model/boarding_model.dart';
import 'package:medically/shared/componnet/component.dart';
import 'package:medically/shared/componnet/constants.dart';
import 'package:medically/shared/cubit/app_cubit.dart';
import 'package:medically/shared/cubit/app_states.dart';
import 'package:medically/shared/network/local/cached_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
        imageUrl: "assets/images/hospital.jpg",
        title: "Hospitals",
        body: "You Can Find Nearby Hospital With Maps"),
    BoardingModel(
        imageUrl: "assets/images/homepage_vector_doctors-02.png",
        title: "Doctors",
        body: "You Can Find Doctors In Any Specialization"),
    BoardingModel(
        imageUrl: "assets/images/covid-mask-01.jpg",
        title: "Covid-19",
        body: "You Can Keep Track On Covid-19 Latest News"),
  ];

  var boardController = PageController();

  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(actions: [
            defaultTextButton(
              context: context,
              labelText: Text("Skip",
                  style: Theme.of(context)
                      .textTheme
                      .overline
                      .copyWith(color: Colors.pinkAccent[700],fontSize: 28)),
              onPressed: submit,
            )
          ]),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (int index) {
                      if (index == boarding.length - 1) {
                        setState(() {
                          isLast = true;
                        });
                      } else {
                        setState(() {
                          isLast = false;
                        });
                      }
                    },
                    controller: boardController,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildBoardingItem(boarding[index]),
                    itemCount: boarding.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(
                  height: 60.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: boardController,
                      count: boarding.length,
                      effect: ExpandingDotsEffect(
                          dotColor: primaryColor,
                          radius: 6,
                          activeDotColor: Colors.pink,
                          expansionFactor: 2.0,
                          spacing: 6.0,
                          offset: 16.0,
                          dotHeight: 10,
                          dotWidth: 10),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        if (isLast == true) {
                          submit();
                        } else {
                          boardController.nextPage(
                              duration: Duration(milliseconds: 450),
                              curve: Curves.decelerate);
                        }
                      },
                      child: Icon(Icons.arrow_forward_ios_outlined),
                      elevation: 4.0,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildBoardingItem(BoardingModel boardingModel) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage(boardingModel.imageUrl),
            ),
          ),
          Text(
            boardingModel.title,
            style: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
                fontFamily: "Tajawal-Black"
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            boardingModel.body,
            style: TextStyle(fontSize: 24.0,color: Colors.pink,fontFamily: "Tajawal-Light"),
          ),
          SizedBox(
            height: 60.0,
          ),
        ],
      );

  void submit() {
    CashedHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndFinish(context, HomeLayout());
      }
    }).catchError((error) {
      print(error.toString());
    });
  }
}
