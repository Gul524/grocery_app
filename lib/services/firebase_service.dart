import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:grocery_app/models/model.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  static final FirebaseService _instance = FirebaseService._internal();
  FirebaseService._internal();
  factory FirebaseService() => _instance;

  // Collection Names
  static const String grocery = "GroceryApp";
  static const String categories = "categories";
  static const String products = "products";
  static const String orders = "orders";
  static const String customers = "customers";
  static const String discounts = "discounts";
  static const String paymentModes = "payment_modes";

  // ------------------- CATEGORY -------------------
  Future<List<String>> addCategories(List<Category> categoryList) async {
    try {
    
      final batch = _db.batch();
      final ids = <String>[];

      for (final category in categoryList) {
        final docRef = _db.collection(grocery).doc(grocery).collection(categories).doc();
        batch.set(docRef, category.toJson());
        ids.add(docRef.id);
      }
      await batch.commit();
      return ids;
    } catch (e) {
      print("Error adding categories: $e");
      rethrow; // rethrow to handle in UI if needed
    }
  }

  Future<void> updateCategory(Category category) async {
    try {
      await _db.collection(grocery).doc(grocery).collection(categories).doc(category.id).update(category.toJson());
    } catch (e) {
      print("Error updating category ${category.id}: $e");
      rethrow;
    }
  }

  Future<List<Category>> getCategories() async {
    try {
      final snapshot = await _db.collection(grocery).doc(grocery).collection(categories).get();
      return snapshot.docs
          .map((e) => Category.fromJson(e.data()).copyWith(id: e.id))
          .toList();
    } catch (e) {
      print("Error fetching categories: $e");
      return [];
    }
  }

  Future<void> deleteCategories(List<String> ids) async {
    try {
      final batch = _db.batch();
      for (final id in ids) {
        batch.delete(_db.collection(grocery).doc(grocery).collection(categories).doc(id));
      }
      await batch.commit();
    } catch (e) {
      print("Error deleting categories: $e");
      rethrow;
    }
  }

  // ------------------- PRODUCT -------------------
  Future<List<String>> addProducts(String categoryId, List<Product> productList) async {
    try {
      final batch = _db.batch();
      final ids = <String>[];

      for (final product in productList) {
        final docRef = _db.collection(grocery).doc(grocery)
            .collection(categories)
            .doc(categoryId)
            .collection(products)
            .doc();
        batch.set(docRef, product.toJson());
        ids.add(docRef.id);
      }
      await batch.commit();
      return ids;
    } catch (e) {
      print("Error adding products: $e");
      rethrow;
    }
  }

  Future<void> updateProduct(String categoryId, Product product) async {
    try {
      await _db.collection(grocery).doc(grocery)
          .collection(categories)
          .doc(categoryId)
          .collection(products)
          .doc(product.id)
          .update(product.toJson());
    } catch (e) {
      print("Error updating product ${product.id}: $e");
      rethrow;
    }
  }

  Future<List<Product>> getProducts(String categoryId) async {
    try {
      final snapshot = await _db.collection(grocery).doc(grocery)
          .collection(categories)
          .doc(categoryId)
          .collection(products)
          .get();

      return snapshot.docs
          .map((e) => Product.fromJson(e.data()).copyWith(id: e.id))
          .toList();
    } catch (e) {
      print("Error fetching products: $e");
      return [];
    }
  }

  Future<void> deleteProducts(String categoryId, List<String> ids) async {
    try {
      final batch = _db.batch();
      for (final id in ids) {
        batch.delete(
          _db.collection(grocery).doc(grocery).collection(categories).doc(categoryId).collection(products).doc(id),
        );
      }
      await batch.commit();
    } catch (e) {
      print("Error deleting products: $e");
      rethrow;
    }
  }

  // ------------------- CUSTOMER -------------------
  Future<String?> addCustomer(Customer customer) async {
    try {
      final docRef = await _db.collection(grocery).doc(grocery).collection(customers).add(customer.toJson());
      return docRef.id;
    } catch (e) {
      print("Error adding customer: $e");
      return null;
    }
  }

  Future<Customer?> getCustomer(String id) async {
    try {
      final doc = await _db.collection(grocery).doc(grocery).collection(customers).doc(id).get();
      if (!doc.exists) return null;
      return Customer.fromJson(doc.data()!).copyWith(id: doc.id);
    } catch (e) {
      print("Error fetching customer $id: $e");
      return null;
    }
  }

  // ------------------- ORDER -------------------
  Future<String?> addOrder(Order order) async {
    try {
      final docRef = await _db.collection(grocery).doc(grocery).collection(orders).add(order.toJson());
      return docRef.id;
    } catch (e) {
      print("Error adding order: $e");
      return null;
    }
  }

  Future<List<Order>> getOrders({String? customerId}) async {
    try {
      Query query = _db.collection(grocery).doc(grocery).collection(orders);
      if (customerId != null) {
        query = query.where("customerId", isEqualTo: customerId);
      }
      final snapshot = await query.get();
      return snapshot.docs
          .map((e) => Order.fromJson(e.data() as Map<String, dynamic>).copyWith(id: e.id))
          .toList();
    } catch (e) {
      print("Error fetching orders: $e");
      return [];
    }
  }

  Future<void> updateOrderStatus(String orderId, String status) async {
    try {
      await _db.collection(grocery).doc(grocery).collection(orders).doc(orderId).update({"status": status});
    } catch (e) {
      print("Error updating order $orderId status: $e");
      rethrow;
    }
  }

  // ------------------- DISCOUNT -------------------
  Future<List<String>> addDiscounts(List<Discount> discountList) async {
    try {
      final batch = _db.batch();
      final ids = <String>[];
      for (final discount in discountList) {
        final docRef = _db.collection(grocery).doc(grocery).collection(discounts).doc();
        batch.set(docRef, discount.toJson());
        ids.add(docRef.id);
      }
      await batch.commit();
      return ids;
    } catch (e) {
      print("Error adding discounts: $e");
      rethrow;
    }
  }

  Future<void> updateDiscount(Discount discount) async {
    try {
      await _db.collection(grocery).doc(grocery).collection(discounts).doc(discount.id).update(discount.toJson());
    } catch (e) {
      print("Error updating discount ${discount.id}: $e");
      rethrow;
    }
  }

  Future<void> deleteDiscounts(List<String> discountIds) async {
    try {
      final batch = _db.batch();
      for (final id in discountIds) {
        batch.delete(_db.collection(grocery).doc(grocery).collection(discounts).doc(id));
      }
      await batch.commit();
    } catch (e) {
      print("Error deleting discounts: $e");
      rethrow;
    }
  }

  Future<List<Discount>> getDiscounts() async {
    try {
      final snapshot = await _db.collection(grocery).doc(grocery).collection(discounts).get();
      return snapshot.docs
          .map((e) => Discount.fromJson(e.data()).copyWith(id: e.id))
          .toList();
    } catch (e) {
      print("Error fetching discounts: $e");
      return [];
    }
  }

  // ------------------- PAYMENT MODES -------------------
  Future<List<String>> addPaymentModes(List<PaymentMode> modes) async {
    try {
      final batch = _db.batch();
      final ids = <String>[];
      for (final mode in modes) {
        final docRef = _db.collection(grocery).doc(grocery).collection(paymentModes).doc();
        batch.set(docRef, mode.toJson());
        ids.add(docRef.id);
      }
      await batch.commit();
      return ids;
    } catch (e) {
      print("Error adding payment modes: $e");
      rethrow;
    }
  }

  Future<void> updatePaymentMode(PaymentMode mode) async {
    try {
      await _db.collection(grocery).doc(grocery).collection(paymentModes).doc(mode.id).update(mode.toJson());
    } catch (e) {
      print("Error updating payment mode ${mode.id}: $e");
      rethrow;
    }
  }

  Future<void> deletePaymentModes(List<String> modeIds) async {
    try {
      final batch = _db.batch();
      for (final id in modeIds) {
        batch.delete(_db.collection(grocery).doc(grocery).collection(paymentModes).doc(id));
      }
      await batch.commit();
    } catch (e) {
      print("Error deleting payment modes: $e");
      rethrow;
    }
  }

  Future<List<PaymentMode>> getPaymentModes() async {
    try {
      final snapshot = await _db.collection(grocery).doc(grocery).collection(paymentModes).get();
      return snapshot.docs
          .map((e) => PaymentMode.fromJson(e.data()).copyWith(id: e.id))
          .toList();
    } catch (e) {
      print("Error fetching payment modes: $e");
      return [];
    }
  }
}
