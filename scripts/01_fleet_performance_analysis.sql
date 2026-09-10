-- Fleet Velocity & Freight Cost Analysis Script
-- Author: Inioluwa Idowu

-- 1. Weekly Average Transit Metrics & Freight Cost per Ton Reduction (W30 vs W31)
WITH weekly_summary AS (
    SELECT 
        dispatch_week,
        truck_type,
        COUNT(trip_id) AS total_trips,
        ROUND(AVG(transit_in_hrs)::numeric, 2) AS avg_transit_in_hrs,
        ROUND(AVG(transit_out_hrs)::numeric, 2) AS avg_transit_out_hrs,
        ROUND(AVG(cico_hrs)::numeric, 2) AS avg_cico_hrs,
        ROUND(AVG(freight_cost_per_ton_ngn)::numeric, 2) AS avg_cost_per_ton
    FROM fleet_trip_logs
    GROUP BY dispatch_week, truck_type
)
SELECT 
    dispatch_week,
    truck_type,
    avg_transit_in_hrs,
    avg_transit_out_hrs,
    avg_cost_per_ton,
    LAG(avg_cost_per_ton) OVER (PARTITION BY truck_type ORDER BY dispatch_week) AS prev_week_cost,
    ROUND(
        ((avg_cost_per_ton - LAG(avg_cost_per_ton) OVER (PARTITION BY truck_type ORDER BY dispatch_week)) 
         / LAG(avg_cost_per_ton) OVER (PARTITION BY truck_type ORDER BY dispatch_week)) * 100, 2
    ) AS cost_reduction_pct
FROM weekly_summary;

-- 2. On-Time Delivery (OTD) Compliance Rate by Ring Zone
SELECT 
    ring_zone,
    dispatch_week,
    COUNT(trip_id) AS total_deliveries,
    SUM(CASE WHEN otd_status = 'On-Time' THEN 1 ELSE 0 END) AS on_time_deliveries,
    ROUND((SUM(CASE WHEN otd_status = 'On-Time' THEN 1 ELSE 0 END)::NUMERIC / COUNT(trip_id)) * 100, 2) AS otd_compliance_pct
FROM fleet_trip_logs
GROUP BY ring_zone, dispatch_week
ORDER BY ring_zone, dispatch_week;
