import 'package:airteluitest/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color mainColor = const Color(0xff292c31);

  final Color secondColor = const Color(0xff48e0ce);

  final Color thirdColor = const Color(0xff747880);

  final Color whiteLowered = const Color(0xfff0f1ff);

  final Color iconFillColor = const Color(0xffdcdffe);

  final Color fillColor = const Color(0xfff8f8ff);

  final List<String> shortcutTitles = ["recharge","pay bills", "thanks\nbenefits","add existing connection","top up data","roaming","upgrade to\npostpaid","airtel backup"];

  final List<IconData> iconTypes = [
    Icons.restart_alt,
    Icons.paypal_outlined,
    Icons.wallet_giftcard,
    Icons.add_circle,
    Icons.data_saver_on_sharp,
    Icons.four_g_plus_mobiledata,
    Icons.upgrade,
    Icons.backup_outlined,
  ];

  final List<String> imgLoc = ['assets/1.jpg','assets/2.jpg','assets/3.jpg',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: mainColor,
        toolbarHeight: 100,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.grey,width: 2.0)
              ),
              child: Icon(Icons.account_circle,size: 45,color: secondColor,),
            ),
            Column(
              children:const [
                Text("manage",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                Text("plans and accounts",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal)),
              ],
            ),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey,width: 2.0)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.notifications_none_sharp,size: 30,color: thirdColor,),
                  ),
                ),
                Positioned(
                    height: 14,
                    width: 14,
                    right: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white)
                      ),
                    ),
                ),
              ],
            ),
          ],
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: mainColor,
        ),
      ),
      bottomNavigationBar: CustomNavigation(whiteLowered: whiteLowered, mainColor: mainColor),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: whiteLowered,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),)
          ),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Center(child: Container(
                height: 8.0,
                width: 60.0,
                decoration: BoxDecoration(
                  color: iconFillColor,
                  borderRadius: BorderRadius.circular(30)
                ),
              ) ,),
              const SizedBox(height: 20,),
              //data and balance box
              HorizontalBoxes(iconFillColor: iconFillColor),
              const SizedBox(height: 30,),

              //banners boxes
              Banners(imgLoc: imgLoc),
              const SizedBox(height: 30,),

              //refer, alerts and coupons
              const CouponsRewards(),
              const SizedBox(height: 10,),

              //shortcuts
              Shortcuts(fillColor: fillColor, shortcutTitles: shortcutTitles, iconTypes: iconTypes, iconFillColor: iconFillColor),
              //solo banner
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.four_g_plus_mobiledata_outlined,size: 30,color: Colors.red,),
                      Text("Check if your phone is VOLTE enabled"),
                      Icon(Icons.arrow_right_alt,size: 40,color: Colors.red),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(color: iconFillColor,height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}

class CustomNavigation extends StatefulWidget {
  const CustomNavigation({
    Key? key,
    required this.whiteLowered,
    required this.mainColor,
  }) : super(key: key);

  final Color whiteLowered;
  final Color mainColor;


  @override
  State<CustomNavigation> createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      backgroundColor: widget.whiteLowered,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: widget.mainColor,
      unselectedItemColor: Colors.grey,
      onTap: (index){
        setState(() {
          currentIndex = index;
        });
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.scatter_plot_outlined),
          label: 'manage',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.payment),
          label: 'pay',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          label: 'shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assistant_navigation),
          label: 'discover',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble,),
          label: 'Help',
        ),
      ],
    );
  }
}

class Banners extends StatelessWidget {
  const Banners({
    Key? key,
    required this.imgLoc,
  }) : super(key: key);

  final List<String> imgLoc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: GridView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 10,
            childAspectRatio: 150/300,
          ),
          itemBuilder: (context,index){
            return VerticalBox(
              imgLocation: imgLoc[index],
            );
          }
      ),
    );
  }
}

class HorizontalBoxes extends StatelessWidget {
  const HorizontalBoxes({
    Key? key,
    required this.iconFillColor,
  }) : super(key: key);

  final Color iconFillColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        HorizontalBox(
          boxColor: iconFillColor,
          text: "GET POSTPAID",
          textColor: Colors.black,
          iconData: Icons.keyboard_arrow_right,
          textHeading: "PREPAID",
          iconSize: 20.0,
          subText: "59.3 GB\ndata left (daily+fixed)\nunlimited calls",
        ),
        const HorizontalBox(
          boxColor: Colors.black,
          text: "SHOW BALANCE",
          textColor: Colors.white,
          iconData: Icons.lock,
          textHeading: "MONEY",
          iconSize: 20.0,
          subText: "\$365\nin your wallet",
        ),
      ],
    );
  }
}

class CouponsRewards extends StatelessWidget {
  const CouponsRewards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        ThreeBox(
          color1: Color(0xffbfe375),
          color2: Color(0xff7cbb4d),
          iconBox: Icons.phone_missed,
          textBox: "   missed\n call alerts",
        ),
        ThreeBox(
          color1: Color(0xffd04fce),
          color2: Color(0xff6738e9),
          iconBox: Icons.card_giftcard,
          textBox: "   rewards\n & coupons",
        ),
        ThreeBox(
          color1: Color(0xff0fc2fe),
          color2: Color(0xff058af8),
          iconBox: Icons.people_alt,
          textBox: " refer a\n friend",
        ),
      ],
    );
  }
}

class Shortcuts extends StatelessWidget {
  const Shortcuts({
    Key? key,
    required this.fillColor,
    required this.shortcutTitles,
    required this.iconTypes,
    required this.iconFillColor,
  }) : super(key: key);

  final Color fillColor;
  final List<String> shortcutTitles;
  final List<IconData> iconTypes;
  final Color iconFillColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 270,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white,width: 3.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Text
              const Text("SHORTCUTS",style: TextStyle(color: Colors.grey,fontSize: 12),),
              const SizedBox(height: 20,),
              //GridView builder
              SizedBox(
                height: 200,
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 16/19
                    ),
                    itemCount: shortcutTitles.length,
                    itemBuilder: (context,index){
                      return ShortcutsBox(
                        icon: iconTypes[index],
                        color: iconFillColor,
                        text: shortcutTitles[index],
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
