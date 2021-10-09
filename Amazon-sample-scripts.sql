-- Группировка продуктов по category_id, с подсчётом количества продутов каждой из категорий

SELECT category_id, COUNT(*) AS types
FROM products
GROUP BY 1;

-- Группировка по именам, с подсчётом количества повторений имён, начиная от самых популярных

SELECT firstname, COUNT(*) AS types
FROM personal_data
GROUP BY 1
order by 2 desc;

-- Объединение таблиц personal_data и cart, для того, чтобы выводились именаи фамилии пользователей вместо их идентификаторов, а также отсортировал, чтобы вначале показывались товары добавленные в корзину, а потом удалённые

SELECT pd.firstname, pd.lastname, c.product_id, c.added_to_cart 
from personal_data pd 
join 
cart c 
on c.user_id = pd.user_id
order by 4 desc;

-- Объединил таблицы products, brands и categories, заменив идентификаторы катергорий и брендов на названия, и отсортировал по айди

SELECT p.id, c.name as category, b.name as brands, p.name as product_name, p.specifications, p.description, p.reviews, p.price
from products p 
join brands b
JOIN categories c
on p.category_id = c.id and p.category_id = b.id
order by 1;

-- С помощью вложенных запросов вывел идентификаторы 3-х мужчин, которые положили в корзину больше всего товаров

SELECT user_id, count(*)
FROM cart
where user_id in (select user_id from personal_data pd where gender = 'male') and added_to_cart = 1
group by 1
order by 2 desc
limit 3;

-- С помощью вложенных запросов вывел идентификаторы 10-ти людей, которые младше 30-ти лет и добавили в избранное больше всего

SELECT user_id, count(*)
FROM favorites f 
where user_id in (select user_id from personal_data pd where TIMESTAMPDIFF(year, birthday, now()) < 30) and added_to_favorites = 1
group by 1
order by 2 desc
limit 10;


