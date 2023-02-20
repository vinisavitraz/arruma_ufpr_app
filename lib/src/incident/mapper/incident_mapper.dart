import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class IncidentMapper {

  static String mapStatusName(String status) {
    if (status == 'aberto') {
      return 'Aberto';
    }

    if (status == 'pendente') {
      return 'Em atendimento';
    }

    if (status == 'fechado') {
      return 'Finalizado';
    }

    return 'Desconhecido';
  }

  static Color mapStatusColor(String status) {
    if (status == 'aberto') {
      return Colors.yellow;
    }

    if (status == 'pendente') {
      return Colors.green;
    }

    if (status == 'fechado') {
      return AppColors.primaryColor;
    }

    return Colors.red;
  }

  static Color mapStatusTextColor(String status) {
    if (status == 'aberto') {
      return AppColors.primaryAccentColor;
    }

    if (status == 'pendente') {
      return AppColors.primaryAccentColor;
    }

    if (status == 'fechado') {
      return AppColors.white;
    }

    return Colors.white;
  }

}