#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint(20) unsigned NOT NULL,
  `password_hash` varchar(85) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `email`, `phone`, `password_hash`, `created_at`, `updated_at`) VALUES ('11', 'mueller.isabelle@example.org', '2314279860', '5e2e066bc7996f02c1297d73ecfd5908bfa88867', '1980-02-07 03:58:09', '2015-11-07 17:34:43');
INSERT INTO `users` (`id`, `email`, `phone`, `password_hash`, `created_at`, `updated_at`) VALUES ('12', 'imani.bayer@example.com', '196', '488260ccf71b9905133c11ae9823f07494ce67d8', '1999-07-27 13:05:05', '1984-10-31 15:41:58');
INSERT INTO `users` (`id`, `email`, `phone`, `password_hash`, `created_at`, `updated_at`) VALUES ('13', 'pkrajcik@example.org', '0', '082e930f2b7a3f0f27d82e6a9ca1fe2adf3d5fbd', '1983-10-31 23:19:04', '1985-02-12 15:39:52');
INSERT INTO `users` (`id`, `email`, `phone`, `password_hash`, `created_at`, `updated_at`) VALUES ('15', 'vmante@example.org', '449534', '95f425b9c26c07f77860d6147a41917489a4c915', '1977-09-30 17:12:07', '2001-02-19 07:09:08');
INSERT INTO `users` (`id`, `email`, `phone`, `password_hash`, `created_at`, `updated_at`) VALUES ('16', 'mstark@example.net', '447918', 'ba6a4ee3393026fc8546fba6635c44b422af7b02', '1998-05-25 20:19:57', '2017-04-09 19:52:34');
INSERT INTO `users` (`id`, `email`, `phone`, `password_hash`, `created_at`, `updated_at`) VALUES ('17', 'katherine88@example.org', '1', 'b01cfb6e6187bc65a63a07399e0e77b13aa731fd', '1990-08-31 09:47:25', '2009-04-19 16:28:43');
INSERT INTO `users` (`id`, `email`, `phone`, `password_hash`, `created_at`, `updated_at`) VALUES ('18', 'jheller@example.net', '316268', '9b22dc6b1932f8329fbb67c01947c3f82bdf245c', '1990-02-25 17:07:02', '2008-11-19 04:05:48');
INSERT INTO `users` (`id`, `email`, `phone`, `password_hash`, `created_at`, `updated_at`) VALUES ('19', 'dweimann@example.org', '22', '2118e347ae2c90149835676b4b41b810c06e7d7b', '2012-11-14 02:12:02', '2018-12-05 09:26:00');



#
# TABLE STRUCTURE FOR: personal_data
#

DROP TABLE IF EXISTS `personal_data`;

