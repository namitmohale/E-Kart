   SELECT ubr.CartProductID, ubr.total_rank ,i.author AS i_author,
   i.image_url AS i_image_url,i.item_id AS i_item_id,i.name AS i_name,
   i.price AS i_price
   
   SELECT *  FROM (
   
   SELECT similar.CartProductID AS item_id,SUM(orders_rank.rank) total_rank FROM (
   
   SELECT similar.cartuserid, COUNT(*)  rank
   FROM cart target
   
   JOIN cart similar ON target.CartProductID= similar.CartProductID AND target.CartUserID != similar.CartUserID
  
   WHERE target.CartUserID =1/* + session.getAttribute(UserID)*/
   GROUP BY similar.CartUserID) AS orders_rank JOIN cart similar ON orders_rank.CartUserID = similar.CartUserID
   LEFT JOIN cart target ON target.CartUserID = 1/* + session.getAttribute(UserID)*/  AND target.CartProductID = similar.CartProductID
   WHERE target.CartProductID IS NULL
   GROUP BY similar.CartProductID
   ORDER BY total_rank DESC
   
   LIMIT 10)
    AS ubr JOIN product i ON i.productid=ubr.productid
                                                         
                                                         
                                                         
                                                        