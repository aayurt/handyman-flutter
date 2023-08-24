import 'package:handyman/core/constants/files.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomTextfield extends HookWidget {
  final String hintText;
  final String labelText;
  final String? helperText;
  final String? errorText;
  final bool required;
  final bool obscureText;
  final bool enabled;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final InputDecoration? decoration;
  final FormFieldValidator<String>? validator;
  const CustomTextfield(
      {Key? key,
      this.hintText = "",
      this.labelText = "",
      this.errorText,
      this.helperText,
      this.controller,
      this.decoration,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.enabled = true,
      this.required = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final visibility = useState<bool>(false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(labelText,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: const Color(0xFF000000))),
            ),
            required
                ? Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: Text(
                      "*",
                      style: TextStyle(
                        color: Colors.red.withOpacity(0.5),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          // constraints: const BoxConstraints(maxHeight: 60, minHeight: 60),
          height: 60,
          child: TextFormField(
            textInputAction: TextInputAction.next,
            controller: controller,
            enabled: enabled,
            keyboardType: keyboardType,
            obscureText: obscureText && !visibility.value,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.black.withOpacity(
                    1,
                  ),
                ),
            validator: validator,
            decoration: InputDecoration(
              filled: true,
              isDense: true,
              suffixIconConstraints: const BoxConstraints(
                maxHeight: 34,
              ),
              suffixIcon: obscureText
                  ? (visibility.value
                      ? IconButton(
                          icon: Image.asset(
                            MyAssets.assetVisibilityOn,
                          ),
                          onPressed: () {
                            visibility.value = false;
                          },
                        )
                      : IconButton(
                          icon: Image.asset(
                            MyAssets.assetVisibilityOff,
                          ),
                          onPressed: () {
                            visibility.value = true;
                          },
                        ))
                  : null,
              hintText: hintText,
              errorMaxLines: 1,
              errorText: errorText,
              contentPadding: const EdgeInsets.only(
                top: 14.0,
                right: 16.0,
                bottom: 14.0,
              ),
              hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black.withOpacity(0.7),
                    letterSpacing: 0.16,
                  ),
              errorStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    height: 0.8,
                    color: Colors.red.withOpacity(0.9),
                  ),
              prefix: const Padding(padding: EdgeInsets.only(left: 16)),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.red.withOpacity(0.60),
                  width: 0.5,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.red.withOpacity(0.60),
                  width: 0.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.blue.withOpacity(0.70),
                  width: 0.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(0.45),
                  width: .5,
                ),
              ),
            ),
            onSaved: (value) {},
          ),
        ),
      ],
    );
  }
}