CREATE TABLE `personal_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `firstname` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `firstname_lastname_idx` (`lastname`,`firstname`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `personal_data` (`id`, `user_id`, `firstname`, `lastname`, `birthday`, `gender`) VALUES ('11', '11', 'Caroline', 'Auer', '2002-07-01', 'male');
INSERT INTO `personal_data` (`id`, `user_id`, `firstname`, `lastname`, `birthday`, `gender`) VALUES ('12', '12', 'Cassandra', 'Wunsch', '1974-07-06', 'male');
INSERT INTO `personal_data` (`id`, `user_id`, `firstname`, `lastname`, `birthday`, `gender`) VALUES ('13', '13', 'Kylie', 'Gerlach', '1992-09-28', 'male');
INSERT INTO `personal_data` (`id`, `user_id`, `firstname`, `lastname`, `birthday`, `gender`) VALUES ('14', '15', 'Norma', 'Koepp', '1982-05-24', 'female');
INSERT INTO `personal_data` (`id`, `user_id`, `firstname`, `lastname`, `birthday`, `gender`) VALUES ('15', '16', 'Hildegard', 'Grant', '1970-05-29', 'male');
INSERT INTO `personal_data` (`id`, `user_id`, `firstname`, `lastname`, `birthday`, `gender`) VALUES ('16', '17', 'Noel', 'Farrell', '1987-02-14', 'female');
INSERT INTO `personal_data` (`id`, `user_id`, `firstname`, `lastname`, `birthday`, `gender`) VALUES ('17', '18', 'Kacey', 'Bernier', '1985-12-25', 'male');
INSERT INTO `personal_data` (`id`, `user_id`, `firstname`, `lastname`, `birthday`, `gender`) VALUES ('18', '19', 'Okey', 'Jenkins', '2006-08-07', 'male');


#
# TABLE STRUCTURE FOR: categories
#

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `categories` (`id`, `name`) VALUES ('1', 'dignissimos');
INSERT INTO `categories` (`id`, `name`) VALUES ('2', 'quia');
INSERT INTO `categories` (`id`, `name`) VALUES ('3', 'consequatur');
INSERT INTO `categories` (`id`, `name`) VALUES ('4', 'et');
INSERT INTO `categories` (`id`, `name`) VALUES ('5', 'doloremque');
INSERT INTO `categories` (`id`, `name`) VALUES ('6', 'numquam');
INSERT INTO `categories` (`id`, `name`) VALUES ('7', 'voluptatem');
INSERT INTO `categories` (`id`, `name`) VALUES ('8', 'quos');
INSERT INTO `categories` (`id`, `name`) VALUES ('9', 'assumenda');
INSERT INTO `categories` (`id`, `name`) VALUES ('10', 'eveniet');



#
# TABLE STRUCTURE FOR: brands
#

DROP TABLE IF EXISTS `brands`;

CREATE TABLE `brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `brands` (`id`, `name`, `country`, `site`) VALUES ('1', 'quibusdam', '21', 'Qui est enim amet est quia. Natus ab voluptatibus aut autem omnis velit est.');
INSERT INTO `brands` (`id`, `name`, `country`, `site`) VALUES ('2', 'quae', '3', 'Officiis laudantium omnis consequatur omnis omnis. Odio dignissimos atque atque repudiandae sunt et. Velit beatae voluptatem molestias dolores iste eveniet incidunt error.');
INSERT INTO `brands` (`id`, `name`, `country`, `site`) VALUES ('3', 'sequi', '7923622', 'Quam iusto temporibus aut et sapiente voluptatum. Fuga voluptas dolor omnis modi ea quas.');
INSERT INTO `brands` (`id`, `name`, `country`, `site`) VALUES ('4', 'ut', '358568792', 'Harum asperiores et laboriosam provident. Consequatur earum veritatis quos ipsum nulla. Minima dolor recusandae dignissimos. Et maiores recusandae aut at mollitia et.');
INSERT INTO `brands` (`id`, `name`, `country`, `site`) VALUES ('5', 'aperiam', '2', 'Et et perspiciatis et soluta eum odit fuga. Minus nemo quod laboriosam sunt sed iste. Omnis modi expedita expedita totam.');
INSERT INTO `brands` (`id`, `name`, `country`, `site`) VALUES ('6', 'velit', '31', 'Voluptatem dolores aspernatur maiores quas sed. Molestiae consequatur beatae et est ullam quos. Distinctio nihil quae omnis deleniti.');
INSERT INTO `brands` (`id`, `name`, `country`, `site`) VALUES ('7', 'nam', '', 'Nam dolore nostrum dolore nemo ipsam est. Ipsam omnis eos ab. Unde nam quam molestiae sed fugiat dignissimos velit.');
INSERT INTO `brands` (`id`, `name`, `country`, `site`) VALUES ('8', 'id', '92', 'Fugiat modi maiores totam officia eveniet. Eum in in qui dolorem facilis. Qui nam laborum nesciunt exercitationem. Blanditiis quis officia quidem quisquam earum molestias qui.');
INSERT INTO `brands` (`id`, `name`, `country`, `site`) VALUES ('9', 'laborum', '3007397', 'Dicta accusantium aut saepe. Nisi fugit veniam natus at quaerat hic qui. Veniam sit consequuntur dolor maiores eos. Nisi voluptates porro iusto quia et voluptatem.');
INSERT INTO `brands` (`id`, `name`, `country`, `site`) VALUES ('10', 'et', '731202586', 'Quia animi ut enim magni voluptas iure. Aut unde quia illo dolores enim in consequuntur magni. Repudiandae eligendi non sit et doloribus.');



