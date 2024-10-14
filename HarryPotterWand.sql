Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy 
each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of 
the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, 
sort the result in order of descending age.

SELECT W.ID, WP.AGE, W.COINS_NEEDED, W.POWER
FROM WANDS W, WANDS_PROPERTY WP,
     (SELECT AGE, MIN(COINS_NEEDED) MIN_COINS, WANDS.POWER PWR
      FROM WANDS, WANDS_PROPERTY
      WHERE WANDS.CODE = WANDS_PROPERTY.CODE AND IS_EVIL = 0
      GROUP BY POWER, AGE) IV
WHERE W.CODE = WP.CODE AND
      IV.AGE = WP.AGE AND
      W.COINS_NEEDED = IV.MIN_COINS AND
      W.POWER = IV.PWR
ORDER BY W.POWER DESC, WP.AGE DESC;
