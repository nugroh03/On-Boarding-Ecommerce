import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_boarding_screen/slider.dart';

class OnBoardingPage extends StatefulWidget {
  OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  
  final List _page = [

    
    {
      'title':'Pesan Dimanapun',
      'image':'assets/2.png',
      'content':'Anda dapat memesan belanjaan dari mana saja dan kapanpun melalui handphone',
    },
   {
     'title':'Lanjutkan Aktivitasmu',
     'image':'assets/1.png',
      'content':'Sembari menunggu pesanan, anda dapat melakukan aktivitas tanpa khawatir',
    },{
      'title':'Terima Pesananmu',
      'image':'assets/3.png',
      'content':'Kurir akan datang membawa pesananmu dengan Aman',
    },
  ];

  int _currentPage = 0;

  PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: _controller,
        itemCount: _page.length,
        onPageChanged: _onChanged,
        itemBuilder: (context, int index) {
          return SliderWidget(
            title: _page[index]['title'],
            image: _page[index]['image'],
            content: _page[index]['content']
          );
        }),
        bottomNavigationBar: PreferredSize(child: Container(
                 height: 80,
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.035,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: GestureDetector(
                          onTap: () {
                            //context.bloc<PageBloc>().add(GoToHomePage());
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              'SKIP',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:
                              List<Widget>.generate(_page.length, (int index) {
                            return AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              height: 10,
                              width: (index == _currentPage) ? 30 : 10,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 30),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: (index == _currentPage)
                                      ?Colors.black: Colors.grey
                                       ),
                            );
                          }),
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.035,
                          width: MediaQuery.of(context).size.width * 0.25,
                          alignment: Alignment.topCenter,
                          child: GestureDetector(
                            onTap: () {
                              print(_currentPage);
                              _controller.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOutQuint);

                              // if (_currentPage == 2) {
                              //   context.bloc<PageBloc>().add(GoToHomePage());
                              // }
                            },
                            child: Container(
                              alignment: Alignment.centerRight,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                'NEXT',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ),
                          )

                         
                          )
                    ],
                  ),
                )
, preferredSize: Size.fromHeight(80)),
      ),
    );
  }
}
