-- 코드를 입력하세요
-- 1. BEST MEMBER를 먼저 꼽기

-- WITH BEST_MEMBER AS(
--    SELECT MEMBER_ID FROM REST_REVIEW 
--    GROUP BY MEMBER_ID ORDER BY COUNT(*) DESC 
 --   LIMIT 1 )

-- SELECT M.MEMBER_NAME, R.REVIEW_TEXT, DATE_FORMAT(R.REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
-- FROM MEMBER_PROFILE AS M JOIN REST_REVIEW AS R ON M.MEMBER_ID=R.MEMBER_ID
-- JOIN BEST_MEMBER AS B ON M.MEMBER_ID = B.MEMBER_ID
-- ORDER BY R.REVIEW_DATE ASC, R.REVIEW_TEXT ASC
-- ;

SELECT p.member_name 멤버명, r.review_text 리뷰, DATE_FORMAT(r.review_date, '%Y-%m-%d') 리뷰작성일
FROM member_profile p, rest_review r
WHERE p.member_id = r.member_id
      AND p.member_id = (SELECT r.member_id
                        FROM rest_review r
                        GROUP BY r.member_id
                        ORDER BY COUNT(*) DESC
                        LIMIT 1)
ORDER BY 리뷰작성일, 리뷰;