import '../../../../data/model/contacts_list_model.dart';

class AccountMoneyTransferState {


  List<ContactsListModel> contactsList = [];

  List allDataList  = [
    {
      'image':'ic_m_t_tag0',
      'name':'预约转账'
    },
    {
      'image':'ic_m_t_tag1',
      'name':'定活互转'
    },
    {
      'image':'ic_m_t_tag2',
      'name':'境外外汇汇款'
    },
    {
      'image':'ic_m_t_tag3',
      'name':'信用卡还款'
    },
    {
      'image':'ic_m_t_tag4',
      'name':'撤销转账'
    },
    {
      'image':'ic_m_t_tag5',
      'name':'消费贷款转存\n账户资金转出'
    },
    {
      'image':'ic_m_t_tag6',
      'name':'批量转账'
    },
    {
      'image':'ic_m_t_tag7',
      'name':'境内外币转账'
    },
    {
      'image':'ic_m_t_tag8',
      'name':'公益捐款'
    },
    {
      'image':'ic_m_t_tag9',
      'name':'向支付机构付款'
    }
  ];


  List dataList  = [
    {
      'image':'ic_m_t_tag0',
      'name':'预约转账'
    },
    {
      'image':'ic_m_t_tag1',
      'name':'定活互转'
    },
    {
      'image':'ic_m_t_tag2',
      'name':'境外外汇汇款'
    },
    {
      'image':'ic_m_t_tag3',
      'name':'他行转入'
    },
  ];



  List getData(bool more){
    if(more){
      return allDataList;
    }else {
      return dataList;
    }
  }

  AccountMoneyTransferState() {
    ///Initialize variables
  }
}
