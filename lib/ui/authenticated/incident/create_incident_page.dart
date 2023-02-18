import 'package:arruma_ufpr_app/app/app_colors.dart';
import 'package:arruma_ufpr_app/ui/authenticated/incident/create_incident_page_controller.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_button.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_select_input.dart';
import 'package:arruma_ufpr_app/ui/widgets/custom_text_input.dart';
import 'package:arruma_ufpr_app/ui/widgets/divider_component.dart';
import 'package:arruma_ufpr_app/ui/widgets/my_app_bar.dart';
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
              _inputTitle(),
              _inputDescription(),
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
          _buttonShowList(controller.showIncidentTypeForm),
        ],
      ) :
      Column(
        children: [
          _labelSection('Tipo do incidente'),
          _selectIncidentType(),
          _buttonHideList(controller.showIncidentTypeForm),
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
          _buttonShowList(controller.showLocationForm),
        ],
      ) :
      Column(
        children: [
          _labelSection('Local do incidente'),
          _selectLocation(),
          _buttonHideList(controller.showLocationForm),
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
        _buttonShowList(controller.showItemForm),
      ],
    ) :
    Column(
      children: [
        _labelSection('Item do incidente'),
        _selectItem(),
        _buttonHideList(controller.showItemForm),
      ],
    ),
    );
  }

  Widget _inputTitle() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textHint: 'Título',
      onChanged: controller.title.setValue,
      autoFocus: false,
      maxLines: 2,
      errorMessage: controller.title.errorMessage.value,
      inputEditController: controller.title.editController,
      keyboardType: TextInputType.name,
    ),);
  }

  Widget _inputDescription() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textHint: 'Descrição',
      onChanged: controller.description.setValue,
      autoFocus: false,
      maxLines: 10,
      errorMessage: controller.description.errorMessage.value,
      inputEditController: controller.description.editController,
      keyboardType: TextInputType.name,
    ),);
  }

  Widget _buttonHideList(RxBool showForm) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: CustomButton(
        text: 'Não encontrei',
        onPressed: () => {
          controller.showForm(showForm, true)
        },
      ),
    );
  }

  Widget _buttonShowList(RxBool showForm) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: CustomButton(
        text: 'Procurar',
        onPressed: () => {
          controller.showForm(showForm, false)
        },
      ),
    );
  }

  Widget _buttonCreate() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: CustomButton(
        text: 'Criar',
        onPressed: () => {},
      ),
    );
  }

  Widget _selectIncidentType() {
    return CustomSelectInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textField: controller.incidentTypeId,
      textHint: 'Tipo do incidente',
      options: controller.incidentTypeOptions,
      onChanged: controller.incidentTypeId.setValue,
    );
  }

  Widget _inputIncidentTypeName() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textHint: 'Nome',
      onChanged: controller.title.setValue,
      autoFocus: false,
      errorMessage: controller.title.errorMessage.value,
      inputEditController: controller.title.editController,
      keyboardType: TextInputType.name,
    ),);
  }

  Widget _inputIncidentTypeDescription() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textHint: 'Descrição',
      onChanged: controller.title.setValue,
      autoFocus: false,
      errorMessage: controller.title.errorMessage.value,
      inputEditController: controller.title.editController,
      keyboardType: TextInputType.name,
    ),);
  }

  Widget _selectLocation() {
    return CustomSelectInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textField: controller.locationId,
      textHint: 'Local do incidente',
      options: controller.locationOptions,
      onChanged: controller.locationId.setValue,
    );
  }

  Widget _inputLocationName() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textHint: 'Nome',
      onChanged: controller.title.setValue,
      autoFocus: false,
      errorMessage: controller.title.errorMessage.value,
      inputEditController: controller.title.editController,
      keyboardType: TextInputType.name,
    ),);
  }

  Widget _inputLocationDescription() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textHint: 'Descrição',
      onChanged: controller.title.setValue,
      autoFocus: false,
      errorMessage: controller.title.errorMessage.value,
      inputEditController: controller.title.editController,
      keyboardType: TextInputType.name,
    ),);
  }

  Widget _selectItem() {
    return CustomSelectInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textField: controller.itemId,
      textHint: 'Item do incidente',
      options: controller.itemOptions,
      onChanged: controller.itemId.setValue,
    );
  }

  Widget _inputItemName() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textHint: 'Nome',
      onChanged: controller.title.setValue,
      autoFocus: false,
      errorMessage: controller.title.errorMessage.value,
      inputEditController: controller.title.editController,
      keyboardType: TextInputType.name,
    ),);
  }

  Widget _inputItemDescription() {
    return Obx(() => CustomTextInput(
      paddingInfo: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textHint: 'Descrição',
      onChanged: controller.title.setValue,
      autoFocus: false,
      errorMessage: controller.title.errorMessage.value,
      inputEditController: controller.title.editController,
      keyboardType: TextInputType.name,
    ),);
  }

}