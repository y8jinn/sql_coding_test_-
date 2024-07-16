-- 코드를 작성해주세요

#1. 업그레이드 전 희귀도가 RARE면 됨 -3
#2. A테이블의 부모ID와 B테이블의 자식의 부모ID가 일치하면 됨 -2
#3. ITEM_ID가 일치하는 걸 기준으로 ITEM_INFO 가져오기 -1

SELECT II.ITEM_ID, II.ITEM_NAME, II.RARITY
FROM ITEM_INFO II 
JOIN ITEM_TREE IT ON II.ITEM_ID = IT.ITEM_ID
WHERE IT.PARENT_ITEM_ID IN (
SELECT ITEM_ID 
FROM ITEM_INFO 
WHERE RARITY = 'RARE')
ORDER BY II.ITEM_ID DESC;