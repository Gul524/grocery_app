import 'package:get/get.dart';
import 'package:grocery_app/models/model.dart';
import 'package:grocery_app/services/firebase_service.dart';

class AdminService extends GetxService {
  // ----------------- CUSTOMERS BY PHONE -----------------
  Future<void> updateCustomerByPhone(
    String phone,
    Customer updatedCustomer,
  ) async {
    try {
      final customers = await _instance.getCustomersByPhone(phone);
      for (final customer in customers) {
        await _instance.updateCustomer(customer.id, updatedCustomer);
      }
    } catch (e) {
      throw ("AdminService Error: updateCustomerByPhone -> $e");
    }
  }

  Future<void> deleteCustomerByPhone(String phone) async {
    try {
      final customers = await _instance.getCustomersByPhone(phone);
      for (final customer in customers) {
        await _instance.deleteCustomer(customer.id);
      }
    } catch (e) {
      throw ("AdminService Error: deleteCustomerByPhone -> $e");
    }
  }

  // ----------------- ORDERS BY PHONE OR ID -----------------
  Future<void> updateOrderByPhone(String phone, Order updatedOrder) async {
    try {
      final orders = await _instance.getOrdersByPhone(phone);
      for (final order in orders) {
        await _instance.updateOrder(order.id, updatedOrder);
      }
    } catch (e) {
      throw ("AdminService Error: updateOrderByPhone -> $e");
    }
  }

  Future<void> deleteOrderByPhone(String phone) async {
    try {
      final orders = await _instance.getOrdersByPhone(phone);
      for (final order in orders) {
        await _instance.deleteOrder(order.id);
      }
    } catch (e) {
      throw ("AdminService Error: deleteOrderByPhone -> $e");
    }
  }

  Future<void> updateOrderById(String orderId, Order updatedOrder) async {
    try {
      await _instance.updateOrder(orderId, updatedOrder);
    } catch (e) {
      throw ("AdminService Error: updateOrderById -> $e");
    }
  }

  Future<void> deleteOrderById(String orderId) async {
    try {
      await _instance.deleteOrder(orderId);
    } catch (e) {
      throw ("AdminService Error: deleteOrderById -> $e");
    }
  }

  // ----------------- BRANCH -----------------
  Future<List<String>> addBranches(List<Branch> branches) async {
    try {
      return await _instance.addBranches(branches);
    } catch (e) {
      throw ("AdminService Error: addBranches -> $e");
    }
  }

  Future<void> updateBranch(Branch branch) async {
    try {
      await _instance.updateBranch(branch);
    } catch (e) {
      throw ("AdminService Error: updateBranch -> $e");
    }
  }

  Future<void> deleteBranches(List<String> branchIds) async {
    try {
      await _instance.deleteBranches(branchIds);
    } catch (e) {
      throw ("AdminService Error: deleteBranches -> $e");
    }
  }

  Future<List<Branch>> getBranches() async {
    try {
      return await _instance.getBranches();
    } catch (e) {
      throw ("AdminService Error: getBranches -> $e");
    }
  }

  // ----------------- RIDER -----------------
  Future<List<String>> addRiders(List<Rider> riders) async {
    try {
      return await _instance.addRiders(riders);
    } catch (e) {
      throw ("AdminService Error: addRiders -> $e");
    }
  }

  Future<void> updateRider(Rider rider) async {
    try {
      await _instance.updateRider(rider);
    } catch (e) {
      throw ("AdminService Error: updateRider -> $e");
    }
  }

  Future<void> deleteRiders(List<String> riderIds) async {
    try {
      await _instance.deleteRiders(riderIds);
    } catch (e) {
      throw ("AdminService Error: deleteRiders -> $e");
    }
  }

  Future<List<Rider>> getRiders() async {
    try {
      return await _instance.getRiders();
    } catch (e) {
      throw ("AdminService Error: getRiders -> $e");
    }
  }

  // ----------------- DEAL -----------------
  Future<List<String>> addDeals(List<Deal> deals) async {
    try {
      return await _instance.addDeals(deals);
    } catch (e) {
      throw ("AdminService Error: addDeals -> $e");
    }
  }

  Future<void> updateDeal(Deal deal) async {
    try {
      await _instance.updateDeal(deal);
    } catch (e) {
      throw ("AdminService Error: updateDeal -> $e");
    }
  }

  Future<void> deleteDeals(List<String> dealIds) async {
    try {
      await _instance.deleteDeals(dealIds);
    } catch (e) {
      throw ("AdminService Error: deleteDeals -> $e");
    }
  }

  Future<List<Deal>> getDeals() async {
    try {
      return await _instance.getDeals();
    } catch (e) {
      throw ("AdminService Error: getDeals -> $e");
    }
  }

  // ----------------- CUSTOMERS (ALL & BY PHONE) -----------------
  Future<List<Customer>> getAllCustomers() async {
    try {
      return await _instance.getAllCustomers();
    } catch (e) {
      throw ("AdminService Error: getAllCustomers -> $e");
    }
  }

  Future<List<Customer>> getCustomersByPhone(String phone) async {
    try {
      return await _instance.getCustomersByPhone(phone);
    } catch (e) {
      throw ("AdminService Error: getCustomersByPhone -> $e");
    }
  }

