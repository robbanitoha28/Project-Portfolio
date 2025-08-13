-- Saya menggabungkan data transaksi dari dua tahun, lalu memperkayanya dengan data biaya untuk secara langsung 
-- menghitung revenue dan profit, menghasilkan dataset yang siap untuk analisis profitabilitas.
with cte as (
select * from bike_share_yr_0
union all
select * from bike_share_yr_1)
select dteday, season, a.yr, weekday, hr, rider_type, riders, price, cogs,
 riders*price as revenue, riders*price -cogs*riders as profit 
from cte a
left join cost_table b
on a.yr = b.yr;