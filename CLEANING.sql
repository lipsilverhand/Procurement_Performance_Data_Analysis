DROP TABLE IF EXISTS cleaned_procurement;

CREATE TABLE cleaned_procurement AS

WITH CTE_stage AS (
	SELECT 
		po.*,
		
		inv.current_stock,
		inv.reorder_level,
		inv.lead_time,
		
		ite.item_name,
		ite.item_category,
		ite.brand,
		ite.discontinued,
		
		sup.supplier_name,
		sup.country,
		sup.preferred,
		sup.rating,
		
		rat.rate
	
	FROM procurement_order AS po
	
	LEFT JOIN inventory AS inv
	ON po.item_id = inv.item_id
	
	LEFT JOIN items AS ite
	ON po.item_id = ite.item_id
	
	LEFT JOIN suppliers AS sup
	ON po.supplier_id = sup.supplier_id
	
	LEFT JOIN exchange_rate AS rat
	ON po.currency = rat.currency
),

CTE_duplicate AS (
	SELECT 
		*,
		ROW_NUMBER() OVER (
			PARTITION BY po_id, item_id, supplier_id
					  ORDER BY po_id NULLS LAST) as rn
	FROM CTE_stage
) 


SELECT *
FROM CTE_duplicate
WHERE rn = 1;


ALTER TABLE cleaned_procurement
DROP COLUMN rn;


