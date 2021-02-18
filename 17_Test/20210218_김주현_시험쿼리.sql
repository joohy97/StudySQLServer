USE bookrentalshop;
GO

-- 1-1
SELECT LOWER(email) AS email
	 , mobile
	 , names
	 , addr
  FROM membertbl
 ORDER BY names DESC;
GO


-- 1-2
SELECT names
	 , author
	 , releaseDate
	 , price
  FROM bookstbl
 ORDER BY idx;
GO


-- 2-1
SELECT TOP(10) CONCAT(RIGHT(names, 2), ', ', LEFT(names, 1)) AS '변경이름'
			 , levels
			 , LEFT(addr, 2) AS '도시'
			 , LOWER(email) AS '이메일'
  FROM membertbl
 ORDER BY names;
GO


-- 2-2
SELECT Idx
	 , CONCAT('제목 : ', Names) AS Names
	 , CONCAT('저자 > ', Author) AS Author
	 , FORMAT(ReleaseDate, 'yyyy년 MM월 dd일') AS '출판일'
	 , ISBN
	 , FORMAT(Price, '#,#원') AS '가격'
  FROM bookstbl
 ORDER BY idx DESC;
GO


-- 3-1
SELECT b.Idx AS '번호'
	 , b.Division AS '장르번호'
	 , div.Names AS '장르'
	 , b.Names AS '책제목'
	 , b.Author AS '저자'
  FROM bookstbl AS b
 INNER JOIN divtbl AS div
	on b.Division = div.Division
 WHERE b.Division = 'B002'
 ORDER BY idx;
GO


-- 3-2
SELECT m.Names
	 , m.Levels
	 , m.Addr
	 , r.rentalDate
  FROM membertbl AS m
 LEFT OUTER JOIN rentaltbl AS r
	ON m.Idx = r.memberIdx
 WHERE r.rentalDate is null
 ORDER BY m.idx;
GO


-- 4-1
INSERT INTO divtbl
           (Division
           ,Names)
     VALUES
           ('I002'
           ,'자기개발서');
--SELECT * FROM divtbl; --결과확인용
GO



--4-2
BEGIN TRAN

	UPDATE membertbl
	   SET Addr = '부산시 해운대구'
		  ,Mobile = '010-6683-7732'
	 WHERE names = '성명건';

	 --SELECT * FROM membertbl WHERE names = '성명건'; --결과확인용

--ROLLBACK;
COMMIT;
GO


-- 5
SELECT div.names
	 , SUM(b.price) AS '총합계금액'
  FROM bookstbl AS b
 INNER JOIN divtbl AS div
	on b.Division = div.Division
 GROUP BY ROLLUP(div.Names)
 --ORDER BY div.Names;
GO