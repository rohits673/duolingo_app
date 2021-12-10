import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Images {
  //BottomNavigationBar
  static final SvgPicture tabLearn =
      SvgPicture.asset("assets/images/bottom_navigation_bar/tab_learn.svg");
  static final SvgPicture tabStories =
      SvgPicture.asset("assets/images/bottom_navigation_bar/tab_stories.svg");
  static final SvgPicture tabProfile =
      SvgPicture.asset("assets/images/bottom_navigation_bar/tab_profile.svg");
  static final SvgPicture tabChat =
      SvgPicture.asset("assets/images/bottom_navigation_bar/tab_chat.svg");
  static final SvgPicture tabStore =
      SvgPicture.asset("assets/images/bottom_navigation_bar/tab_store.svg");

  //BottomNavigationBar selected
  static final SvgPicture activeLearn = SvgPicture.asset(
      "assets/images/bottom_navigation_bar/tab_learn_active.svg");
  static final SvgPicture activeStories = SvgPicture.asset(
      "assets/images/bottom_navigation_bar/tab_stories_active.svg");
  static final SvgPicture activeProfile = SvgPicture.asset(
      "assets/images/bottom_navigation_bar/tab_profile_active.svg");
  static final SvgPicture activeChat = SvgPicture.asset(
      "assets/images/bottom_navigation_bar/tab_chat_active.svg");
  static final SvgPicture activeStore = SvgPicture.asset(
      "assets/images/bottom_navigation_bar/tab_store_active.svg");
}
