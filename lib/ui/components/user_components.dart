import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:searchable_listview/provider/user_provider.dart';

class UserComponent extends StatelessWidget {
  final int index;
  const UserComponent({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, _) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Row(
            children: [
              CircleAvatar(
                maxRadius: 30.r,
                backgroundImage: NetworkImage(
                  userProvider.users[index].image,
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userProvider.users[index].name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    userProvider.users[index].userName,
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  userProvider.toggleUserFollow(index);
                  // print(userProvider.users[index].isFollowedByMe);
                },
                child: AnimatedContainer(
                  width: 100.w,
                  height: 32.h,
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: userProvider.users[index].isFollowedByMe
                        ? Colors.transparent
                        : Colors.blue.shade700,
                    // :Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: userProvider.users[index].isFollowedByMe
                          ? Colors.grey.shade700
                          : Colors.transparent,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      userProvider.users[index].isFollowedByMe
                          ? 'UnFollow'
                          : 'Follow',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
