# Territory Works --- Sales, Product, Customer and Returns Analysis

## Project Overview

This project reviews a Power BI sales dashboard focused on executive
KPIs, product performance, customer segments, returns, subcategory
movement, and territory reporting. The objective is to identify
commercial signals, highlight potential areas for investigation, and
improve the reliability of the dashboard for executive use.

The analysis in this README is based on the supplied exported Power BI
PDF. Some report visuals are blank or show different totals under
different contexts, so the limitations are documented rather than
silently reconciled.

## Dashboard Scope

The report includes pages or visuals for: - Executive Dashboard - Orders
by Country / Territory Map - Product Detail and target comparisons -
Customer Detail and customer segmentation - Decomposition Tree / Key
Influencers - Subcategory measure comparison

The PDF appears to cover activity from 2020 to 2022. Verify the final
report's date filters and source model before publication.

## Business Questions

-   What are the headline revenue, profit, order, and returns metrics?
-   How are monthly revenue and orders changing?
-   Which products show high returns rates?
-   Which product types and subcategories have the strongest order
    activity?
-   What do the customer segments and top-customer visuals show?
-   Are product targets available and correctly calculated?
-   Can territory performance be compared reliably across countries?
-   Are the dashboard's measures and time comparisons clearly defined?

## Key Findings Visible in the Export

-   **Total revenue KPI:** \$24.8M.
-   **Total profit KPI:** \$10.3M.
-   **Total orders KPI:** 25.2K.
-   **Returns rate KPI:** 2.2%.
-   **Monthly revenue:** \$1.82M versus \$1.76M in the prior month, with
    a displayed increase of 3.48%.
-   **Monthly orders:** 2,146 versus 2,165 in the prior month, with a
    displayed decrease of 0.88%.
-   **Unique customers:** 17K.
-   **Most ordered product type:** Tires and Tubes.
-   **Most returned product type:** Shorts.
-   **Product returns rates:** Sport-100 Helmet, Red 3.33%; Sport-100
    Helmet, Blue 3.31%; Sport-100 Helmet, Black 2.68%; AWC Logo Cap
    1.11%.
-   **Top-product table:** Water Bottle - 30 oz. has 3,983 orders and
    \$39,501 revenue; Fender Set - Mountain shows \$86,272 revenue in
    the displayed table.

These values are transcribed from the exported report. The PDF does not
establish that every KPI shares the same filter context.

## Recommendations

1.  Reconcile headline monthly KPI cards with the subcategory table and
    clearly label each comparison period.
2.  Investigate returns for Shorts and the Sport-100 Helmet color
    variants using return reasons, product quality records, sizing
    information, and supplier batches.
3.  Protect availability for high-demand categories such as Tires and
    Tubes, and test relevant cross-sells while measuring margin.
4.  Explain the monthly revenue increase despite slightly lower order
    volume by comparing average order value, product mix, pricing, and
    large transactions.
5.  Repair the country map or provide a table fallback containing
    country/territory, revenue, profit, orders, returns rate, and target
    attainment.
6.  Fix blank product target visuals and validate the price-adjustment
    control.
7.  Clarify customer metrics and top-customer ranking periods/segments.
8.  Add explicit measure definitions, date ranges, and filter context to
    the dashboard.

## Dashboard Reliability Notes

-   The country map did not render in the PDF because Azure Maps
    requested sign-in, so country-level rankings cannot be confirmed
    from the export.
-   The selected product's target visuals display blank values.
-   The executive page reports 2,146 monthly orders versus 2,165 prior
    month, while another table shows broader totals of 25,164 versus
    23,018. These may reflect different contexts or measures and should
    be reconciled.
-   The monthly returns card shows 167 versus 169 while also displaying
    +1.18%. Check the definition, sign, and denominator of the change
    calculation.
-   The measure selector is set to Total Orders on the subcategory page;
    do not interpret those values as revenue.
-   Customer visuals show different scopes, including a 17K customer
    headline and a table with 1,264 orders and \$605,798 revenue.

## Tools and Methods

-   **Power BI:** executive KPI reporting, product detail, customer
    segmentation, time comparisons, and territory visualization.
-   **Business analysis:** product returns, subcategory movement,
    customer metrics, and KPI consistency checks.
-   **Report validation:** review of exported PDF visuals and displayed
    values.

## Important Limitations

-   Figures are based on the supplied PDF export, not a direct query of
    the underlying Power BI model.
-   Some visuals are blank or appear to have different filter contexts.
-   The country map does not provide visible territory values in the
    PDF.
-   The meaning of the profit measure and returns-rate denominator
    should be documented before using these KPIs for executive
    decisions.
-   No causal claims are made about why returns or sales changed.

## Suggested Repository Structure

``` text
territory-works-analysis/
├── README.md
├── powerbi/
│   └── Territory works.pbix
├── reports/
│   ├── Territory works.pdf
│   └── Territory_Works_Executive_Insights_and_Recommendations.docx
└── docs/
    └── data_dictionary.md
```

## How to Use

1.  Open the `.pbix` file in Power BI Desktop.
2.  Review relationships, measures, date tables, slicers, and visual
    interactions.
3.  Reconcile the monthly KPI cards with the subcategory table under the
    same filters.
4.  Repair the territory map and target visuals.
5.  Document the profit and returns-rate calculations.
6.  Validate every value against the underlying model before publishing
    the report.

## Portfolio Summary

This project demonstrates dashboard interpretation and business-focused
analysis across sales, products, customers, and returns. Its next
improvement priorities are measure reconciliation, territory visibility,
and transparent KPI definitions.
