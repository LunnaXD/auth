import 'package:flutter/material.dart';

import '../presentation.dart';

typedef ChangedSelector<T> = Function(T selected);
typedef TextValue<T> = String? Function(T object);

class Selector<T> extends StatelessWidget {
  final FieldStatus status;
  final String? errorText;
  final String? label;
  final List<T>? items;
  final T? initialValue;
  final bool enabled;
  final ChangedSelector<T?> onChanged;
  final VoidCallback? onClean;
  final VoidCallback? onPressRetry;
  final TextValue<T?> textValue;

  static const double _heightSelector = DimensConst.heightFieldDense;

  const Selector({
    Key? key,
    required this.status,
    this.errorText,
    this.label,
    required this.items,
    required this.initialValue,
    this.enabled = true,
    required this.onChanged,
    this.onClean,
    this.onPressRetry,
    required this.textValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: _DropdownWidget(
            items: items,
            errorText: errorText,
            enabled: status.fieldEnabled && enabled,
            initialValue: initialValue,
            label: label,
            onChanged: onChanged,
            onClean: onClean,
            textValue: textValue,
          ),
        ),
        if (status.isLoadInProgress) const SmallCircularProgress(),
        if (status.isLoadFailure && onPressRetry != null)
          _RetryButton(
            onPressRetry: onPressRetry!,
          )
      ],
    );
  }
}

class SmallCircularProgress extends StatelessWidget {
  const SmallCircularProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: DimensConst.marginLittle),
      child: SizedBox(
          width: Selector._heightSelector,
          height: Selector._heightSelector,
          child: Padding(
            padding: EdgeInsets.all(DimensConst.marginLittle),
            child: CircularProgressIndicator(),
          )),
    );
  }
}

class _RetryButton extends StatelessWidget {
  final VoidCallback onPressRetry;

  const _RetryButton({Key? key, required this.onPressRetry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: DimensConst.marginLittle),
      child: SizedBox(
        width: Selector._heightSelector,
        height: Selector._heightSelector,
        child: InkWell(
          onTap: onPressRetry,
          borderRadius: BorderRadius.circular(Selector._heightSelector / 2),
          child: const Padding(
            padding: EdgeInsets.all(DimensConst.marginSmall),
            child: Icon(Icons.refresh),
          ),
        ),
      ),
    );
  }
}

class _DropdownWidget<T> extends StatelessWidget {
  final String? errorText;
  final String? label;
  final List<T> items;
  final T? initialValue;
  final bool enabled;
  final ChangedSelector<T?>? onChanged;
  final VoidCallback? onClean;
  final TextValue<T?> textValue;

  const _DropdownWidget({
    Key? key,
    this.errorText,
    this.label,
    List<T>? items,
    this.initialValue,
    this.enabled = true,
    required this.onChanged,
    this.onClean,
    required this.textValue,
  })  : items = items ?? const [],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final hint = textValue(initialValue);
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimens.space8),
      child: DropdownButtonFormField<T>(
        iconEnabledColor: Palette.accent,
        isDense: true,
        isExpanded: true,
        decoration: InputDecoration(
          labelText: label,
          errorText: errorText,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Palette.hint),
          suffixIconConstraints: BoxConstraints(
            minHeight: Dimens.space24,
            maxHeight: Dimens.space24,
          ),
          prefixIconConstraints: BoxConstraints(
            minHeight: Dimens.space24,
            maxHeight: Dimens.space24,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: Dimens.space12,
            horizontal: Dimens.space16,
          ),
          enabledBorder: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(Dimens.space4),
            borderSide: const BorderSide(color: Palette.hint),
          ),
          disabledBorder: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(Dimens.space4),
            borderSide: const BorderSide(color: Palette.disable),
          ),
          // errorStyle: Theme.of(context)
          //     .textTheme
          //     .labelSmall
          //     ?.copyWith(color: Palette.red),
          focusedErrorBorder: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(Dimens.space4),
            borderSide: const BorderSide(color: Palette.error),
          ),
          errorBorder: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(Dimens.space4),
            borderSide: const BorderSide(color: Palette.error),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(Dimens.space4),
            borderSide: const BorderSide(color: Palette.primary),
          ),
        ),
        style: Theme.of(context).textTheme.bodyMedium,
        disabledHint: hint != null ? Text(hint) : null,
        value: initialValue,
        // validator: (val) => Validator.select(val),
        onChanged: enabled ? onChanged : null,
        icon: buildIcon(),
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        items: enabled
            ? items.map<DropdownMenuItem<T>>((T value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Text(textValue(value) ?? '',
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                );
              }).toList()
            : [],
      ),
    );
  }

  Row buildIcon() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (onClean != null && initialValue != null)
          SizedBox(
              height: DimensConst.iconSizeNormal,
              width: DimensConst.iconSizeNormal,
              child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.close),
                  onPressed: onClean,
                  iconSize: DimensConst.iconSizeSmall)),
        const Icon(Icons.keyboard_arrow_down),
      ],
    );
  }
}
