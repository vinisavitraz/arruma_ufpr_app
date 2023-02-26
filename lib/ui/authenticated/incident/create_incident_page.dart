import 'dart:io';

import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/ui/authenticated/incident/create_incident_page_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_button.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_select_input.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_text_input.dart';
import 'package:arruma_ufpr_app/ui/widgets/divider_component.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_app_bar.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateIncidentPage extends GetView<CreateIncidentPageController> {

  const CreateIncidentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Novo incidente',
      ),
      backgroundColor: AppColors.white,
      body: Obx(() => controller.pageLoading.value ?
      Center(
        child: CircularProgressIndicator(),
      ) :
      GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        behavior: HitTestBehavior.translucent,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              // _labelDescription(),
              // _labelErrorMessage(),
              _inputIncidentType(),
              DividerComponent(),
              _inputLocation(),
              DividerComponent(),
              _inputItem(),
              DividerComponent(),
              _labelSection('Título'),
              _inputTitle(),
              _labelSection('Descrição'),
              _inputDescription(),
              _labelSection('Imagem'),
              _inputImage(),
              _buttonCreate(),
            ],
          ),
        ),
      )
      ),
    );
  }

  Widget _labelSection(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Text(text,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _inputIncidentType() {
    return Obx(() =>
      controller.showIncidentTypeForm.value ?
      Column(
        children: [
          _labelSection('Tipo do incidente'),
          _inputIncidentTypeName(),
          _inputIncidentTypeDescription(),
          _buttonShowSelect('incidentType', controller.showIncidentTypeForm, controller.incidentTypeIdField),
        ],
      ) :
      Column(
        children: [
          _labelSection('Tipo do incidente'),
          _selectIncidentType(),
          _buttonShowForm('incidentType', controller.showIncidentTypeForm, controller.incidentTypeIdField),
        ],
      ),
    );
  }

  Widget _inputLocation() {
    return Obx(() =>
      controller.showLocationForm.value ?
      Column(
        children: [
          _labelSection('Local do incidente'),
          _inputLocationName(),
          _inputLocationDescription(),
          _buttonShowSelect('location', controller.showLocationForm, controller.locationIdField),
        ],
      ) :
      Column(
        children: [
          _labelSection('Local do incidente'),
          _selectLocation(),
          _buttonShowForm('location', controller.showLocationForm, controller.locationIdField),
        ],
    ),);
  }

  Widget _inputItem() {
    return Obx(() =>
    controller.showItemForm.value ?
    Column(
      children: [
        _labelSection('Item do incidente'),
        _inputItemName(),
        _inputItemDescription(),
        _buttonShowSelect('item', controller.showItemForm, controller.itemIdField),
      ],
    ) :
    Column(
      children: [
        _labelSection('Item do incidente'),
        _selectItem(),
        _buttonShowForm('item', controller.showItemForm, controller.itemIdField),
      ],
    ),
    );
  }

  Widget _inputTitle() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textHint: 'Título',
      onChanged: controller.titleField.setValue,
      autoFocus: false,
      maxLines: 2,
      errorMessage: controller.titleField.errorMessage.value,
      inputEditController: controller.titleField.editController,
      keyboardType: TextInputType.name,
    ),);
  }

  Widget _inputDescription() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textHint: 'Descrição',
      onChanged: controller.descriptionField.setValue,
      autoFocus: false,
      maxLines: 10,
      errorMessage: controller.descriptionField.errorMessage.value,
      inputEditController: controller.descriptionField.editController,
      keyboardType: TextInputType.name,
    ),);
  }

  Widget _buttonShowSelect(String origin, RxBool showForm, MyTextField selectField) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: CustomButton(
        text: 'Procurar',
        onPressed: () => {
          controller.showForm(origin, showForm, false, selectField)
        },
      ),
    );
  }

  Widget _buttonShowForm(String origin, RxBool showForm, MyTextField selectField) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: CustomButton(
        text: 'Não encontrei',
        onPressed: () => {
          controller.showForm(origin, showForm, true, selectField)
        },
      ),
    );
  }

  Widget _buttonCreate() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: CustomButton(
        text: 'Criar',
        onPressed: controller.createIncident,
      ),
    );
  }

  Widget _selectIncidentType() {
    return CustomSelectInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textField: controller.incidentTypeIdField,
      textHint: 'Tipo do incidente',
      options: controller.incidentTypeOptions,
      onChanged: controller.incidentTypeIdField.setValue,
    );
  }

  Widget _inputIncidentTypeName() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textHint: 'Nome',
      onChanged: controller.incidentTypeNameField.setValue,
      autoFocus: false,
      errorMessage: controller.incidentTypeNameField.errorMessage.value,
      inputEditController: controller.incidentTypeNameField.editController,
      keyboardType: TextInputType.name,
    ),);
  }

  Widget _inputIncidentTypeDescription() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textHint: 'Descrição',
      onChanged: controller.incidentTypeDescriptionField.setValue,
      autoFocus: false,
      errorMessage: controller.incidentTypeDescriptionField.errorMessage.value,
      inputEditController: controller.incidentTypeDescriptionField.editController,
      keyboardType: TextInputType.name,
    ),);
  }

  Widget _selectLocation() {
    return CustomSelectInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textField: controller.locationIdField,
      textHint: 'Local do incidente',
      options: controller.locationOptions,
      onChanged: controller.handleNewLocationSelected,
    );
  }

  Widget _inputLocationName() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textHint: 'Nome',
      onChanged: controller.locationNameField.setValue,
      autoFocus: false,
      errorMessage: controller.locationNameField.errorMessage.value,
      inputEditController: controller.locationNameField.editController,
      keyboardType: TextInputType.name,
    ),);
  }

  Widget _inputLocationDescription() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textHint: 'Descrição',
      onChanged: controller.locationDescriptionField.setValue,
      autoFocus: false,
      errorMessage: controller.locationDescriptionField.errorMessage.value,
      inputEditController: controller.locationDescriptionField.editController,
      keyboardType: TextInputType.name,
    ),);
  }

  Widget _selectItem() {
    return CustomSelectInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textField: controller.itemIdField,
      textHint: 'Item do incidente',
      options: controller.itemOptions,
      onChanged: controller.itemIdField.setValue,
    );
  }

  Widget _inputItemName() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textHint: 'Nome',
      onChanged: controller.itemNameField.setValue,
      autoFocus: false,
      errorMessage: controller.itemNameField.errorMessage.value,
      inputEditController: controller.itemNameField.editController,
      keyboardType: TextInputType.name,
    ),);
  }

  Widget _inputItemDescription() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textHint: 'Descrição',
      onChanged: controller.itemDescriptionField.setValue,
      autoFocus: false,
      errorMessage: controller.itemDescriptionField.errorMessage.value,
      inputEditController: controller.itemDescriptionField.editController,
      keyboardType: TextInputType.name,
    ),);
  }

  Widget _inputImage() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: InkWell(
                  onTap: controller.chooseImageFromGallery,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryAccentColor,
                      border: Border.all(
                        width: 5,
                        color: AppColors.primaryAccentColor,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Text(
                      'Selecionar imagem',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: InkWell(
                  onTap: controller.captureNewImage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryAccentColor,
                      border: Border.all(
                        width: 5,
                        color: AppColors.primaryAccentColor,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Text(
                      'Capturar imagem',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),

              // InkWell(
              //   onTap: controller.chooseImageFromGallery,
              //   child: Text('Selecionar imagem',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       color: AppColors.primaryAccentColor,
              //     ),
              //   ),
              // ),
              // InkWell(
              //   onTap: controller.captureNewImage,
              //   child: Text('Capturar imagem',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       color: AppColors.primaryColor,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        Obx(() => Visibility(
          visible: controller.imagePath.value.isNotEmpty,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Image.file(File(controller.imagePath.value),),
          ),
        ),),
        
      ],
    );
  }

}