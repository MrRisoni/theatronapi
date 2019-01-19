SELECT t.tht_id AS theaterId, p.per_id AS performanceId, p.per_duration AS duration, t.tht_name AS theaterName,  p.per_from_date AS fromDate, p.per_to_date AS toDate,
                      ply.ply_title AS playName , G.gen_title
                     FROM  performance p
                     JOIN people pl   ON  pl.ppl_id = per_director_id
                     JOIN theaters t ON T.tht_id = p.per_theater_id
                     JOIN plays ply ON ply.ply_id =  per_play_id
                     JOIN authors a ON a.aut_id = ply.ply_author_id
                     JOIN genres G ON G.gen_id = ply.ply_genre_id



                     WHERE  CURRENT_DATE >= p.per_from_date
                     AND  p.per_to_date >= CURRENT_DATE
GROUP BY p.per_id



SELECT smp_theater_id, COUNT(smp_id) AS totalSeats
FROM  seatmap
GROUP BY smp_theater_id







 SELECT prd_id, prd_date, IF ( orderItems.tickets IS NULL,0,orderItems.tickets) AS totalTickets
          FROM  performance_dates
          JOIN performance p ON (p.per_id = prd_performance_id AND p.per_season_id = prd_season_id)
          LEFT JOIN (
          SELECT  ord_performance_id ,ord_perf_date_id, COUNT(itm_id) AS tickets  FROM order_item
          JOIN orders ON itm_order_id = ord_id
          JOIN performance p ON (p.per_id = ord_performance_id AND p.per_season_id = ord_season_id)

          WHERE itm_void =0
          AND ord_void =0
          GROUP BY  ord_perf_date_id ) AS orderItems ON orderItems.ord_perf_date_id = prd_id
          ORDER BY prd_date ASC


