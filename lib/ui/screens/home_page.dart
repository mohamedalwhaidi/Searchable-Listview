import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:searchable_listview/provider/user_provider.dart';
import 'package:searchable_listview/ui/components/user_components.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userProvider, _) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade900,
          title: SizedBox(
            height: 38.h,
            child: TextField(
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey.shade500,
              ),
              onChanged: (value) => userProvider.onSearch(value),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.zero,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                ),
                filled: true,
                fillColor: Colors.grey[850],
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey.shade500,
                ),
                hintText: 'Search Users',
              ),
            ),
          ),
        ),
        body: userProvider.users.isEmpty
            ? const Center(
                child: Text(
                  'No users found ....',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: userProvider.users.length,
                itemBuilder: (context, index) {
                  return UserComponent(index: index);
                },
              ),
      );
    });
  }
}
