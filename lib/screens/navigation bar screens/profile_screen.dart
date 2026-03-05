import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/auth/user_cubit.dart';
import 'package:movie_app/widgets/profile_builder.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
    context.read<UserAuthCubit>().getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ProfileBuilder();
  }
}
