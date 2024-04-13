import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/shared/utils/generate_material_color.dart';

import '../extensions/context_exts.dart';
import 'app_theme.dart';

class AppThemeData {
  const AppThemeData({
    required this.primaryBackgroundColor,
    required this.secondaryBackgroundColor,
    required this.primaryColor,
    required this.typography,
    this.colors = const AppColors(),
    this.iconColor = Colors.black,
    required this.secondaryColor,
    required this.primaryContainerColor,
    required this.errorColor,
    required this.dangerousColor,
    required this.disabledColor,
    required this.dividerColor,
    required this.borderColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.darkGreyIconColor,
    required this.greyTextColor,
    required this.successColor,
    required this.greyCircleColor,
    required this.darkGreyCircleColor,
    required this.greyContainerColor,
    required this.disableButtonColor,
    required this.tileColor,
    required this.unselectedColor,
    required this.boxShadow,
    this.spacing = const Spacing(),
    this.appBodyTheme = const AppBodyTheme(),
    this.brightness = Brightness.light,
    this.iconSize = const IconSize(),
    required this.segmentedTheme,
    required this.listTileTheme,
    required this.appBarTheme,
  });

  final AppBarTheme appBarTheme;
  final AppColors colors;
  final Color primaryBackgroundColor;
  final Color secondaryBackgroundColor;
  final Color primaryColor;
  final Color iconColor;
  final Spacing spacing;
  final IconSize iconSize;
  final Typography typography;
  final Color secondaryColor;
  final Color primaryContainerColor;
  final Color errorColor;
  final Color dangerousColor;
  final Color disabledColor;
  final Color dividerColor;
  final Color borderColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color darkGreyIconColor;
  final Color greyTextColor;
  final Color successColor;
  final Color greyCircleColor;
  final Color darkGreyCircleColor;
  final Color disableButtonColor;
  final Color tileColor;
  final Color unselectedColor;
  final BoxShadow boxShadow;
  final Brightness brightness;
  final Color greyContainerColor;
  final AppBodyTheme appBodyTheme;
  final SegmentedTheme segmentedTheme;
  final ListTileTheme listTileTheme;

