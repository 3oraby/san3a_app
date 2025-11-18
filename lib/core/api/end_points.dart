class EndPoints {
  // Auth
  static const String refreshToken = "auth/refresh";
  static const String login = "auth/login";
  static const String signUp = "auth/signup";
  static const String logout = "auth/logout";
  static const String verifyEmail = "auth/verify-email";
  static const String resendVerifyOtp = "auth/resend-verification";
  static const String resetPassword = "auth/reset-password";
  static const String verifyResetCode = "auth/verify-reset-code";
  static const String forgetPassword = "auth/forget-password";

  // user
  static const String updateUserProfile = "users/me/profile";

  // brand
  static const String updateBrandProfile = "brands/me/profile";

  // Chats
  static String createChat({required String anotherContactId}) =>
      "chats/private/conversations/$anotherContactId";
  static const String getAllChats = "chats/private/conversations";
  static const String uploadChatImage = "chat/uploadChatImage";
  static String getChatMessages({required String chatId}) =>
      "chats/private/conversations/$chatId/messages";
  static String searchMessages({required String chatId}) =>
      "chats/private/conversations/$chatId";
  static String archiveChat({required String chatId}) =>
      "chats/private/conversations/$chatId/archive";
  static String unArchiveChat({required String chatId}) =>
      "chats/private/conversations/$chatId/unarchive";

  // Products
  static const String getAllProducts = "products";

  static String getProductById({required String id}) => "products/$id";

  static String getProductBySlug({required String slug}) =>
      "products/slug/$slug";

  static const String createProduct = "products";

  static const String searchProductsByText = "/search/text";

  static const String searchProductsByImage = "/search/image";

  // Cart
  static const String getCart = "carts";
  static const String clearCart = "carts";
  static String addToCart({required String itemId}) => "carts/items/$itemId";
  static String updateCartItem({required String itemId}) =>
      "carts/items/$itemId";
  static String removeCartItem({required String itemId}) =>
      "carts/items/$itemId";

  static const String checkoutPreview = "carts/checkout/preview";
}
