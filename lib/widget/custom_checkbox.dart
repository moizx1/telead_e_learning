import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final Widget _child;

  CustomCheckBox({Key? key})
      : _child = Container(),
        super(key: key);

  CustomCheckBox.circle({
    Key? key,
    final bool isChecked = false,
  })  : _child = _CustomCircleCheckBox(isChecked: isChecked),
        super(key: key);

  CustomCheckBox.square({
    Key? key,
    final bool? isChecked,
    final Function(bool?)? onChanged,
  })  : _child = _CustomSquareCheckBox(
          isChecked: isChecked,
          onChanged: onChanged,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _child;
  }
}

class _CustomCircleCheckBox extends StatelessWidget {
  const _CustomCircleCheckBox({super.key, this.isChecked = false});
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return isChecked
        ? Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              color: const Color(0xff50B748),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.check_circle,
              color: Colors.white,
              size: 14,
            ),
          )
        : const Icon(
            Icons.crop_square_outlined,
            color: Color(0xff167F71),
            size: 22,
          );
  }
}

class _CustomSquareCheckBox extends StatelessWidget {
  const _CustomSquareCheckBox(
      {super.key, this.isChecked = true, required this.onChanged});
  final bool? isChecked;
  final Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: const Color(0xff167F71),
      // focusColor: const Color(0xff167F71),
      fillColor: isChecked == false
          ? const MaterialStatePropertyAll(Color(0xffE8F1FF))
          : null,
      side: const BorderSide(
        color: Color(0xffB4BDC4),
        width: 2,
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      value: isChecked,
      onChanged: onChanged,
    );
  }
}


