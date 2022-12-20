# Introduction

We focused on improving inventory visibility for the company. The company had lost visibility on inventory in three specific conditions.

To do this, we first filtered and cleaned the data using a data quality table as guidance. We then used SQL queries to extract the relevant information from the data. Finally, we built a data dashboard to display the information in an easily digestible format.

[SQL Code](Data Transformation.sql)

# Data Quality Table

|                                                                                                              |Breath Fresheners|Dog Food|Manual Toothbrushes|Dry Dog Food|Wet Dog Food|Mouthwashes|
|--------------------------------------------------------------------------------------------------------------------|-----------------|--------|-------------------|------------|------------|-----------|
|1.How many ASINs are in the Breath Fresheners category?                                                             |191              |265     |193                |250         |245         |199        |
|2.Aggregate the data by Date and ASIN. How many Date & ASIN instances are  there?                                   |5068             |2694    |5055               |3087        |3351        |5002       |
|3.For each Date & ASIN combination, how many have Amazon as a seller?                                               |920              |1891    |1438               |2108        |2169        |2558       |
|4.For each Date & ASIN combination, how many have Inventory = 999?                                                  |551              |1345    |1285               |1732        |987         |857        |
|5.For each Date & ASIN combination, how many have Purchase Limit = True?                                            |292              |127     |637                |204         |35          |481        |
|6.For each Date & ASIN combination, how many have all three issues listed above?                                    |31               |42      |25                 |76          |4           |16         |
|7.For each Date & ASIN combination, how many don’t have the issues listed above?                                    |3733             |460     |2212               |528         |993         |1778       |
|8.For each Date & ASIN combination that doesn’t have the issues listed above, how many have a total of 0 units sold?|1166             |315     |882                |345         |606         |885        |
|9.How Many Date & ASIN Combination that don't have issues listed above and have more than 0 units sold?             |2567             |145     |1330               |183         |387         |893        |
|10.Are there any ASINs in the dataset that Amazon doesn’t sell?                                                     |147              |184     |120                |16          |33          |78         |
|11.Are there any ASINs in the dataset that never have Inventory = 999?                                              |150              |115     |119                |83          |125         |131        |
|12.Are there any ASINs in the dataset that never have Purchase Limit = True?                                        |183              |255     |176                |234         |240         |184        |
|13.Are there any ASINs in the dataset that don't have any issues listed above?                                      |125              |22      |74                 |15          |20          |54         |
|14.Are there any ASINs in the dataset that don't have any issues listed above and units sold = 0?                   |121              |22      |70                 |15          |0           |134        |
|15.Percentage of clean ASINs out of total unique ASINs. (3 constraints)                                             |65%              |8%      |38%                |6%          |8%          |27%        |
|16.Percentage of clean ASIN & DATE combos out of total unique ASINs & DATE combos. (3 constraints, units sold = 0)  |51%              |5%      |26%                |5.90%       |11.50%      |17.80%     |
