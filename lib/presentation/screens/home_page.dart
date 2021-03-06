import 'package:flutter/material.dart';
import 'package:movies_db/presentation/page_view_screens/first_page_view_screen.dart';
import 'package:movies_db/presentation/page_view_screens/second_page_view_screen.dart';
import 'package:movies_db/presentation/page_view_screens/third_page_view_screen.dart';
import 'package:movies_db/presentation/widgets/home_page_app_container.dart';
import 'package:movies_db/presentation/widgets/movie_list_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final PageController _pageController = PageController(initialPage: 0);

  void _onDotClicked(int index){}

  void _onPageChanged(int index){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.blueGrey,

      body: CustomScrollView(


        slivers: [

          SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.black.withOpacity(0.95),
            expandedHeight: MediaQuery.of(context).size.height * 0.35,
            centerTitle: true,

            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  PageView(

                    onPageChanged: _onPageChanged,

                    controller: _pageController,

                    children: const [
                      FirstPageViewScreen(),
                      SecondPageViewScreen(),
                      ThirdPageViewScreen()
                    ],
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Align(
                      alignment: Alignment(0, 0.9),
                      child: SmoothPageIndicator(
                        onDotClicked: _onDotClicked,
                        controller: _pageController,
                        count: 3,
                        effect: const CustomizableEffect(
                            dotDecoration: DotDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(90)),
                              color: Colors.black
                            ),
                            activeDotDecoration: DotDecoration(
                                width: 10,
                                height: 10,
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(90)),
                            )

                        ),
                      ),
                    ),
                  )
                ],
              )
            ),
          ),

          // SliverToBoxAdapter(
          //   child: SearchTextField(),
          // ),

          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  HomePageAppContainer(
                    text: '?????? ?????????????????????',
                    child: MovieListView(),
                  ),

                  HomePageAppContainer(
                    text: '???????????????????? ?? ???????? ????????????',
                    child: MovieListView(),
                  ),

                  HomePageAppContainer(
                    text: '??????????????????',
                    child: MovieListView(),
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}

//Container(
//                 decoration: const BoxDecoration(
//         color: Colors.transparent,
//                     image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image: AssetImage('assets/images/sliver_test_image.png'))
//                 ),
//
//                 child:  const Center(child: Text('?????????????? ????????????',style: AppTextStyle.headerStyle)),
//               ),