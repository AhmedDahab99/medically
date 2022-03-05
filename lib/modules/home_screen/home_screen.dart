import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:medically/models/cateModel.dart';
import 'package:medically/models/doctorsModel.dart';
import 'package:medically/modules/doctors_categories/doctorsCategories.dart';
import 'package:medically/modules/doctors_categories/profile_doctor/profile_screen.dart';
import 'package:medically/shared/componnet/component.dart';
import 'package:medically/shared/cubit/app_cubit.dart';
import 'package:medically/shared/cubit/app_states.dart';
import 'package:medically/shared/style/themes/dark_theme.dart';
import 'package:medically/shared/style/themes/light_theme.dart';

class homeScreen extends StatelessWidget {
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
      imageUrl: ("https://www.elbalad.news/Upload/libfiles/855/7/326.jpg"),
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
        imageUrl:
            ("https://cute1.cc/wp-content/uploads/2016/08/20160817-5761.jpg")),
    CatModel(
      catName: "قلـب و أوعية دموية",
      imageUrl:
          ("https://ikb4.ru/wp-content/uploads/2019/06/1d4ed18872e46457fb25159b627c79b1.png"),
    ),
  ];
  List<DoctorsModel> doctorsModel = [
    DoctorsModel(
        image:
        "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTf4c408/Profile/150/doctor-ahmed-abdallah-dentistry-2_20210630181043421.jpg",
        name: "د/ أحمد عبد الله",
        job: "دكتور اسنان متخصص في تجميل اسنان",
        categoryName: "اسنان",
        rate: "4.5 / 5",
        numOfPatients: 2172,
        price: 150,
        phone: 19777,
        info:
        " ماجستير زراعة الاسنان من جامعة القاهرة (القصر العيني )، عضو الفريق العالمي لزراعة الاسنان،زميل الأكاديمية الامريكية لزراعة الاسنان",
        address: "ش جمال عبدالناصر",
        city: "العصافرة - الاسكندرية",
        day: "السبت - الجمعة",
        time: "من 10:30 صباحاً حتي 10:30 مساءاً"),
    DoctorsModel(
        image:
        "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT8d3df1/Profile/150/doctor-omar-eldidi-dentistry_20190804201909358.jpg",
        name: "د/ عمر الديدي",
        job: "اخصائي التركيبات الثابتة",
        categoryName: "اسنان",
        rate: "4.5 / 5",
        numOfPatients: 346,
        price: 250,
        phone: 1977,
        info:
        " مجموعة من امهر اخصائين اطباء الاسنان كلن في تخصصه لكي يحصل العميل على اعلى مستويات الجودة من العلاج.قريبا فرع التجمع الخامس زراعة اسنان , تركيبات ثابتة و تجميليه , تبيض الاسنان , علاج جذور , طب اسنان الاطفال , علاج لثه و تنظيف الاسنان",
        address: "شارع عبد العزيز عيسى",
        city: "مدينة نصر - القاهرة",
        day: "السبت - الجمعة",
        time: "من الساعة 11 صباحاً حتي 8 مساءاً"),
    DoctorsModel(
        image:
        "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTc052d4/Profile/150/doctor-neviene-bishay-dentistry_20191128161948566.jpg",
        name: "د/ احمد ممدوح حجازى",
        job: "دكتور اسنان متخصص في تجميل اسنان",
        categoryName: "اسنان",
        rate: "4.5 / 5",
        numOfPatients: 500,
        price: 80,
        phone: 15035,
        info:
        " عضو الجمعية المصرية لطب الأطفال د. الزمالة البريطانية لطب الأطفال. دكتور اطفال وحديثي الولادة متخصص في اطفال و حديثي الولادة",
        address: "ميدان شرف",
        city: "شبين الكوم - المنوفية",
        day: "السبت - الجمعة",
        time: "من الساعة 1 ظهراً"),
    DoctorsModel(
        image: "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTc98b3e/Profile/150/doctor-manar-khater-plastic-surgery_20201104182013264.jpg",
        name: "د/ منار خاطر",
        job: "أخصائي جراحة التجميل والحروق",
        categoryName: "جلدية و تناسلية",
        rate: "4.5 / 5",
        numOfPatients: 300,
        price: 150,
        phone: 16777,
        info:
        " أخصائية جراحات التجميل والحروق وجراحات الوجه والفكين وجراحات اليد .... حقن بوتوكس وفيلر وتقشير للبشره وبلازما للشعر والوجه ** ماجستير جراحات التجميل والحروق مستشفيات جامعه القاهره ** اخصائى جراحات التجميل والحروق بمستشفى العربى ** اخصائى جراحات التجميل والحروق بمستشفى الطلبه جامعه المنوفيه ** حاصله على تدريب فى الطب التجميلي والليزر بأكاديمية مصر الدوليه وجامعه عين شمس ** عضو بالاكاديمية المصريه للجمال ** عضو بالجمعية المصريه للتعليم الطبى المستمر",
        address: "٦٠ شارع الخليفة المأمون",
        city: "مصر الجديدة - القاهرة",
        day: "السبت - الجمعة",
        time: "من الساعة 1 ظهراً"),
    DoctorsModel(
        image: "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT5a0d11/Profile/150/doctor-hanan-dawoud-plastic-surgery_20210112155822865.jpg",
        name: "د/ محمود صبري صالح",
        job: "أخصائي طب الأطفال و حديثي الولادة",
        categoryName: "جلدية و تناسلية",
        rate: "4.5 / 5",
        numOfPatients: 300,
        price: 50,
        phone: 16777,
        info:
        " عضو الجمعية المصرية لطب الأطفال د. الزمالة البريطانية لطب الأطفال. دكتور اطفال وحديثي الولادة متخصص في اطفال و حديثي الولادة",
        address: "شارع الجيش",
        city: "منوف - المنوفية",
        day: "السبت - الجمعة",
        time: "من الساعة 1 ظهراً"),
    DoctorsModel(
        image: "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTffdeb7/Profile/150/doctor-sally-salah-dermatology_20190404121108201.jpg",
        name: "د/ محمود صبري صالح",
        job: "أخصائي طب الأطفال و حديثي الولادة",
        categoryName: "جلدية و تناسلية",
        rate: "4.5 / 5",
        numOfPatients: 300,
        price: 50,
        phone: 16777,
        info:
        " عضو الجمعية المصرية لطب الأطفال د. الزمالة البريطانية لطب الأطفال. دكتور اطفال وحديثي الولادة متخصص في اطفال و حديثي الولادة",
        address: "شارع الجيش",
        city: "منوف - المنوفية",
        day: "السبت - الجمعة",
        time: "من الساعة 1 ظهراً"),
    DoctorsModel(
        image:
        "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT7f7131/Profile/150/doctor-hesham-mohammed-elsharkha-dentistry_20191113125837067.jpg",
        name: "د/ هشام محمد الشرخة",
        job: "أخصائي طب الفم و علاج اللثة و زراعة الأسنان",
        categoryName: "اسنان",
        rate: "4.5 / 5",
        numOfPatients: 780,
        price: 90,
        phone: 15035,
        info:
        "اخصائي علاج الجذور وتجميل الاسنان. علاج العصب في جلسه واحده باسخدام الميكروسكوب واحدث اجهزه علاج العصب",
        address: "شارع قناة السويس",
        city: "المنصورة - الدقهلية",
        day: "السبت - الجمعة",
        time: "من الساعة 4 م حتي 8 م "),
    DoctorsModel(
        image:
        "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTa997f0/Profile/150/doctor-mohamed--shaheen-dentistry_20210131025337350.jpg",
        name: "د/  محمد شاهين",
        job: "اخصائي علاج الجذور وتجميل الاسنان",
        categoryName: "اسنان",
        rate: "4.5 / 5",
        numOfPatients: 500,
        price: 50,
        phone: 02180,
        info:
        " اخصائي علاج الجذور وتجميل الاسنان. علاج العصب في جلسه واحده باسخدام الميكروسكوب واحدث اجهزه علاج العصب",
        address: "ش جمال عبد الناصر",
        city: "سيدي بشر - الاسكندرية",
        day: "السبت - الجمعة",
        time: "من الساعة 11 ص حتي 11:30 م"),
    DoctorsModel(
        image:
        "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT6a03c27de2a067a0/Profile/150/doctor-mahmoud-ashoub_20200209112852599.jpg",
        name: "د/ محمود عشوب",
        job: "أستشارى تركيبات و تجميل الأسنان القصر العيني",
        categoryName: "اسنان",
        rate: "4.5 / 5",
        numOfPatients: 2000,
        price: 200,
        phone: 03482,
        info:
        " أستشارى التركيبات الثابته و تجميل الأسنان بالقصر العيني - ماجستير و دكتوراه د التركيبات الثابتة و تجميل الاسنان بالقصر العيني - مدرس التركيبات الثابته وتجميل الاسنان بجامعة 6 اكتوبر-عضو الجمعيه الامريكيه لتجميل الاسنان بنيويورك",
        address: "المحور المركزي",
        city: "6 اكتوبر - الجيزة",
        day: "السبت - الجمعة",
        time: "من الساعة 1 ظهراً"),
    DoctorsModel(
        image:
        "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTd36157/Profile/150/doctor-mohamed-hamdy-dentistry_20200912211430607.jpg",
        name: "د/ محمد حمدي",
        job: "دكتور اسنان متخصص في تجميل اسنان",
        categoryName: "اسنان",
        rate: "4.5 / 5",
        numOfPatients: 1560,
        price: 150,
        phone: 1119,
        info:
        " دكتور محمد حمدي - زميل الكليه الملكيه بلندن",
        address: "الحي الثامن, اعلى اولاد رجب",
        city: "6اكتوبر - الجيزة",
        day: "السبت - الجمعة",
        time: "من الساعة 1 ظهراً"),
    DoctorsModel(
        image: "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTef15e0/Profile/150/doctor-ahmed-fergany-plastic-surgery_20190219165111871.jpg",
        name: "د/ احمد فرجاني",
        job: "استشارى جراحة التجميل والليزر",
        categoryName: "جلدية و تناسلية",
        rate: "4.5 / 5",
        numOfPatients: 300,
        price: 125,
        phone: 16777,
        info:
        " استشاري جراحة التجميل والليزر -عضو الجمعية المصرية لجراحة التجميل - عضو الجمعية الدولية لجراحة التجميل - عضو الجمعية العلمية السعودية لجراحة التجميل والحروق",
        address: " ميدان شرف _ امام البنزينة",
        city: "شبين الكوم - المنوفية",
        day: "السبت - الجمعة",
        time: "من الساعة 1 ظهراً"),
    DoctorsModel(
        image:
        "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTa28e6d/Profile/150/doctor-aly-ismail-el-tahan-dentistry_20200814170538086.jpg",
        name: "د/ علي إسماعيل الطحان",
        job: "دكتور اسنان متخصص في اسنان اطفال",
        categoryName: "اسنان",
        rate: "4.5 / 5",
        numOfPatients: 450,
        price: 100,
        phone: 010620,
        info:
        " ١-اخصائي علاج الجذور (ماجيستير علاج الجذور- جامعه مصر الدوليه) ٢-ماچيستير جراحات تجميل الفم و اللثه و تجميل الاسنان بالليزر (جامعة أخن ألمانيا) ٣-عضو و زميل الجمعية العالمية لزراعة الاسنان ٤-عضو و زميل الجمعية الالمانية لزراعة الاسنان (جامعة جوته -فرانكفورت -المانيا) ٥-عضو الاكاديميه العالميه لليزر ٦- ٨ سنوات خبره في مجال طب الاسنان منذ عام ٢٠١٢",
        address: "ش طابا",
        city: "الزقايق - الشرقية",
        day: "السبت - الجمعة",
        time: "من الساعة 3 مساءاً حتي 10 مساءاً"),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, states) => {},
      builder: (context, states) {
        return SafeArea(
            child: Scaffold(
          body: homeBuilder(context),
        ));
      },
    );
  }

  Widget homeBuilder(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
            children: [
              CarouselSlider(
                  items: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image(
                            image: AssetImage("assets/images/mask.jpg"),
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: MediaQuery.of(context).size.height / 4,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: MediaQuery.of(context).size.height / 4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppCubit.get(context).isDark
                                  ? darkTheme.primaryColorDark.withOpacity(0.6)
                                  : lightTheme.primaryColorDark.withOpacity(0.6),),
                          child: Center(
                              child: Text(
                            "من فضلك لا تنزع الكمامة",
                            style: AppCubit.get(context).isDark
                                ? darkTheme.textTheme.headline1
                                : darkTheme.textTheme.headline1,
                          )),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image(
                            image:
                                AssetImage("assets/images/hospital_banner.jpg"),
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: MediaQuery.of(context).size.height / 4,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: MediaQuery.of(context).size.height / 4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppCubit.get(context).isDark
                                  ? darkTheme.primaryColorDark.withOpacity(0.6)
                                  : lightTheme.primaryColorDark.withOpacity(0.6),),
                          child: Center(
                              child: Text(
                            "حدد موقعك لتتمكن من العثور علي اقرب مستشفي",
                            textAlign: TextAlign.center,
                            style: AppCubit.get(context).isDark
                                ? darkTheme.textTheme.headline3.copyWith(
                              fontSize: 14
                            )
                                : darkTheme.textTheme.headline1.copyWith(fontSize: 14),
                          )),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image(
                            image: AssetImage("assets/images/doctor.jpg"),
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: MediaQuery.of(context).size.height / 4,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: MediaQuery.of(context).size.height / 4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppCubit.get(context).isDark
                                  ? darkTheme.primaryColorDark.withOpacity(0.6)
                                  : lightTheme.primaryColorDark.withOpacity(0.6),),
                          child: Center(
                              child: Text(
                            "اختر طبيباً في أي تخصص تريده",
                            textAlign: TextAlign.center,
                            style: AppCubit.get(context).isDark
                                ? darkTheme.textTheme.headline1
                                : darkTheme.textTheme.headline1,
                          )),
                        )
                      ],
                    ),
                  ],
                  options: CarouselOptions(
                    height: 220,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    reverse: false,
                    viewportFraction: 0.9,
                    scrollPhysics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlayCurve: Curves.easeOutSine,
                  )),
              SizedBox(height: 20,),
              SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(onPressed: (){
                                navigateTo(
                                    context,
                                    DoctorsCategoriesScreen());
                              }, child: Text(
                                "....المزيد",
                                style: AppCubit.get(context).isDark?
                                darkTheme.textTheme.caption
                                    : lightTheme.textTheme.caption
                              )),
                              Text(
                                  "التخصصــــات",
                                style: AppCubit.get(context).isDark
                                    ? darkTheme.textTheme.headline1
                                    : lightTheme.textTheme.headline1,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height:120,
                                      width: double.infinity,
                                      child: ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: catModel.length,
                                          itemBuilder:(context,index){
                                            return buildCatItem(
                                                catModel[index],
                                                context);
                                          } )
                                  ),
                                ]))
                      ])),
              SizedBox(height: 30,),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(onPressed: (){
                            navigateTo(
                                context,
                                DoctorsCategoriesScreen());
                          }, child: Text(
                            "....المزيد",
                            style: AppCubit.get(context).isDark?
                            darkTheme.textTheme.caption
                                : lightTheme.textTheme.caption
                          )),
                          Text(
                              "افضل الاطبــــاء",
                            style: AppCubit.get(context).isDark
                                ? darkTheme.textTheme.headline1
                                : lightTheme.textTheme.headline1,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),

                    Container(
                      // color: lightBlueColor.withOpacity(0.3),
                      child: GridView.count(
                        childAspectRatio: 1 / 1.2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        children:
                        List.generate(doctorsModel.length, (index) {
                          return AnimationConfiguration.staggeredGrid(
                              position: index,
                              columnCount: 2,
                              duration: const Duration(milliseconds: 375),
                              child: ScaleAnimation(
                                  child: FadeInAnimation(
                                      child:buildDoctorItem(doctorsModel[index],context))));
                        }),
                      ),
                    )
                  ]),
            ],
          ),
    );
  }
  Widget buildDoctorItem(DoctorsModel doctorsModel, context) {
    return GestureDetector(
      onTap: () {
        navigateTo(context, ProfileScreen(
          rate: doctorsModel.rate,
          job: doctorsModel.job,
          address: doctorsModel.address,
          city: doctorsModel.city,
          price: doctorsModel.price,
          numOfPatients: doctorsModel.numOfPatients,
          phone: doctorsModel.phone,
          name: doctorsModel.name,
          info: doctorsModel.info,
          time: doctorsModel.time,
          image: doctorsModel.image,
          day: doctorsModel.day,
        ));
      },
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50)
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
        borderRadius: BorderRadius.circular(50),
          child: Image(
                // color: Colors.amber,
                image: NetworkImage(doctorsModel.image),
                fit: BoxFit.contain,
                width: double.infinity,
                height: 150,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              doctorsModel.name,
              style: AppCubit.get(context).isDark
                  ? darkTheme.textTheme.overline
                  : lightTheme.textTheme.overline,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '${doctorsModel.categoryName}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppCubit.get(context).isDark
                  ? darkTheme.textTheme.subtitle1
                  : lightTheme.textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCatItem(CatModel catModel, context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        width: 200,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.blue[100],
        ),
        //Category name
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            //Category image
            Container(
              width: width,
              height: height,
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
                color: AppCubit.get(context).isDark
                    ? darkTheme.primaryColorDark.withOpacity(0.8)
                    : lightTheme.primaryColorLight.withOpacity(0.8),
                // color: Colors.white54.withOpacity(0.8),
                borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(30),
                    bottomEnd: Radius.circular(30)),
              ),
              // catName
              child: Center(
                child: Text("${catModel.catName}",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppCubit.get(context).isDark
                        ? darkTheme.textTheme.headline3
                        : lightTheme.textTheme.headline3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}