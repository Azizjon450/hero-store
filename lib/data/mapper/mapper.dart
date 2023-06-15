import '../../app/extensions.dart';
import '../responses/responses.dart';
import '../../domain/model.dart';

//to convert the response into a non nullable object ()model

const EMPTY = "";
const ZERO = 0;

extension CustomerResponceMapper on CustomerResponce? {
  Customer toDomain() {
    return Customer(
      this?.id?.orEmpty() ?? EMPTY,
      this?.name?.orEmpty() ?? EMPTY,
      this?.numofNotifications?.orZero() ?? ZERO,
    );
  }
}

extension ContactsResponceMapper on ContactsResponce? {
  Contacts toDomain() {
    return Contacts(
      this?.email?.orEmpty() ?? EMPTY,
      this?.phone?.orEmpty() ?? EMPTY,
      this?.link?.orEmpty() ?? EMPTY,
    );
  }
}

extension AuthenticationResponceMapper on AuthenticationResponce? {
  Authentication toDomain() {
    return Authentication(
      this!.customer!.toDomain(), this!.contacts!.toDomain(),
    );
  }
}