#
# TABLE STRUCTURE FOR: products
#

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL,
  `brand_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specifications` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reviews` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(2,0) unsigned DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `category_id` (`category_id`),
  KEY `brand_id` (`brand_id`),
  KEY `name_price_idx` (`name`,`price`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `specifications`, `description`, `reviews`, `price`) VALUES ('1', '1', '1', 'laboriosam', 'Id dolores vitae fugit explicabo impedit quae. Qui molestiae illo possimus aspernatur placeat perferendis. Consequatur vel et impedit ea.', 'Aut neque magnam voluptatibus. Porro laboriosam nam iusto necessitatibus qui. Est eaque aliquam dolores similique laborum qui.', 'Iure expedita quo aspernatur eos molestiae provident non. Architecto voluptatem dolor autem expedita. Sed vitae et sit beatae dolorem earum autem. Velit vel consectetur voluptas.', '71');
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `specifications`, `description`, `reviews`, `price`) VALUES ('2', '2', '2', 'sequi', 'Consequatur et ea ut accusamus magnam. Nobis praesentium fugiat id recusandae.', 'Eius quo eius voluptatem veritatis. Architecto ut molestias natus quis doloremque ratione. Aliquam et laboriosam praesentium voluptatem dolorum mollitia.', 'Rem consequatur soluta ea voluptates et rem cumque. Quia eos possimus nihil et veniam recusandae. Voluptates saepe delectus fugit sunt. Excepturi nesciunt repudiandae eveniet labore fuga.', '99');
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `specifications`, `description`, `reviews`, `price`) VALUES ('3', '3', '3', 'tempore', 'Aut non ad nostrum explicabo. Sunt eos quisquam ea voluptatem dolores non cupiditate. Tempore cumque accusantium dicta ut consequuntur cum impedit.', 'Maiores quam quae magni amet iure voluptatem autem. Aspernatur et rerum unde sit illum. Natus eaque officiis quia accusamus magnam dolorem quis similique. Dolorum suscipit cupiditate nemo beatae ipsa.', 'Porro non maxime ut aspernatur. Ea eius est enim ullam cum eaque. Quasi dolor ullam voluptatum totam perspiciatis laudantium.', '99');
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `specifications`, `description`, `reviews`, `price`) VALUES ('4', '4', '4', 'cupiditate', 'Quaerat sequi esse rerum aliquam expedita explicabo suscipit. Dolores consequuntur et asperiores est. Molestias porro ab porro repellat. Temporibus cum aut cum sed et.', 'Molestiae libero voluptas voluptatum facere ullam corporis sunt. Officiis minima aut nam natus cupiditate.', 'Ut amet et quod rem. Illo culpa hic voluptates assumenda. At nihil magnam eligendi aut voluptatem.', '99');
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `specifications`, `description`, `reviews`, `price`) VALUES ('5', '5', '5', 'quis', 'Itaque et enim minus. Atque rerum deleniti blanditiis nobis occaecati. Nobis unde explicabo nisi neque iure non.', 'Quisquam porro aut cumque quia aut ipsam est. Distinctio quasi placeat dolores a. Illo ratione recusandae ut suscipit. Fugiat incidunt commodi sed illum.', 'Non molestias debitis nulla neque. Cum et aliquam iusto ea hic nesciunt eos. Rerum perferendis ut sint facere.', '0');
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `specifications`, `description`, `reviews`, `price`) VALUES ('6', '6', '6', 'corporis', 'Facere aspernatur fugit in dolorum non. Molestias libero natus odio temporibus cumque. Quia qui dicta maiores ducimus iure blanditiis ipsam adipisci.', 'Et possimus fugiat ut eos eos non commodi officia. Illum suscipit laborum suscipit debitis et tempora eum. Temporibus quae cum iste. Suscipit qui deleniti possimus repellat voluptatibus est.', 'Est autem consequuntur quod molestiae ducimus. At consectetur sint eos est ad soluta delectus. Corporis suscipit enim culpa molestiae.', '99');
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `specifications`, `description`, `reviews`, `price`) VALUES ('7', '7', '7', 'culpa', 'Laboriosam eligendi sit veniam error fugit distinctio perferendis. Hic voluptas necessitatibus blanditiis harum nulla voluptas magnam. Consequatur quas reprehenderit asperiores ipsam.', 'Autem aut provident est et perferendis. Placeat numquam eaque similique sunt quod unde possimus.', 'Sint est sapiente quod magni culpa suscipit fuga nemo. Ab quo nulla sit et minus molestiae modi atque. Eius recusandae optio placeat qui.', '99');
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `specifications`, `description`, `reviews`, `price`) VALUES ('8', '8', '8', 'ab', 'Molestias maiores nam beatae voluptatem. Consectetur nihil quaerat natus quidem dolores. Quis quis dolorem qui eos quia voluptatem.', 'Voluptates odit et officia ipsam. Quis ducimus ipsam atque eaque dicta aut veniam. Beatae nam officia sit optio impedit dolores possimus. Quo quod iusto soluta quae esse. Excepturi reprehenderit iure itaque ipsa animi rerum dolorem.', 'Impedit fugiat dolores dolore maiores enim ea. Omnis quos excepturi fugit omnis cumque voluptatem voluptas tenetur. Aut facilis natus temporibus.', '99');
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `specifications`, `description`, `reviews`, `price`) VALUES ('9', '9', '9', 'nostrum', 'Voluptates quo earum inventore suscipit placeat architecto. Soluta sed quis esse dicta omnis. Suscipit est exercitationem qui asperiores.', 'Recusandae quia cum tempore. Est asperiores excepturi quam libero sed. Neque pariatur labore excepturi modi est numquam necessitatibus. Occaecati accusantium consectetur sed magnam quo vitae.', 'Reprehenderit amet nemo quaerat commodi. Quibusdam excepturi dolorem repellendus accusantium vitae laborum. Porro fugiat vitae tenetur non quis. Sit ut et voluptatibus excepturi molestiae quae.', '99');
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `specifications`, `description`, `reviews`, `price`) VALUES ('10', '10', '10', 'et', 'Ut dolor tenetur veritatis nihil expedita enim iusto. Laboriosam ex dolor velit qui sed. Sit esse fugiat veniam tempore.', 'Voluptates quidem in enim nostrum. Quia ullam nam non. Id qui dolorem dolorum omnis sint numquam et odio.', 'Reprehenderit quo dolores molestiae et quia aut. Dolores explicabo magni non dicta. Dolores tempora sint omnis eum qui velit est voluptas.', '99');



#
# TABLE STRUCTURE FOR: recomended_products
#

DROP TABLE IF EXISTS `recomended_products`;

CREATE TABLE `recomended_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  KEY `product_name` (`product_name`),
  CONSTRAINT `recomended_products_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `recomended_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `recomended_products_ibfk_3` FOREIGN KEY (`product_name`) REFERENCES `products` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `recomended_products` (`id`, `user_id`, `product_id`, `product_name`) VALUES ('14', '15', '4', 'et');
