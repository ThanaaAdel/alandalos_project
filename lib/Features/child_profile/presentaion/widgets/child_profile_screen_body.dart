import 'package:alandalos_project/Core/utils/helper.dart';
import 'package:alandalos_project/Features/exam_tab/data/data_source.dart';
import 'package:alandalos_project/Features/exam_tab/presentaion/exam_tab.dart';
import 'package:alandalos_project/Features/exam_tab/presentaion/manager/exam_details_cubit.dart';
import 'package:alandalos_project/Features/exam_tab/presentaion/manager/exam_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/assets.dart';
import '../../../account_page/presentation/views/widgets/icon_box.dart';
import 'contant_card.dart';
class ChildProfileScreenBody extends StatefulWidget {
  const ChildProfileScreenBody({super.key, required this.parentId});
final String parentId;
  @override
  State<ChildProfileScreenBody> createState() => _ChildProfileScreenBodyState();
}

class _ChildProfileScreenBodyState extends State<ChildProfileScreenBody> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body:
      CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            pinned: true,
            snap: true,
            floating: true,
            title: getAppBar(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => buildBody(),
              childCount: 1,
            ),
          )
        ],
      )

    );
  }


  Widget getAppBar(){
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("ملف الطفل", style: TextStyle(color: Colors.black, fontSize: context.screenWidth*0.05, fontWeight: FontWeight.w600),),
            ],
          )
          ),
          GestureDetector(
              onTap: (){
                // BlocProvider.of<BottomNavCubit>(context)
                //     .updateBottomNavIndex(kEditProfileScreen);
                     },
              child: IconBox(child: SvgPicture.asset("assets/icons/setting.svg", width: 20, height: 20),  ))
        ],
      );
  }

  Widget buildBody() {
    return
      SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          children: [
            Column(
              children: <Widget>[
                Column(
                  children: [
                    CircleAvatar(radius: context.screenHeight * .06,  backgroundImage:  const AssetImage(AssetsData.childImage),),

                    SizedBox(height: context.screenHeight*0.02,),
                    const Text("mohamed adel",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                     SizedBox(height: context.screenHeight*0.01,),
                     Text("الصف الاول",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: context.screenWidth*0.03,
                      ),
                    ),
                    SizedBox(height: context.screenHeight*0.03,),
                  ],
                ),
                allTasksWithChild()


          ],
        ),],),
                          );
  }

  Column allTasksWithChild() {
    return Column(children: [
                SizedBox(
                  height: context.screenHeight,
                  child: GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,crossAxisSpacing: 8,mainAxisSpacing: 8),
                    children: [

                      // GestureDetector(onTap:(){
                      //   Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewsTabScreen(),));
                      // },
                      //   child: ContantCardChild(text: "تحفيز",image:         Image.asset(   width: context.screenWidth*0.15,
                      //       height: context.screenHeight*0.15,"assets/images/review.png"),),
                      // ),

                      BlocListener<ExamDetailsCubit,ExamDetailsState>(
                        bloc: ExamDetailsCubit(GetExamDetails()),
                        listener: (context, state) {
                          if(state is FeaturedRepositorySuccessExams){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ExamTabScreen(data:state.dataInfo ),));
                          }
                          else if(state is FeaturedRepositoryFailureExams){
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text("error"),
                            ));
                          }
                          else {
                            const CircularProgressIndicator();
                          }
                        },
                        child: GestureDetector(onTap:(){
                          BlocProvider.of<ExamDetailsCubit>(context).getAllData(widget.parentId);

                        },
                          child: ContantCardChild(text: "الاختبارات",image:         Image.asset(   width: context.screenWidth*0.15,
                              height: context.screenHeight*0.15,"assets/images/exam.png"),),
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: (){
                      //     Navigator.push(context, MaterialPageRoute(builder: (context) => AbsencesTabScreen(),));
                      //
                      //     //  Navigator.pushNamed(context, kAbsencesTabScreenRoute);
                      //   },
                      //   child: ContantCardChild(text: "الغياب", image:     Image.asset(   width: context.screenWidth*0.15,
                      //       height: context.screenHeight*0.15,"assets/images/students.png"),),
                      // ),
                      // ContantCardChild(text: "درجات الطالب", image:    Image.asset(   width: context.screenWidth*0.15,
                      //  height: context.screenHeight*0.15,"assets/images/immigration.png"),)



                    ],
                  ),
                ),
              ],);
  }
}




