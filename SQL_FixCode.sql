ALTER TABLE table_name ADD COLUMN new_id INT;
SET @seq = 0;
UPDATE table_name SET new_id = (@seq := @seq + 1) ORDER BY id;
ALTER TABLE table_name DROP COLUMN id;
ALTER TABLE table_name MODIFY COLUMN new_id INT FIRST;
ALTER TABLE table_name CHANGE new_id id INT;
UPDATE table_name
SET salary = CASE
    WHEN GP = 0 THEN salary
    WHEN PTS / GP > 20 THEN 3000
    WHEN PTS / GP <= 20 AND salary = 3000 THEN 1000
    ELSE salary
END;
