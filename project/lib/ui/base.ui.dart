import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../constants/palette.dart';
import '../locator.dart';
import 'base.vm.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child)? builder;
  final Function(T)? onModelReady;
  final Function(T)? onDisposeReady;

  const BaseView({Key? key, this.builder, this.onModelReady, this.onDisposeReady}) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    super.initState();
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
  }

  @override
  void dispose() {
    if (widget.onDisposeReady != null) {
      widget.onDisposeReady!(model);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        create: (_) => model,
        child: Consumer<T>(
          builder: (_, model, __) => Stack(
            children: [
              widget.builder!.call(_, model, __),
              if (model.isLoading)
                Stack(children: [
                  ModalBarrier(color: Colors.black12.withOpacity(.5)),
                  Center(
                      child: SpinKitDualRing(
                        color: primaryColor,
                        size: 60,
                      ))
                ])
              else
                const SizedBox(),
            ],
            //widget.builder!,
          ),
        ));
  }
}