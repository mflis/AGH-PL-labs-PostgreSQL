-- baza danych: cukiernia
-- Przeanalizuj poniższe zapytania i zinterpretuj ich znaczenie. Zwróć uwagę na operatory w klauzuli where:

SELECT DISTINCT nazwa
FROM pudelka NATURAL JOIN zawartosc
WHERE idczekoladki
    IN (SELECT idczekoladki FROM czekoladki ORDER BY koszt LIMIT 3);

SELECT nazwa
FROM czekoladki
WHERE koszt = (SELECT MAX(koszt) FROM czekoladki);

-- Zwróć uwagę na umiejscowienie podzapytania, oraz ewentualną ilość wierszy/kolumn które zwraca.

SELECT p.nazwa, idpudelka
FROM (SELECT idczekoladki FROM czekoladki ORDER BY koszt LIMIT 3)
    AS ulubioneczekoladki
NATURAL JOIN zawartosc
NATURAL JOIN pudelka p;

SELECT nazwa, koszt, (SELECT MAX(koszt) FROM czekoladki) AS MAX FROM czekoladki;
