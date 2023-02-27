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
      return AppColors.white;
    }

    if (status == 'fechado') {
      return AppColors.white;
    }

    return AppColors.primaryAccentColor;
  }

  static String mapPriorityName(int priority) {
    if (priority == 0) {
      return 'Prioridade baixa';
    }

    if (priority == 1) {
      return 'Prioridade média';
    }

    if (priority == 2) {
      return 'Prioridade alta';
    }

    return 'Desconhecido';
  }

  static Color mapPriorityColor(int priority) {
    if (priority == 0) {
      return Colors.green;
    }

    if (priority == 1) {
      return Colors.yellow;
    }

    if (priority == 2) {
      return AppColors.red;
    }

    return Colors.red;
  }

  static Color mapPriorityTextColor(int priority) {
    if (priority == 0) {
      return AppColors.white;
    }

    if (priority == 1) {
      return AppColors.primaryAccentColor;
    }

    if (priority == 2) {
      return AppColors.white;
    }

    return AppColors.primaryAccentColor;
  }

  static Color mapInteractionColor(int origin) {
    if (origin == 0) {
      return AppColors.primaryColor;
    }

    if (origin == 1) {
      return AppColors.primaryAccentLightColor;
    }

    if (origin == 2) {
      return AppColors.primaryAccentColor;
    }

    return AppColors.primaryAccentLightColor;
  }

  static Color mapInteractionTextColor(int origin) {
    if (origin == 0) {
      return AppColors.white;
    }

    if (origin == 1) {
      return AppColors.white;
    }

    if (origin == 2) {
      return AppColors.white;
    }

    return AppColors.primaryAccentColor;
  }

}