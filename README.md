# 📊 NordicFlow CRM — Product Analytics Case Study
> **From Business Problem to Actionable Insight:** An end-to-end product analytics pipeline built using **Python (Pandas)**, **MySQL (Gold Layer)**, and **Power BI**.

---

## 📌 Executive Summary

**NordicFlow CRM** is a Copenhagen-based, GDPR-first B2B SaaS company catering to small and mid-sized businesses (20–300 employees) across Europe[cite: 1]. While trial signups have steadily increased, NordicFlow faced critical analytics and business challenges[cite: 1]:
* **Inconsistent Activation:** Many accounts signed up but never reached real operational usage[cite: 1].
* **Activity vs. Value:** Surface-level engagement (e.g., logging in) was being confused with true product adoption (e.g., pipeline management and automation)[cite: 1].
* **Early Churn:** Churn emerged in smaller accounts struggling to realize quick value[cite: 1].
* **Data Discrepancies:** Teams pulled inconsistent metrics due to fragmented raw data[cite: 1].

This project built a governed **Bronze → Silver → Gold** data pipeline and interactive 3-page Power BI dashboard to unify product metrics and drive evidence-based strategy[cite: 1].

---

## 🛠️ Tech Stack & Architecture

| Technology | Role & Usage |
| :--- | :--- |
| **Python (Pandas, NumPy, SQLAlchemy)** | Profiled raw data, handled missing values, standardized string categories, parsed dates, and pushed cleaned datasets to the database[cite: 1]. |
| **SQL (MySQL)** | Engineered the data pipeline into fact/dimension models (Gold Layer) and calculated core KPIs (activation, churn, segmentation)[cite: 1]. |
| **Power BI (DAX)** | Built dynamic data visualizations across 3 executive pages with real-time KPI tracking and drill-downs[cite: 1]. |

---

## 📐 Project Scope & Key Metrics

* **116** Total Accounts Analyzed[cite: 1]
* **352** Active Users Tracked[cite: 1]
* **29.0%** Overall Activation Rate[cite: 1]
* **7.2%** Average Churn Rate[cite: 1]
* **4** Fact/Dimension Tables modeled[cite: 1]
* **3 Page** Power BI Report[cite: 1]

---

## ⚙️ Data Pipeline Implementation

### Step 1: Cleaning & Enrichment (Python)
1. **Profiling:** Checked data distributions, null values, and data types (`.describe()`, `.info()`)[cite: 1]. Dropped unrecoverable records[cite: 1].
2. **Standardization:** Stripped whitespace and unified raw text labels (e.g., standardizing channel strings)[cite: 1].
3. **Feature Engineering:** Calculated trial lengths, sales cycle durations, and recency metrics[cite: 1].
4. **Loading:** Exported clean frames into MySQL `silver_dim_*` and `silver_product_event` tables[cite: 1].

### Step 2: SQL Analytics & Gold Modeling
The Gold Layer standardizes metrics into actionable queries:
* **Account & User Baselines:** Calculated total active users and registered accounts[cite: 1].
* **Segmentation:** Analyzed volume and churn distribution by geography (Top markets: France, Sweden, Denmark) and industry (Technology Services, SaaS)[cite: 1].
* **Activation Drivers:** Filtered users with admin configurations and feature setups to evaluate conversion by acquisition channel[cite: 1].

### Step 3: Power BI Dashboard Breakdown
* **Page 1: Executive Overview** — High-level KPI summary, monthly trends, and market distributions[cite: 1].
* **Page 2: Product Usage & Adoption** — In-depth analysis of feature events (deals created, automations enabled, logging activity)[cite: 1].
* **Page 3: Activation & Time-to-Value** — Onboarding velocity tracking, time-to-value distributions, and industry activation rates[cite: 1].

---

## 🔍 Key Findings

1. **Activation Gaps Across Industries:** SaaS accounts convert best (highest activation rate), whereas Professional Services and B2B Agencies experience significantly lower activation[cite: 1].
2. **Channel Performance:** Sales-led and Content channels generate the highest volume of activated accounts, significantly outperforming Paid Search and self-serve Product-Led signups[cite: 1].
3. **Geographic Churn Risks:** France (15.4% churn) and Denmark (9.5% churn) exhibit high account volumes paired with disproportionately high churn rates[cite: 1].
4. **False Engagement Signals:** Surface activity like basic logins occurs frequently, but high-value actions (pipeline setup, deal progression, automation) are concentrated among fully activated accounts[cite: 1].

---

## 💡 Recommendations & Strategic Next Steps

* 🎯 **Tailor Industry Onboarding Playbooks:** Develop targeted onboarding paths for low-activation sectors (Professional Services, B2B Agencies) centered around their primary workflows[cite: 1].
* 💰 **Reallocate Growth Budget:** Prioritize Sales-led and Content acquisition channels, as they yield higher-quality, better-activating accounts compared to paid search[cite: 1].
* 🛡️ **Proactive Churn Prevention:** Deploy automated Customer Success interventions in France and Denmark when key activation milestones stall early in the subscription lifecycle[cite: 1].
* 📏 **Redefine Activation KPI:** Measure activation by pipeline configuration and automation adoption rather than simple login events[cite: 1].
* 🔄 **Pipeline Automation:** Automate the Silver-to-Gold SQL refresh pipeline and expand models to include historical cohort tracking over time[cite: 1].