  // ----------------- ORDERS (ALL & BY PHONE) -----------------
  Future<List<Order>> getAllOrders() async {
    try {
      return await _instance.getAllOrders();
    } catch (e) {
      throw ("AdminService Error: getAllOrders -> $e");
    }
  }

  Future<List<Order>> getOrdersByPhone(String phone) async {
    try {
      return await _instance.getOrdersByPhone(phone);
    } catch (e) {
      throw ("AdminService Error: getOrdersByPhone -> $e");
    }
  }

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
      throw ("AdminService Error: addCategories -> $e");
    }
  }

  Future<void> updateCategory(Category category) async {
    try {
      await _instance.updateCategory(category);
    } catch (e) {
      throw ("AdminService Error: updateCategory -> $e");
    }
  }

  Future<void> deleteCategories(List<String> categoryIds) async {
    try {
      await _instance.deleteCategories(categoryIds);
    } catch (e) {
      throw ("AdminService Error: deleteCategories -> $e");
    }
  }

  Future<List<Category>> getCategories() async {
    try {
      return await _instance.getCategories();
    } catch (e) {
      throw ("AdminService Error: getCategories -> $e");
    }
  }

  // ----------------- PRODUCT -----------------
  Future<List<String>> addProducts(
    String categoryId,
    List<Product> products,
  ) async {
    try {
      return await _instance.addProducts(categoryId, products);
    } catch (e) {
      throw ("AdminService Error: addProducts -> $e");
    }
  }

  Future<void> updateProduct(String categoryId, Product product) async {
    try {
      await _instance.updateProduct(categoryId, product);
    } catch (e) {
      throw ("AdminService Error: updateProduct -> $e");
    }
  }

  Future<void> deleteProducts(
    String categoryId,
    List<String> productIds,
  ) async {
    try {
      await _instance.deleteProducts(categoryId, productIds);
    } catch (e) {
      throw ("AdminService Error: deleteProducts -> $e");
    }
  }

  Future<List<Product>> getProducts(String categoryId) async {
    try {
      return await _instance.getProducts(categoryId);
    } catch (e) {
      throw ("AdminService Error: getProducts -> $e");
    }
  }

  // ----------------- DISCOUNT -----------------
  Future<List<String>> addDiscounts(List<Discount> discounts) async {
    try {
      return await _instance.addDiscounts(discounts);
    } catch (e) {
      throw ("AdminService Error: addDiscounts -> $e");
    }
  }

  Future<void> updateDiscount(Discount discount) async {
    try {
      await _instance.updateDiscount(discount);
    } catch (e) {
      throw ("AdminService Error: updateDiscount -> $e");
    }
  }

  Future<void> deleteDiscounts(List<String> discountIds) async {
    try {
      await _instance.deleteDiscounts(discountIds);
    } catch (e) {
      throw ("AdminService Error: deleteDiscounts -> $e");
    }
  }

  Future<List<Discount>> getDiscounts() async {
    try {
      return await _instance.getDiscounts();
    } catch (e) {
      throw ("AdminService Error: getDiscounts -> $e");
    }
  }

  // ----------------- PAYMENT MODES -----------------
  Future<List<String>> addPaymentModes(List<PaymentMode> modes) async {
    try {
      return await _instance.addPaymentModes(modes);
    } catch (e) {
      throw ("AdminService Error: addPaymentModes -> $e");
    }
  }

  Future<void> updatePaymentMode(PaymentMode mode) async {
    try {
      await _instance.updatePaymentMode(mode);
    } catch (e) {
      throw ("AdminService Error: updatePaymentMode -> $e");
    }
  }

  Future<void> deletePaymentModes(List<String> modeIds) async {
    try {
      await _instance.deletePaymentModes(modeIds);
    } catch (e) {
      throw ("AdminService Error: deletePaymentModes -> $e");
    }
  }

  Future<List<PaymentMode>> getPaymentModes() async {
    try {
      return await _instance.getPaymentModes();
    } catch (e) {
      throw ("AdminService Error: getPaymentModes -> $e");
    }
  }

  // ----------------- ORDERS -----------------
  Future<String?> addOrder(Order order) async {
    try {
      return await _instance.addOrder(order);
    } catch (e) {
      throw ("AdminService Error: addOrder -> $e");
    }
  }

  Future<List<Order>> getOrders({String? customerId}) async {
    try {
      return await _instance.getOrders(customerId: customerId);
    } catch (e) {
      throw ("AdminService Error: getOrders -> $e");
    }
  }

  Future<void> updateOrderStatus(String orderId, String status) async {
    try {
      await _instance.updateOrderStatus(orderId, status);
    } catch (e) {
      throw ("AdminService Error: updateOrderStatus -> $e");
    }
  }

  // ----------------- CUSTOMERS -----------------
  Future<String?> addCustomer(Customer customer) async {
    try {
      return await _instance.addCustomer(customer);
    } catch (e) {
      throw ("AdminService Error: addCustomer -> $e");
    }
  }

  Future<Customer?> getCustomer(String customerId) async {
    try {
      return await _instance.getCustomer(customerId);
    } catch (e) {
      throw ("AdminService Error: getCustomer -> $e");
    }
  }
}
