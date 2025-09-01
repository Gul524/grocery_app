import 'package:get/get.dart';
import 'package:grocery_app/models/model.dart';
import 'package:grocery_app/services/firebase_service.dart';

class AdminService extends GetxService {
  late FirebaseService _instance;

  @override
  void onInit() {
    super.onInit();
    _instance = FirebaseService();
  }

  // ----------------- CATEGORY -----------------
  Future<List<String>> addCategories(List<Category> categories) async {
    try {
      return await _instance.addCategories(categories);
    } catch (e) {
      throw("AdminService Error: addCategories -> $e");
    }
  }

  Future<void> updateCategory(Category category) async {
    try {
      await _instance.updateCategory(category);
    } catch (e) {
      throw("AdminService Error: updateCategory -> $e");
    }
  }

  Future<void> deleteCategories(List<String> categoryIds) async {
    try {
      await _instance.deleteCategories(categoryIds);
    } catch (e) {
      throw("AdminService Error: deleteCategories -> $e");
    }
  }

  Future<List<Category>> getCategories() async {
    try {
      return await _instance.getCategories();
    } catch (e) {
      throw("AdminService Error: getCategories -> $e");
    }
  }

  // ----------------- PRODUCT -----------------
  Future<List<String>> addProducts(String categoryId, List<Product> products) async {
    try {
      return await _instance.addProducts(categoryId, products);
    } catch (e) {
      throw("AdminService Error: addProducts -> $e");
    }
  }

  Future<void> updateProduct(String categoryId, Product product) async {
    try {
      await _instance.updateProduct(categoryId, product);
    } catch (e) {
      throw("AdminService Error: updateProduct -> $e");
    }
  }

  Future<void> deleteProducts(String categoryId, List<String> productIds) async {
    try {
      await _instance.deleteProducts(categoryId, productIds);
    } catch (e) {
      throw("AdminService Error: deleteProducts -> $e");
    }
  }

  Future<List<Product>> getProducts(String categoryId) async {
    try {
      return await _instance.getProducts(categoryId);
    } catch (e) {
      throw("AdminService Error: getProducts -> $e");
    }
  }

  // ----------------- DISCOUNT -----------------
  Future<List<String>> addDiscounts(List<Discount> discounts) async {
    try {
      return await _instance.addDiscounts(discounts);
    } catch (e) {
      throw("AdminService Error: addDiscounts -> $e");
    }
  }

  Future<void> updateDiscount(Discount discount) async {
    try {
      await _instance.updateDiscount(discount);
    } catch (e) {
      throw("AdminService Error: updateDiscount -> $e");
    }
  }

  Future<void> deleteDiscounts(List<String> discountIds) async {
    try {
      await _instance.deleteDiscounts(discountIds);
    } catch (e) {
      throw("AdminService Error: deleteDiscounts -> $e");
    }
  }

  Future<List<Discount>> getDiscounts() async {
    try {
      return await _instance.getDiscounts();
    } catch (e) {
      throw("AdminService Error: getDiscounts -> $e");
    }
  }

  // ----------------- PAYMENT MODES -----------------
  Future<List<String>> addPaymentModes(List<PaymentMode> modes) async {
    try {
      return await _instance.addPaymentModes(modes);
    } catch (e) {
      throw("AdminService Error: addPaymentModes -> $e");
    }
  }

  Future<void> updatePaymentMode(PaymentMode mode) async {
    try {
      await _instance.updatePaymentMode(mode);
    } catch (e) {
      throw("AdminService Error: updatePaymentMode -> $e");
    }
  }

  Future<void> deletePaymentModes(List<String> modeIds) async {
    try {
      await _instance.deletePaymentModes(modeIds);
    } catch (e) {
      throw("AdminService Error: deletePaymentModes -> $e");
    }
  }

  Future<List<PaymentMode>> getPaymentModes() async {
    try {
      return await _instance.getPaymentModes();
    } catch (e) {
      throw("AdminService Error: getPaymentModes -> $e");
    }
  }

  // ----------------- ORDERS -----------------
  Future<String?> addOrder(Order order) async {
    try {
      return await _instance.addOrder(order);
    } catch (e) {
      throw("AdminService Error: addOrder -> $e");
    }
  }

  Future<List<Order>> getOrders({String? customerId}) async {
    try {
      return await _instance.getOrders(customerId: customerId);
    } catch (e) {
      throw("AdminService Error: getOrders -> $e");
    }
  }

  Future<void> updateOrderStatus(String orderId, String status) async {
    try {
      await _instance.updateOrderStatus(orderId, status);
    } catch (e) {
      throw("AdminService Error: updateOrderStatus -> $e");
    }
  }

  // ----------------- CUSTOMERS -----------------
  Future<String?> addCustomer(Customer customer) async {
    try {
      return await _instance.addCustomer(customer);
    } catch (e) {
      throw("AdminService Error: addCustomer -> $e");
    }
  }

  Future<Customer?> getCustomer(String customerId) async {
    try {
      return await _instance.getCustomer(customerId);
    } catch (e) {
      throw("AdminService Error: getCustomer -> $e");
    }
  }
}