INSERT INTO `recomended_products` (`id`, `user_id`, `product_id`, `product_name`) VALUES ('17', '18', '7', 'et');
INSERT INTO `recomended_products` (`id`, `user_id`, `product_id`, `product_name`) VALUES ('18', '19', '8', 'et');




#
# TABLE STRUCTURE FOR: favorites_types
#

DROP TABLE IF EXISTS `favorites_types`;

CREATE TABLE `favorites_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `favorites_types` (`id`, `name`) VALUES ('1', 'aut');
INSERT INTO `favorites_types` (`id`, `name`) VALUES ('2', 'molestiae');
INSERT INTO `favorites_types` (`id`, `name`) VALUES ('3', 'dolorem');
INSERT INTO `favorites_types` (`id`, `name`) VALUES ('4', 'unde');
INSERT INTO `favorites_types` (`id`, `name`) VALUES ('5', 'incidunt');
INSERT INTO `favorites_types` (`id`, `name`) VALUES ('6', 'sequi');
INSERT INTO `favorites_types` (`id`, `name`) VALUES ('7', 'est');
INSERT INTO `favorites_types` (`id`, `name`) VALUES ('8', 'est');
INSERT INTO `favorites_types` (`id`, `name`) VALUES ('9', 'nostrum');
INSERT INTO `favorites_types` (`id`, `name`) VALUES ('10', 'enim');



#
# TABLE STRUCTURE FOR: favorites
#

DROP TABLE IF EXISTS `favorites`;

CREATE TABLE `favorites` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `brand_id` bigint(20) unsigned NOT NULL,
  `favorites_types_id` bigint(20) unsigned NOT NULL,
  `added_to_favorites` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  KEY `brand_id` (`brand_id`),
  KEY `favorites_types_id` (`favorites_types_id`),
  CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `favorites_ibfk_3` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `favorites_ibfk_4` FOREIGN KEY (`favorites_types_id`) REFERENCES `favorites_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `favorites` (`id`, `user_id`, `product_id`, `brand_id`, `favorites_types_id`, `added_to_favorites`, `created_at`, `updated_at`) VALUES ('1', '11', '1', '1', '1', 0, '2019-11-23 10:25:10', '1999-08-29 17:20:26');
