select 
  ft.transaction_id,
  ft.date,
  kc.branch_id,
  kc.branch_name,
  kc.kota,
  kc.provinsi,
  kc.rating as rating_cabang,
  ft.customer_name,
  ft.product_id,
  p.product_name,
  ft.price as actual_price,
  ft.discount_percentage,
  ft.rating as rating_transaksi,
  
  CASE
  WHEN ft.price <= 50000 THEN 0.10
  WHEN ft.price > 50000 AND ft.price <= 100000 THEN 0.15
  WHEN ft.price > 100000 AND ft.price <= 300000 THEN 0.20
  WHEN ft.price > 300000 AND ft.price <= 500000 THEN 0.25 
  ELSE 0.30
  END AS persentage_gross_laba,

  ft.price*(1-ft.discount_percentage) as nett_sales,

  (ft.price * (1 - ft.discount_percentage)) *
  CASE
  WHEN ft.price <= 50000 THEN 0.10 
  WHEN ft.price > 50000 AND ft.price <= 100000 THEN 0.15
  WHEN ft.price > 100000 AND ft.price <= 300000 THEN 0.20
  WHEN ft.price > 300000 AND ft.price <= 500000 THEN 0.25
  ELSE 0.30
  END AS nett_profit,

from kimia_farma.kf_final_transaction ft
left join kimia_farma.kf_product p
on ft.product_id = p.product_id

left join kimia_farma.kf_kantor_cabang kc
on ft.branch_id = kc.branch_id