  factory AppThemeData.light() {
    const spacing = Spacing();
    const primaryTextColor = Colors.black;
    const secondaryTextColor = Color(0xFF8E8E8E);
    return AppThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 1,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 16.0,
          color: primaryTextColor,
          fontWeight: FontWeight.w500,
          fontFamily: 'Jersey',
        ),
      ),
      primaryBackgroundColor: const Color(0xFFF7F7F7),
      secondaryBackgroundColor: Colors.white,
      primaryColor: const Color(0xFFFFBC00),
      iconColor: Colors.black,
      brightness: Brightness.light,
      typography: const Typography(
        titleTextColor: primaryTextColor,
        bodyTextColor: primaryTextColor,
        successTextColor: Color(0xff1BC200),
      ),
      unselectedColor: const Color(0xFF60584C),
      disableButtonColor: const Color(0xffBEBEBE),
      spacing: spacing,
      secondaryColor: const Color(0xFFFCE9B7),
      primaryContainerColor: Colors.white,
      dangerousColor: const Color(0xFFB42C2C),
      errorColor: const Color(0xffB42C2C),
      disabledColor: const Color(0xff8E8E8E),
      dividerColor: const Color(0xffE3E3E3),
      borderColor: const Color(0xFFE3E3E3),
      successColor: const Color(0xff1BC200),
      darkGreyIconColor: const Color(0xff4C5157),
      greyTextColor: const Color(0xff5B5B5B),
      greyCircleColor: const Color(0xff60584C),
      darkGreyCircleColor: const Color(0xff534F42),
      greyContainerColor: const Color(0xffEBEBEB),
      primaryTextColor: Colors.black,
      secondaryTextColor: const Color(0xFF8A8A8E),
      tileColor: const Color(0xFFF7F7F7),
      boxShadow: const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.1),
      ),
      segmentedTheme: const SegmentedTheme(
        selectedBackgroundColor: Colors.white,
        unselectedBackgroundColor: Color(0x36BEBEBE),
        selectedTextColor: Color(0xFFFFBC00),
        unselectedTextColor: Color(0xFF8E8E8E),
        minimumSize: Size.fromHeight(32.0),
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: 'Jersey',
          fontSize: 15.0,
        ),
      ),
      listTileTheme: ListTileTheme(
        threeLineCard: ListTileThemeData(
          contentPadding: EdgeInsets.symmetric(
            vertical: spacing.marginSmall,
            horizontal: spacing.marginMedium,
          ),
          horizontalTitleGap: spacing.marginMedium,
          tileColor: const Color(0xFFF7F7F7),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFFE3E3E3)),
            borderRadius: BorderRadius.circular(
              spacing.borderRadiusMedium,
            ),
          ),
          titleAlignment: ListTileTitleAlignment.bottom,
          titleTextStyle: const TextStyle(
            fontFamily: 'Jersey',
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
            color: primaryTextColor,
          ),
          subtitleTextStyle: const TextStyle(
            color: secondaryTextColor,
            fontFamily: 'Jersey',
            fontSize: 13.0,
          ),
        ),
      ),
    );
  }

  factory AppThemeData.dark() {
    const spacing = Spacing();
    const primaryTextColor = Colors.white;
    const secondaryTextColor = Color(0xFFBEBEBE); // Lightened for visibility
    return AppThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 1,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 16.0,
          color: primaryTextColor,
          fontWeight: FontWeight.w500,
          fontFamily: 'Jersey',
        ),
      ),
      primaryBackgroundColor: const Color(0xFF1A1A1A),
      secondaryBackgroundColor: const Color(0xFF2A2A2A),
      primaryColor: const Color(0xFFFFBC00),
      iconColor: Colors.white,
      typography: const Typography(
        titleTextColor: primaryTextColor,
        bodyTextColor: primaryTextColor,
        successTextColor: Color(0xff1BC200),
      ),
      unselectedColor: const Color(0xFF9C9C9C), // Lightened for visibility
      disableButtonColor: const Color(0xffBEBEBE),
      spacing: spacing,
      secondaryColor: const Color(0xFFFCE9B7),
      primaryContainerColor: const Color(0xFF2A2A2A),
      dangerousColor: const Color(0xFFB42C2C),
      errorColor: const Color(0xffB42C2C),
      disabledColor: const Color(0xffBEBEBE), // Lightened for visibility
      dividerColor: const Color(0xffE3E3E3),
      borderColor: const Color(0xFFE3E3E3),
      successColor: const Color(0xff1BC200),
      darkGreyIconColor: const Color(0xff9C9C9C), // Lightened for visibility
      greyTextColor: const Color(0xffBEBEBE), // Lightened for visibility
      greyCircleColor: const Color(0xff9C9C9C), // Lightened for visibility
      darkGreyCircleColor: const Color(0xff7C7C7C), // Lightened for visibility
      greyContainerColor: const Color(0xffEBEBEB),
      primaryTextColor: Colors.white,
      secondaryTextColor: const Color(0xFFBEBEBE), // Lightened for visibility
      tileColor: const Color(0xFF3A3A3A), // Darkened for visibility
      boxShadow: const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.1),
      ),
      segmentedTheme: const SegmentedTheme(
        selectedBackgroundColor: Colors.white,
        unselectedBackgroundColor: Color(0x36BEBEBE),
        selectedTextColor: Color(0xFFFFBC00),
        unselectedTextColor: Color(0xFFBEBEBE), // Lightened for visibility
        minimumSize: Size.fromHeight(32.0),
        textStyle: TextStyle(fontWeight: FontWeight.w500),
      ),
      listTileTheme: ListTileTheme(
        threeLineCard: ListTileThemeData(
          contentPadding: EdgeInsets.symmetric(
            vertical: spacing.marginSmall,
            horizontal: spacing.marginMedium,
          ),
          horizontalTitleGap: spacing.marginMedium,
          tileColor: const Color(0xFF3A3A3A), // Darkened for visibility
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFFE3E3E3)),
            borderRadius: BorderRadius.circular(
              spacing.borderRadiusMedium,
            ),
          ),
          titleAlignment: ListTileTitleAlignment.bottom,
          titleTextStyle: const TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
            color: primaryTextColor,
          ),
          subtitleTextStyle: const TextStyle(
            color: secondaryTextColor,
            fontSize: 13.0,
          ),
        ),
      ),
    );
  }

  factory AppThemeData.system(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return isDarkMode ? AppThemeData.dark() : AppThemeData.light();
  }

  ThemeData build(BuildContext context) {
    final textTheme = typography.build(context);
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Jersey',
      primaryColor: primaryColor,
      scaffoldBackgroundColor: primaryBackgroundColor,
      primarySwatch: generateMaterialColor(primaryColor),
      disabledColor: disabledColor,
      dividerColor: dividerColor,
      textTheme: textTheme,
      bottomSheetTheme: BottomSheetThemeData(
        clipBehavior: Clip.hardEdge,
        showDragHandle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(spacing.gutter),
          ),
        ),
        backgroundColor: primaryBackgroundColor,
        modalBarrierColor: Colors.black.withOpacity(0.6),
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spacing.borderRadiusMedium),
        ),
        backgroundColor: primaryBackgroundColor,
      ),
      appBarTheme: appBarTheme,
      cardTheme: CardTheme(
        color: secondaryBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spacing.borderRadiusMedium),
        ),
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.10),
      ),
      iconTheme: IconThemeData(color: iconColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shadowColor: const Color.fromRGBO(230, 172, 13, 0.2),
          padding: EdgeInsets.symmetric(
            vertical: spacing.buttonVertical,
            horizontal: spacing.buttonHorizontal,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(spacing.borderRadiusMedium),
          ),
          disabledBackgroundColor: disableButtonColor,
          disabledForegroundColor: Colors.black,
          textStyle: textTheme.labelLarge,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 1,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: spacing.buttonVertical),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: spacing.buttonVertical),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          side: BorderSide(width: 2, color: primaryColor),
          foregroundColor: typography.bodyTextColor,
          textStyle: textTheme.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          iconColor: primaryColor,
          padding: EdgeInsets.symmetric(
            vertical: spacing.buttonVertical,
            horizontal: spacing.buttonHorizontal,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(
          fontSize: 15.0,
          color: Color(0xFF5B5B5B),
          fontFamily: 'Jersey',
        ),
        iconColor: primaryTextColor,
        suffixIconColor: primaryTextColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: spacing.inputHorizontal,
          vertical: spacing.inputVertical,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: borderColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: disabledColor),
        ),
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spacing.borderRadiusMedium),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: spacing.marginExtraSmall,
          horizontal: spacing.marginSmall,
        ),
        titleTextStyle: context.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
        subtitleTextStyle: context.textTheme.bodySmall,
      ),
      expansionTileTheme: ExpansionTileThemeData(
        backgroundColor: primaryBackgroundColor,
        collapsedBackgroundColor: primaryBackgroundColor,
        expandedAlignment: Alignment.topLeft,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(spacing.borderRadiusMedium),
          ),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(spacing.borderRadiusMedium),
          ),
        ),
        iconColor: Colors.black,
        collapsedIconColor: Colors.black,
        textColor: primaryTextColor,
        collapsedTextColor: primaryTextColor,
        tilePadding: EdgeInsets.symmetric(
          horizontal: spacing.marginMedium,
        ),
        childrenPadding: EdgeInsets.symmetric(
          horizontal: spacing.marginMedium,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        overlayColor: MaterialStatePropertyAll(primaryColor),
        fillColor: MaterialStatePropertyAll(primaryColor),
        shape: const CircleBorder(),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith(
          (states) {
            return states.contains(MaterialState.selected)
                ? primaryColor
                : unselectedColor;
          },
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: generateMaterialColor(primaryColor),
        brightness: brightness,
      ).copyWith(
        primaryContainer: primaryContainerColor,
        secondary: secondaryColor,
        error: errorColor,
      ),
      cupertinoOverrideTheme: const CupertinoThemeData(
        applyThemeToAll: true,
      ),
      chipTheme: ChipThemeData(
        selectedColor: secondaryColor,
        secondarySelectedColor: secondaryColor,
        disabledColor: disableButtonColor,
        secondaryLabelStyle: context.textTheme.labelMedium?.copyWith(
          color: primaryColor,
        ),
        labelStyle: context.textTheme.labelMedium?.copyWith(
          color: greyTextColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class AppColors {
  const AppColors({
    this.brown = const Color(0xFF60584C),
    this.yellow = const Color(0xFFFFBC00),
    this.lightGrey = const Color(0xFFF7F7F7),
  });

  final Color brown;
  final Color yellow;
  final Color lightGrey;
}

class Spacing {
  const Spacing({
    this.gutter = 16.0,
    this.marginExtraSmall = 4.0,
    this.marginSmall = 8.0,
    this.marginMedium = 16.0,
    this.marginLarge = 24.0,
    this.margin2ExtraLarge = 48.0,
    this.marginExtraLarge = 32.0,
    this.borderRadiusMedium = 12.0,
    this.formSpacing = 24.0,
    this.buttonHorizontal = 24.0,
    this.buttonVertical = 16.0,
    this.inputHorizontal = 16.0,
    this.inputVertical = 16.0,
  });
  final double gutter;
  final double marginExtraSmall;
  final double marginSmall;
  final double marginMedium;
  final double formSpacing;
  final double marginLarge;
  final double margin2ExtraLarge;
  final double marginExtraLarge;
  final double borderRadiusMedium;
  final double buttonHorizontal;
  final double buttonVertical;
  final double inputHorizontal;
  final double inputVertical;
}

class IconSize {
  const IconSize({
    this.iconSizeExtraSmall = 9.0,
    this.iconBottomNavSize = 22.0,
    this.iconSizeSmall = 24.0,
    this.iconSizeMedium = 32.0,
    this.iconSizeLarge = 40.0,
    this.iconSizeExtraLarge = 48.0,
  });
  final double iconSizeExtraSmall;
  final double iconBottomNavSize;
  final double iconSizeSmall;
  final double iconSizeMedium;
  final double iconSizeLarge;
  final double iconSizeExtraLarge;
}

class Typography {
  const Typography({
    required this.titleTextColor,
    required this.bodyTextColor,
    required this.successTextColor,
  });
  final Color titleTextColor;
  final Color bodyTextColor;
  final Color successTextColor;

  TextTheme build(BuildContext context) {
    return TextTheme(
      titleLarge: const TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: 'Jersey',
      ),
      titleMedium: const TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: 'Jersey',
      ),
      bodyLarge: const TextStyle(
        fontSize: 17.0,
        fontFamily: 'Jersey',
      ),
      bodyMedium: const TextStyle(
        fontSize: 15.0,
        fontFamily: 'Jersey',
      ),
      bodySmall: const TextStyle(
        fontSize: 13.0,
        fontFamily: 'Jersey',
      ),
      labelLarge: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        fontFamily: 'Jersey',
      ),
      labelMedium: const TextStyle(
        fontFamily: 'Jersey',
      ),
      labelSmall: TextStyle(
        color: bodyTextColor,
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Jersey',
      ),
      headlineSmall: TextStyle(
        color: successTextColor,
        fontFamily: 'Jersey',
        fontWeight: FontWeight.bold,
        fontSize: 26.0,
      ),
    )..apply(
        bodyColor: bodyTextColor,
        displayColor: titleTextColor,
      );
  }
}

class AppBodyTheme {
  const AppBodyTheme({
    this.primaryCurvedColor = const Color(0xFF60584C),
    this.secondaryCurvedColor = const Color(0xFFE3E3E3),
  });
  final Color primaryCurvedColor;
  final Color secondaryCurvedColor;
}

class SegmentedTheme {
  const SegmentedTheme({
    required this.selectedBackgroundColor,
    required this.unselectedBackgroundColor,
    required this.selectedTextColor,
    required this.unselectedTextColor,
    required this.minimumSize,
    required this.textStyle,
  });
  final Color selectedBackgroundColor;
  final Color unselectedBackgroundColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final Size minimumSize;
  final TextStyle textStyle;
}

class ListTileTheme {
  const ListTileTheme({
    required this.threeLineCard,
  });
  final ListTileThemeData threeLineCard;
}