INSERT INTO `favorites` (`id`, `user_id`, `product_id`, `brand_id`, `favorites_types_id`, `added_to_favorites`, `created_at`, `updated_at`) VALUES ('2', '12', '2', '2', '2', 1, '2007-02-18 07:53:04', '2001-05-13 03:18:55');
INSERT INTO `favorites` (`id`, `user_id`, `product_id`, `brand_id`, `favorites_types_id`, `added_to_favorites`, `created_at`, `updated_at`) VALUES ('3', '13', '3', '3', '3', 0, '1996-05-19 15:27:23', '1989-10-04 15:08:49');
INSERT INTO `favorites` (`id`, `user_id`, `product_id`, `brand_id`, `favorites_types_id`, `added_to_favorites`, `created_at`, `updated_at`) VALUES ('4', '15', '4', '4', '4', 1, '2017-03-03 15:55:06', '1987-04-19 10:17:44');
INSERT INTO `favorites` (`id`, `user_id`, `product_id`, `brand_id`, `favorites_types_id`, `added_to_favorites`, `created_at`, `updated_at`) VALUES ('5', '16', '5', '5', '5', 1, '2015-08-07 05:57:12', '1974-11-02 11:06:03');
INSERT INTO `favorites` (`id`, `user_id`, `product_id`, `brand_id`, `favorites_types_id`, `added_to_favorites`, `created_at`, `updated_at`) VALUES ('6', '17', '6', '6', '6', 1, '2014-02-02 19:08:27', '1999-09-08 19:05:53');
INSERT INTO `favorites` (`id`, `user_id`, `product_id`, `brand_id`, `favorites_types_id`, `added_to_favorites`, `created_at`, `updated_at`) VALUES ('7', '18', '7', '7', '7', 0, '1997-02-19 04:20:51', '2014-01-15 20:34:15');
INSERT INTO `favorites` (`id`, `user_id`, `product_id`, `brand_id`, `favorites_types_id`, `added_to_favorites`, `created_at`, `updated_at`) VALUES ('8', '19', '8', '8', '8', 1, '2003-10-09 07:29:04', '2015-06-05 18:21:53');
INSERT INTO `favorites` (`id`, `user_id`, `product_id`, `brand_id`, `favorites_types_id`, `added_to_favorites`, `created_at`, `updated_at`) VALUES ('9', '11', '9', '9', '9', 1, '2019-01-20 04:56:13', '1975-03-04 00:54:07');
INSERT INTO `favorites` (`id`, `user_id`, `product_id`, `brand_id`, `favorites_types_id`, `added_to_favorites`, `created_at`, `updated_at`) VALUES ('10', '12', '10', '10', '10', 0, '2002-02-03 01:19:40', '2021-03-13 10:40:43');


