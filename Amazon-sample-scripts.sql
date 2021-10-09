-- ����������� ��������� �� category_id, � ��������� ���������� �������� ������ �� ���������

SELECT category_id, COUNT(*) AS types
FROM products
GROUP BY 1;

-- ����������� �� ������, � ��������� ���������� ���������� ���, ������� �� ����� ����������

SELECT firstname, COUNT(*) AS types
FROM personal_data
GROUP BY 1
order by 2 desc;

-- ����������� ������ personal_data � cart, ��� ����, ����� ���������� ������ ������� ������������� ������ �� ���������������, � ����� ������������, ����� ������� ������������ ������ ����������� � �������, � ����� ��������

SELECT pd.firstname, pd.lastname, c.product_id, c.added_to_cart 
from personal_data pd 
join 
cart c 
on c.user_id = pd.user_id
order by 4 desc;

-- ��������� ������� products, brands � categories, ������� �������������� ���������� � ������� �� ��������, � ������������ �� ����

SELECT p.id, c.name as category, b.name as brands, p.name as product_name, p.specifications, p.description, p.reviews, p.price
from products p 
join brands b
JOIN categories c
on p.category_id = c.id and p.category_id = b.id
order by 1;

-- � ������� ��������� �������� ����� �������������� 3-� ������, ������� �������� � ������� ������ ����� �������

SELECT user_id, count(*)
FROM cart
where user_id in (select user_id from personal_data pd where gender = 'male') and added_to_cart = 1
group by 1
order by 2 desc
limit 3;

-- � ������� ��������� �������� ����� �������������� 10-�� �����, ������� ������ 30-�� ��� � �������� � ��������� ������ �����

SELECT user_id, count(*)
FROM favorites f 
where user_id in (select user_id from personal_data pd where TIMESTAMPDIFF(year, birthday, now()) < 30) and added_to_favorites = 1
group by 1
order by 2 desc
limit 10;


