-- С помощью представлений создал таблицу с точными данными, вместо идентификаторов, отсортировал так, чтоб сверху были люди которые больше всего добавляли в избранное

drop view if exists displays_information_about_favorites_detail;
create view displays_information_about_favorites_detail as
select pd.firstname, pd.lastname, p.name as product_name, ft.name as types, f.added_to_favorites 
from personal_data pd
join favorites f 
join products p 
join favorites_types ft 
on pd.user_id = f.user_id and f.product_id = p.id and f.favorites_types_id = ft.id
order by 5 desc;

select * from displays_information_about_favorites_detail;

-- С помощью представлений создал таблицу с точными данными, вместо идентификаторов, отсортировал так, чтоб сверху были люди которые больше всего активировали промокодов

drop view if exists displays_information_about_promo_detail;
create view displays_information_about_promo_detail as
select pd.firstname, pd.lastname, pc.promo, pca.activated
from personal_data pd
join promo_codes pc
join promo_codes_activated pca
on pd.user_id = pca.user_id and pc.id = pca.promo_id
order by 4 desc;

select * from displays_information_about_promo_detail;