#
# TABLE STRUCTURE FOR: cart
#

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `added_to_cart` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `added_to_cart`, `created_at`, `updated_at`) VALUES ('1', '11', '1', 1, '1990-02-28 19:33:14', '1998-07-27 03:55:23');
INSERT INTO `cart` (`id`, `user_id`, `product_id`, `added_to_cart`, `created_at`, `updated_at`) VALUES ('2', '12', '2', 0, '2005-05-10 22:47:15', '1994-12-20 18:51:56');
INSERT INTO `cart` (`id`, `user_id`, `product_id`, `added_to_cart`, `created_at`, `updated_at`) VALUES ('3', '13', '3', 1, '2018-12-19 23:21:47', '2004-01-17 13:01:28');
INSERT INTO `cart` (`id`, `user_id`, `product_id`, `added_to_cart`, `created_at`, `updated_at`) VALUES ('4', '15', '4', 0, '1984-10-16 15:08:59', '2006-10-08 16:11:19');
INSERT INTO `cart` (`id`, `user_id`, `product_id`, `added_to_cart`, `created_at`, `updated_at`) VALUES ('5', '16', '5', 0, '2021-01-19 00:39:20', '2014-04-11 04:13:41');
INSERT INTO `cart` (`id`, `user_id`, `product_id`, `added_to_cart`, `created_at`, `updated_at`) VALUES ('6', '17', '6', 0, '2010-08-18 02:16:37', '2019-06-23 17:03:51');
INSERT INTO `cart` (`id`, `user_id`, `product_id`, `added_to_cart`, `created_at`, `updated_at`) VALUES ('7', '18', '7', 1, '2000-07-23 00:39:03', '1999-12-31 14:26:48');
INSERT INTO `cart` (`id`, `user_id`, `product_id`, `added_to_cart`, `created_at`, `updated_at`) VALUES ('8', '19', '8', 0, '1975-03-10 09:31:04', '2016-06-28 08:54:38');
INSERT INTO `cart` (`id`, `user_id`, `product_id`, `added_to_cart`, `created_at`, `updated_at`) VALUES ('9', '11', '9', 1, '2021-04-18 21:38:02', '1991-05-11 09:11:01');
INSERT INTO `cart` (`id`, `user_id`, `product_id`, `added_to_cart`, `created_at`, `updated_at`) VALUES ('10', '12', '10', 0, '2008-02-29 06:55:41', '2013-11-09 04:52:31');



#
# TABLE STRUCTURE FOR: making_orders
#

DROP TABLE IF EXISTS `making_orders`;

CREATE TABLE `making_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `firstname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number_hash` varchar(85) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cvc_cvv_hash` varchar(85) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  KEY `phone` (`phone`),
  CONSTRAINT `making_orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `making_orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `making_orders_ibfk_3` FOREIGN KEY (`phone`) REFERENCES `users` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `making_orders` (`id`, `user_id`, `firstname`, `lastname`, `phone`, `product_id`, `address`, `card_number_hash`, `cvc_cvv_hash`, `created_at`) VALUES ('11', '11', 'Eliane', 'Wolf', '1', '1', '9364 Randall Estate Suite 042\nEast Cletusside, TX 81010-4191', '', '70dd6bb2286c2171d491fc667f79a90f5716b6be', '2007-12-28 22:25:14');
INSERT INTO `making_orders` (`id`, `user_id`, `firstname`, `lastname`, `phone`, `product_id`, `address`, `card_number_hash`, `cvc_cvv_hash`, `created_at`) VALUES ('12', '12', 'Horace', 'Stokes', '1', '2', '5756 Ebba Highway\nPort Eltaton, IL 58609', '82', '4b701ba59078084d3149d71e3fbb449b12135563', '2003-03-30 00:56:53');
INSERT INTO `making_orders` (`id`, `user_id`, `firstname`, `lastname`, `phone`, `product_id`, `address`, `card_number_hash`, `cvc_cvv_hash`, `created_at`) VALUES ('15', '16', 'Adrain', 'Shanahan', '1', '5', '991 Demarco Estate Apt. 243\nPercivalmouth, NY 76458', '663004351', '33118127a43da85302e7a53fb38451f851282172', '1980-07-23 13:36:38');
INSERT INTO `making_orders` (`id`, `user_id`, `firstname`, `lastname`, `phone`, `product_id`, `address`, `card_number_hash`, `cvc_cvv_hash`, `created_at`) VALUES ('18', '19', 'Shanie', 'Walsh', '1', '8', '7887 Duane Roads\nNorth Precious, FL 60266-6274', '15394935', 'ec2aa84cab995c94340d1bbc4b2e526a6898284a', '2004-11-14 18:14:22');
INSERT INTO `making_orders` (`id`, `user_id`, `firstname`, `lastname`, `phone`, `product_id`, `address`, `card_number_hash`, `cvc_cvv_hash`, `created_at`) VALUES ('20', '12', 'Felicita', 'Turcotte', '0', '10', '0297 Shields Island\nNorth Kellenmouth, MA 48333-9665', '87', '2dc69f030533a2e22724874a8cb2b63fd84b389b', '1987-10-30 13:02:09');


