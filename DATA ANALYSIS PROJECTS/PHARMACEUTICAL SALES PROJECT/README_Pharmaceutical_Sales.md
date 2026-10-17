# Pharmaceutical Sales Analysis --- Power BI

## Project Overview

This project analyzes pharmaceutical sales data to identify revenue
trends, product-level changes, returns, distributor performance,
sales-team patterns, and geographic concentration. The goal is to turn
cleaned sales data into practical insights and recommendations that a
commercial or executive team can investigate.

The data-cleaning work was completed in SQL before the dataset was
brought into Power BI.

## Business Questions

-   How did net sales change over time, and when did the business
    experience significant declines?
-   Which products contributed most to the decline in sales between 2019
    and 2020?
-   How large are returns relative to sales, and which products have
    higher return rates?
-   Which distributors account for the greatest return value?
-   How do sales and returns vary across sales teams and
    representatives?
-   How concentrated are sales by country, channel, and product class?
-   Which unusual transactions should be validated before management
    draws conclusions?
-   What additional data is required to assess profitability?

## Key Findings

The following figures are based on the analysis previously prepared for
this project and should be reconciled against the final Power BI report
before publication.

-   **Net sales (2017--2020):** approximately 11.80B in the dataset's
    recorded monetary units.
-   **Sales decline:** net sales decreased from approximately 3.51B in
    2018 to 2.66B in 2020, a decline of about 24.2%.
-   **Product declines:** Ionclotide, Antaparin Varizyme, Amavirase, and
    Pentastrin together declined by approximately 172.3M from 2019 to
    2020.
-   **Returns:** recorded return value was approximately 146.48M across
    the four-year period, around 1.23% of gross sales under the analysis
    definition used.
-   **Distributor returns:** Koss accounted for approximately 52.2% of
    total return value and had a reported return rate of 2.42%, compared
    with 1.13% for Gerlach LLC.
-   **Geographic concentration:** Germany represented approximately
    94.23% of net sales, while Poland represented approximately 5.77%.
-   **Channel mix:** Pharmacy contributed approximately 52.70% of net
    sales and Hospital approximately 47.30%.
-   **Data limitation:** the dataset contains Price and Quantity but not
    cost data sufficient to calculate profit or margin.

> Monetary units are shown as recorded in the source analysis. Confirm
> the currency and reconcile these figures with the final Power BI
> measures before publishing.

## Recommendations

1.  Investigate the large 2019--2020 declines in Ionclotide, Antaparin
    Varizyme, Amavirase, and Pentastrin.
2.  Review return reasons and transaction records for products with
    unusually high return rates, including Dantolac Pazocor.
3.  Work with Koss to understand its comparatively high return value and
    return rate.
4.  Review return patterns by sales team and representative as a
    process-improvement exercise, not as proof of individual
    underperformance.
5.  Validate exceptional high-value transactions and distinguish bulk
    orders from recurring demand.
6.  Add product cost, discounts, and other relevant expenses before
    presenting profit or margin conclusions.
7.  Monitor Germany as the dominant market while assessing opportunities
    in Poland using demand, cost-to-serve, and customer data.

## Tools and Methods

-   **SQL:** data cleaning and preparation before Power BI.
-   **Power BI:** data modeling, measures, KPI reporting, trend
    analysis, and dashboard visuals.
-   **Business analysis:** product, distributor, sales-team, channel,
    geographic, and returns analysis.

## Important Limitations

-   The monetary currency must be confirmed from the source data.
-   Revenue and returns do not establish profitability; cost data is
    required.
-   High or low sales and returns identify areas for investigation, not
    necessarily the cause.
-   Validate figures against the final `.pbix` and source data before
    using them in a business decision.

## Suggested Repository Structure

``` text
pharmaceutical-sales-analysis/
├── README.md
├── data/
│   └── README.md              # Explain data provenance; avoid publishing restricted data
├── sql/
│   └── cleaning_queries.sql   # Add your actual SQL scripts
├── powerbi/
│   └── PHARMA.pbix
└── reports/
    └── Pharmaceutical_Sales_Executive_Insights.docx
```

## How to Use

1.  Open the Power BI `.pbix` file in Power BI Desktop.
2.  Review the data model, measures, and page-level filters.
3.  Check the dashboard values against the cleaned dataset and SQL
    logic.
4.  Use the executive insights as a starting point for further
    investigation.

## Portfolio Summary

This project demonstrates a workflow from SQL data cleaning to Power BI
reporting, with an emphasis on translating sales and returns data into
business questions, measurable findings, and management actions.
