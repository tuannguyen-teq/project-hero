import 'package:common/common.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_review/feature/login/login_bloc.dart';

import '../../app/di/injection_container.dart';
import '../../components/highlight.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    final bloc = sl<LoginBloc>();
    return BlocProvider<LoginBloc>(
      create: (context) => bloc,
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                  height: height,
                  width: width,
                  child: const AppImageWiget(
                    AppImages.bgLogin,
                  )),
              Positioned(
                bottom: height * 0.17,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.25,
                      width: height * 0.27,
                      child: const AppImageWiget(AppImages.imgBush),
                    ),
                    Positioned(
                      top: width * 0.065,
                      child: HighLight(
                        onTap: () {
                          bloc.add(const LoginEvent());
                        },
                        child: SizedBox(
                          height: height * 0.07,
                          width: width * 0.58,
                          child: const AppImageWiget(AppImages.btnLogin),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