#
# TABLE STRUCTURE FOR: promo_codes
#

DROP TABLE IF EXISTS `promo_codes`;

CREATE TABLE `promo_codes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `promo` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `promo_codes` (`id`, `promo`) VALUES ('1', 'recusandae');
INSERT INTO `promo_codes` (`id`, `promo`) VALUES ('2', 'facere');
INSERT INTO `promo_codes` (`id`, `promo`) VALUES ('3', 'exercitationem');
INSERT INTO `promo_codes` (`id`, `promo`) VALUES ('4', 'Assumenda');
INSERT INTO `promo_codes` (`id`, `promo`) VALUES ('5', 'praesentium');
INSERT INTO `promo_codes` (`id`, `promo`) VALUES ('6', 'voluptatum');
INSERT INTO `promo_codes` (`id`, `promo`) VALUES ('7', 'nisi');
INSERT INTO `promo_codes` (`id`, `promo`) VALUES ('8', 'velit');
INSERT INTO `promo_codes` (`id`, `promo`) VALUES ('9', 'fugiat');
INSERT INTO `promo_codes` (`id`, `promo`) VALUES ('10', 'corrupti');


#
# TABLE STRUCTURE FOR: promo_codes_activated
#

DROP TABLE IF EXISTS `promo_codes_activated`;

CREATE TABLE `promo_codes_activated` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `promo_id` bigint(20) unsigned NOT NULL,
  `activated` tinyint(1) DEFAULT NULL,
  `when_activated` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `promo_id` (`promo_id`),
  KEY `user_promo_idx` (`user_id`,`promo_id`),
  CONSTRAINT `promo_codes_activated_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `promo_codes_activated_ibfk_2` FOREIGN KEY (`promo_id`) REFERENCES `promo_codes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `promo_codes_activated` (`id`, `user_id`, `promo_id`, `activated`, `when_activated`) VALUES ('1', '11', '1', 1, '2013-11-11 03:02:02');
INSERT INTO `promo_codes_activated` (`id`, `user_id`, `promo_id`, `activated`, `when_activated`) VALUES ('2', '12', '2', 0, '1981-02-10 12:22:30');
INSERT INTO `promo_codes_activated` (`id`, `user_id`, `promo_id`, `activated`, `when_activated`) VALUES ('3', '13', '3', 1, '1995-06-20 10:20:17');
INSERT INTO `promo_codes_activated` (`id`, `user_id`, `promo_id`, `activated`, `when_activated`) VALUES ('4', '15', '4', 1, '1978-01-31 05:15:02');
INSERT INTO `promo_codes_activated` (`id`, `user_id`, `promo_id`, `activated`, `when_activated`) VALUES ('5', '16', '5', 0, '1993-04-05 21:31:04');
INSERT INTO `promo_codes_activated` (`id`, `user_id`, `promo_id`, `activated`, `when_activated`) VALUES ('6', '17', '6', 1, '1991-05-18 11:37:55');
INSERT INTO `promo_codes_activated` (`id`, `user_id`, `promo_id`, `activated`, `when_activated`) VALUES ('7', '18', '7', 1, '2002-10-02 13:41:03');
INSERT INTO `promo_codes_activated` (`id`, `user_id`, `promo_id`, `activated`, `when_activated`) VALUES ('8', '19', '8', 1, '2001-09-18 05:47:54');
INSERT INTO `promo_codes_activated` (`id`, `user_id`, `promo_id`, `activated`, `when_activated`) VALUES ('9', '11', '9', 0, '2007-09-28 10:26:06');
INSERT INTO `promo_codes_activated` (`id`, `user_id`, `promo_id`, `activated`, `when_activated`) VALUES ('10', '12', '10', 1, '2016-06-16 11:23:34');



