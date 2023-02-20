class ExceptionMessageMapper {

  static final Map _errorMessages = {
    'USR_002': 'Nome inválido',
    'USR_003': 'Email inválido',
    'USR_009': 'Telefone inválido',
    'USR_010': 'Endereço inválido',
  };

  static String? mapByErrorCode(String errorCode) {
    return _errorMessages[errorCode];
  }

}