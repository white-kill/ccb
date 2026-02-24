class Apis {

  static const login = '/auth/api/login';

  ///账单接口
  static const memberInfo = '/service/member/info';

  ///账单列表
  static const billPage = '/service/bill/page';
  ///账单列表
  static const billInfo = '/service/bill/info';

  ///账单列表
  static const accountView = '/service/member/accountView';

  ///银行列表
  static const bankList = '/service/bank/list';

  ///联系人列表
  static const contactsList = '/service/contacts/list';

  ///查询转账列表
  static const transferPage = '/service/bill/transferPage';

  ///查询转账详情
  static const transferInfo = '/service/bill/transferInfo';

  ///银行卡转账
  static const transfer = '/service/bill/transfer';

  ///申请记录查询
  static const applyPage = '/service/flowExport/applyPage';

  ///申请记录查询
  static const flowExport = '/service/flowExport/page';

  ///申请记录查询
  static const flowExportPrint = '/service/flowExport/print';

  ///核验电子印章接口
  static const checkPrint = '/service/member/checkPrint';

  ///根据卡号查询银行图标
  static const getCardBank = '/service/bank/getCardBank';

  static const memberUpdate = '/service/member/update';

  static const monthBill = '/service/bill/monthBill';

}