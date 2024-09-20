import 'package:e_commerce_app/home_screen/cubit/home_screen_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../tabs/home_tab/home_tab.dart';
import '../../tabs/product_list_tab/product_list_tap.dart';

class HomeScreenModel extends Cubit<HomeScreenStates>{
  HomeScreenModel():super(HomeScreenInitialState());
  int selectedIndex = 0;
  List<Widget> tabs =[
    HomeTab(),
    ProductListTab(),
    //FavouriteTab(),
    //ProfileTab()
  ];

  void changeSelectedIndex(int newIndex){
    emit(HomeScreenInitialState());
    selectedIndex = newIndex;
    emit(ChangeSelectedIndexState());
  }

}