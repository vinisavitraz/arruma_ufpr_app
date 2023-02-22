class ExceptionMessageMapper {

  static final Map _errorMessages = {
    'USR_001': 'Usuário não encontrado',
    'USR_002': 'Nome inválido',
    'USR_003': 'Email inválido',
    'USR_009': 'Telefone inválido',
    'USR_010': 'Endereço inválido',
    'USR_011': 'Já existe uma conta vinculada a esse email',
    'USR_012': 'Já existe uma conta vinculada a esse documento',
    'USR_013': 'Email bloqueado. Contate a adminstração do sistema',
    'USR_014': 'Documento bloqueado. Contate a adminstração do sistema',
  };

  static String? mapByErrorCode(String errorCode) {
    return _errorMessages[errorCode];
  }

}