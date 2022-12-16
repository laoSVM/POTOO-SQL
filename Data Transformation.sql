select 
  * 
from 
  (
    select 
      "Date", 
      "Top 100 Category", 
      "Top 100 Rank", 
      "ASIN", 
      "Product_NM", 
      "FBA_FLG", 
      round(
        avg("Base Price")
      ), 
      sum("Inventory"), 
      sum("Units Sold"), 
      sum("Amazon_Seller") "Is Amazon Seller", 
      sum("Inv_999") "Is Inventory 999", 
      sum("Limit_True") "Is Purchase Limit", 
      case when sum("Amazon_Seller") + sum("Inv_999") + sum("Limit_True") > 0 then 1 else 0 end as Problem_Row, 
      case when sum("Amazon_Seller") > 0 
      and sum("Inv_999") > 0 
      and sum("Limit_True") > 0 then 1 else 0 end as All_Problems_Row 
    from 
      (
        SELECT 
          "Date", 
          "Top 100 Category", 
          "Top 100 Rank", 
          "ASIN", 
          "Product_NM", 
          "Seller_ID", 
          "Seller_NM", 
          case when "Seller_NM" = "Amazon.com" then 1 else 0 end as Amazon_Seller, 
          "Base Price", 
          "Inventory", 
          "FBA_FLG", 
          case when "Inventory" = 999 then 1 else 0 end as Inv_999, 
          "Purchase Limit", 
          case when "Purchase Limit" = "TRUE" then 1 else 0 end as Limit_True, 
          "Units Sold" 
        FROM 
          Breath_Fresheners_FBA
      ) 
    group by 
      "Date", 
      "Top 100 Category", 
      "Top 100 Rank", 
      "ASIN", 
      "Product_NM" 
    having 
      "Problem_Row" = 0
  ) 
where 
  "sum(""Units Sold"")" != 0;
