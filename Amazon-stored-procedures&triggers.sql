-- С помощью хранимых процедур сделал удобный инструмент для добавления категорий в таблицу

DELIMITER //

drop procedure if exists add_values_categories//
CREATE PROCEDURE add_values_categories(name_1 char(90))
begin
	
  insert into categories(name) value (name_1);
 
END//

DELIMITER ;

call add_values_categories('Laptop');

-- С помощью триггеров сделал обработчик ошибок, который выводит сообщение о необходимости заполнения полей

DELIMITER //

drop trigger if exists сhecking_whether_fields_insert//
CREATE TRIGGER сhecking_whether_fields_insert BEFORE INSERT ON making_orders FOR EACH ROW
BEGIN
  IF NEW.firstname IS null and NEW.lastname IS null
    THEN SIGNAL sqlstate '45000' set message_text = "Имя и фамилия должни быть заполнены обязательно"; 
  end if;
END//

drop trigger if exists сhecking_whether_fields_update//
CREATE TRIGGER сhecking_whether_fields_update BEFORE update ON making_orders FOR EACH ROW
BEGIN
  IF NEW.firstname IS null and NEW.lastname IS null
    THEN SIGNAL sqlstate '45000' set message_text = "Имя и фамилия должни быть заполнены обязательно"; 
  end if;
END//