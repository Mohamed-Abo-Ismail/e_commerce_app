import 'package:e_commerce_app/home_screen/Custome_buttom_navigation_bar.dart';
import 'package:e_commerce_app/home_screen/cubit/home_screen_model.dart';
import 'package:e_commerce_app/home_screen/cubit/home_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget{
  static const String routeName = 'HomeScreen';
HomeScreenModel viewModel = HomeScreenModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenModel,HomeScreenStates>(
      bloc: viewModel,
      builder: (context,state){
        return Scaffold(
          bottomNavigationBar:buildCustomBottomNavigationBar(
            context: context,
            selectedIndex: viewModel.selectedIndex,
            onTapFunction:(index){
              viewModel.changeSelectedIndex(index);
            },
          ) ,
          body: viewModel.tabs[viewModel.selectedIndex],
        );
      },
    );
  }
}