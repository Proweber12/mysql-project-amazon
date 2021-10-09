drop database if exists amazon;
create database amazon;
use amazon;

drop table if exists users;
create table users (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(100) UNIQUE NOT NULL,
  phone BIGINT UNSIGNED UNIQUE NOT NULL,
  password_hash VARCHAR(85) NOT NULL,
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);


drop table if exists personal_data;
create table personal_data (
  id SERIAL,
  user_id BIGINT UNSIGNED NOT NULL UNIQUE,
  firstname VARCHAR(30) DEFAULT NULL,
  lastname VARCHAR(70) DEFAULT NULL,
  birthday DATE DEFAULT NULL,
  gender CHAR(20) DEFAULT NULL,
  
  INDEX firstname_lastname_idx(lastname, firstname)
  
);

ALTER TABLE personal_data ADD CONSTRAINT fk_user_id
    FOREIGN KEY (user_id) REFERENCES users(id);

drop table if exists categories;
create table categories (
  id SERIAL,
  name VARCHAR(255) NOT NULL
);

drop table if exists brands;
create table brands (
  id SERIAL,
  name VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  site VARCHAR(255) DEFAULT NULL
);

drop table if exists products;
create table products (
  id SERIAL,
  category_id BIGINT UNSIGNED NOT NULL,
  brand_id BIGINT UNSIGNED NOT NULL,
  name VARCHAR(255) NOT NULL,
  specifications TEXT NOT NULL,
  description TEXT NOT NULL,
  reviews TEXT DEFAULT NULL,
  price DECIMAL(2) UNSIGNED,
  
  foreign key (category_id) references categories(id),
  foreign key (brand_id) references brands(id),
  
  INDEX name_price_idx(name, price)
);

drop table if exists recomended_products;
create table recomended_products (
  id SERIAL,
  user_id BIGINT UNSIGNED NOT NULL,
  product_id BIGINT UNSIGNED NOT NULL,
  product_name VARCHAR(255) NOT NULL,
  
  foreign key (user_id) REFERENCES users(id),
  foreign key (product_id) references products(id),
  foreign key (product_name) references products(name)
);

drop table if exists favorites_types;
create table favorites_types (
  id SERIAL,
  name VARCHAR(255) NOT NULL
);

drop table if exists favorites;
create table favorites (
  id SERIAL,
  user_id BIGINT UNSIGNED NOT NULL,
  product_id BIGINT UNSIGNED NOT NULL,
  brand_id BIGINT UNSIGNED NOT NULL,
  favorites_types_id BIGINT UNSIGNED NOT NULL,
  added_to_favorites BOOLEAN,
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
    
  foreign key (user_id) REFERENCES users(id),
  foreign key (product_id) REFERENCES products(id),
  foreign key (brand_id) references brands(id),
  foreign key (favorites_types_id) REFERENCES favorites_types(id)
);

drop table if exists cart;
create table cart (
  id SERIAL,
  user_id BIGINT UNSIGNED NOT NULL,
  product_id BIGINT UNSIGNED NOT NULL,
  added_to_cart BOOLEAN,
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
    
  foreign key (user_id) REFERENCES users(id),
  foreign key (product_id) REFERENCES products(id)
);

drop table if exists making_orders;
create table making_orders (
  id SERIAL,
  user_id BIGINT UNSIGNED NOT NULL,
  firstname VARCHAR(30) NOT NULL,
  lastname VARCHAR(70) NOT NULL,
  phone BIGINT UNSIGNED NOT NULL,
  product_id BIGINT UNSIGNED NOT NULL,
  address TEXT,
  card_number_hash VARCHAR(85),
  cvc_cvv_hash VARCHAR(85),
  created_at DATETIME DEFAULT NOW(),
    
  foreign key (user_id) REFERENCES users(id),
  foreign key (product_id) REFERENCES products(id),
  foreign key (phone) REFERENCES users(phone)
);

drop table if exists promo_codes;
create table promo_codes (
  id SERIAL,
  promo TEXT(50) 
);

drop table if exists promo_codes_activated;
create table promo_codes_activated (
  id SERIAL,
  user_id BIGINT UNSIGNED NOT NULL,
  promo_id BIGINT UNSIGNED NOT NULL,
  activated BOOLEAN,
  when_activated DATETIME DEFAULT NOW(),
    
  foreign key (user_id) REFERENCES users(id),
  foreign key (promo_id) REFERENCES promo_codes(id),
  
  INDEX user_promo_idx(user_id, promo_id)
  
);
