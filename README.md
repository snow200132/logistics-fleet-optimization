# Logistics OTD & Fleet Cost Optimization

**Executive Summary**
Analyzed operational logistics trip logs across 337 fleet units (Flatbed and Bulk divisions) to evaluate fleet velocity, transit-in/transit-out (TI/TO) lead times, On-Time Delivery (OTD), and unit freight rates.

---

### Business Problem & Context
* **Challenge:** Extended transit-out durations exceeded target SLAs, causing driver idle times and increasing freight cost per ton.
* **Objective:** Identify operational bottlenecks across transit corridors, track Check-In/Check-Out (CICO) turnaround times, and optimize fleet allocation to achieve 100% OTD compliance.
* **Target Audience:** Head of Logistics, Operations Director, Fleet Managers.

---

### Key Business Insights & Impact
* **Freight Cost Reduction:** Reduced Flatbed unit freight cost by **17%** week-over-week (from ₦10,246 to ₦8,543 per ton) by improving transit velocity.
* **Transit Velocity Gains:** Slashed Transit-In (TI) duration by **61%** (11.5 hours → 4.5 hours) and Transit-Out (TO) duration by **37%** (53.8 hours → 33.7 hours).
* **Delivery Compliance:** Attained **100% OTD Ring 1** target compliance in Week 31 across all key dispatch corridors.

---

### Tech Stack & Analytical Methods
* **SQL (PostgreSQL):** Applied CTEs and window functions to compute weekly transit deltas and driver turnaround metrics.
* **Power BI:** Built executive tracking dashboards with automated KPI performance alerts.
* **Excel:** Executed scenario modeling for surplus asset reallocation.

---

### Strategic Recommendations
1. **Dock Turnaround Controls:** Institute a mandatory 2-hour CICO threshold at receiving docks to address turnaround spikes.
2. **Redundant Unit Reallocation:** Reallocate surplus or inactive fleet assets to high-demand Ring 1 transit corridors to sustain 100% OTD.
3. **Driver Performance Metrics:** Tie turnaround efficiency directly to weekly driver incentive structures.
