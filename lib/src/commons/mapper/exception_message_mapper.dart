class ExceptionMessageMapper {

  static final Map _errorMessages = {
    'CEP_001': 'CEP não encontrado',
    'REG_001': 'Email já possui cadastro',
    'REG_002': 'Documento já possui cadastro',
    'AUTH_001': 'Código inválido',
    'AUTH_002': 'Código não foi criado corretamente',
    'AUTH_003': 'Senha incorreta',
    'AUTH_004': 'Senhas errada',
    'AUTH_005': 'Autenticação em 2 fatores já está ativa',
    'AUTH_009': 'Código não encontrado',
    'AUTH_010': 'Código inválido ',
    'USR_001': 'Email não encontrado',
    'USR_002': 'Usuário inativo',
    'CUS_001': 'Email já possui cadastro',
    'CUS_002': 'Conta bloqueada',
    'CUS_005': 'Somente maiores de 18 anos podem abrir a porta da geladeira',
    'CARD_001': 'Número de cartão inválido',
    'CARD_002': 'Nome do titular inválido',
    'CARD_003': 'Nome do titular pode ter no mínimo 3 caracteres',
    'CARD_004': 'Nome do titular pode ter no máximo 100 caracteres',
    'CARD_005': 'Código de segurança inválido',
    'CARD_006': 'Código de segurança pode ter no mínimo 3 dígitos',
    'CARD_007': 'Código de segurança pode ter no máximo 4 dígitos',
    'CARD_009': 'Mês de expiração precisa ter 2 dígitos',
    'CARD_010': 'Mês de expiração precisa ter 2 dígitos',
    'CARD_012': 'Ano de expiração precisa ter 4 dígitos',
    'CARD_013': 'Ano de expiração precisa ter 4 dígitos',
    'CARD_018': 'Número de cartão precisa ter 16 dígitos',
    'CARD_019': 'Número de cartão inválido',
    'CARD_020': 'Número de cartão já cadastrado',
    'CARD_021': 'Mês de expiração inválido',
    'CARD_022': 'Ano de expiração inválido',
    'CARD_022': 'Ano de expiração inválido',
    'DOOR_001': 'Porta não encontrada',
    'DOOR_004': 'Porta pertence a outra MIB Store',
    'PROD_002': 'Produto não encontrado',
  };

  static String? mapByErrorCode(String errorCode) {
    return _errorMessages[errorCode];
  }

}