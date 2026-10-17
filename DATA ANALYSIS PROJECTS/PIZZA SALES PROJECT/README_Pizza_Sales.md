# Pizza Sales Analysis --- Power BI Portfolio Project

## Project Overview

This project analyzes a cleaned pizza sales dataset covering 2015. It
explores sales value, order volume, product performance, category and
size mix, and patterns by month, weekday, and hour. The purpose is to
demonstrate how a sales dataset can be translated into operational
recommendations for menu management, staffing, and promotions.

## Dataset Scope

The supplied cleaned CSV contains: - **48,620** pizza line items -
**21,350** distinct orders - **49,574** pizzas sold - **365** calendar
days in 2015 - **817,860.05** in recorded sales value

The dataset does not specify a currency code, so this README does not
assign a currency symbol to the sales total.

## Business Questions

-   What are total sales, order count, pizza quantity, and average order
    value?
-   Which months and days contribute the most and least sales?
-   What are the strongest sales hours?
-   Which pizzas and categories contribute the most revenue?
-   Which pizza sizes account for the largest share of sales?
-   Which lower-revenue products should be reviewed using cost and
    customer feedback?
-   What additional data is needed to measure profitability and
    operational efficiency?

## Key Findings

-   **Total sales:** 817,860.05 recorded monetary units.
-   **Total orders:** 21,350.
-   **Pizzas sold:** 49,574.
-   **Average order value:** approximately 38.31.
-   **Best month:** July, with 72,557.90 in sales.
-   **Lowest month:** October, with 64,027.60 in sales.
-   **Strongest day:** Friday, accounting for approximately 16.64% of
    annual sales.
-   **Peak hour:** 12:00 noon, with 111,877.90 in recorded sales.
-   **Leading category:** Classic, contributing approximately 26.91% of
    sales.
-   **Largest size segment:** Large pizzas, contributing approximately
    45.89% of sales.
-   **Top revenue pizza:** The Thai Chicken Pizza, with 43,434.25 in
    sales.
-   **Lowest revenue pizza:** The Brie Carre Pizza, with approximately
    490 units recorded and the lowest revenue among the menu items in
    the analysis.

## Recommendations

1.  Plan staffing, preparation, and service capacity around Friday and
    the lunchtime peak.
2.  Protect availability and quality for top-selling pizzas, including
    Thai Chicken, Barbecue Chicken, California Chicken, and Classic
    Deluxe.
3.  Test targeted promotions during weaker periods such as October and
    on lower-sales days such as Sunday. Measure incremental results
    against a comparable baseline.
4.  Test size upgrades and bundles to improve average order value, while
    monitoring contribution margin.
5.  Review lower-revenue items using ingredient cost, preparation
    complexity, waste, and customer feedback before changing the menu.
6.  Add ingredient, labor, packaging, discount, and delivery costs to
    assess profitability.
7.  Validate menu availability for very low-volume sizes such as XL and
    XXL and confirm the actual opening hours represented in the data.

## Tools and Methods

-   **CSV / tabular analysis:** aggregation and comparison of sales and
    order records.
-   **Power BI (recommended reporting layer):** KPI cards, time-based
    trends, product and category comparisons, and operational
    dashboards.
-   **Business analysis:** sales mix, seasonality, order economics, and
    demand-based planning.

## Important Limitations

-   The dataset does not provide a currency code.
-   Sales data alone cannot determine profit or contribution margin.
-   The file does not include customer identifiers, delivery time,
    discounts, cancellation details, or waste records.
-   Recommendations should be evaluated through controlled pilots and
    margin analysis; observed patterns do not prove causation.

## Suggested Repository Structure

``` text
pizza-sales-analysis/
├── README.md
├── data/
│   └── Pizza_sales cleaned2.csv
├── powerbi/
│   └── pizza_sales.pbix
└── reports/
    └── Pizza_Sales_Executive_Insights_and_Recommendations.docx
```

## How to Use

1.  Open the cleaned CSV in Power BI Desktop or your preferred analysis
    tool.
2.  Confirm data types for dates, times, quantities, and sales values.
3.  Create measures for Total Sales, Total Orders, Total Pizzas Sold,
    Average Order Value, and sales growth.
4.  Build visuals for monthly sales, weekday/hour demand, category mix,
    pizza size, and top products.
5.  Compare recommendations against additional cost and operational data
    before deciding on promotions or menu changes.

## Portfolio Summary

This project demonstrates practical sales analysis by connecting product
and time-based performance to decisions about menu planning, staffing,
and promotions. The next step is to include cost and service data so the
analysis can move beyond sales performance into profitability and
operational efficiency.
