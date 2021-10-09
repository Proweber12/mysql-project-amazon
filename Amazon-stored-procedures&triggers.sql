-- � ������� �������� �������� ������ ������� ���������� ��� ���������� ��������� � �������

DELIMITER //

drop procedure if exists add_values_categories//
CREATE PROCEDURE add_values_categories(name_1 char(90))
begin
	
  insert into categories(name) value (name_1);
 
END//

DELIMITER ;

call add_values_categories('Laptop');

-- � ������� ��������� ������ ���������� ������, ������� ������� ��������� � ������������� ���������� �����

DELIMITER //

drop trigger if exists �hecking_whether_fields_insert//
CREATE TRIGGER �hecking_whether_fields_insert BEFORE INSERT ON making_orders FOR EACH ROW
BEGIN
  IF NEW.firstname IS null and NEW.lastname IS null
    THEN SIGNAL sqlstate '45000' set message_text = "��� � ������� ������ ���� ��������� �����������"; 
  end if;
END//

drop trigger if exists �hecking_whether_fields_update//
CREATE TRIGGER �hecking_whether_fields_update BEFORE update ON making_orders FOR EACH ROW
BEGIN
  IF NEW.firstname IS null and NEW.lastname IS null
    THEN SIGNAL sqlstate '45000' set message_text = "��� � ������� ������ ���� ��������� �����������"; 
  end if;
END//