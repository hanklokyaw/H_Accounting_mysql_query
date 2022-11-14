-- Union all tables
-- Revenue sum
SELECT statement_section AS Account, FORMAT(SUM(jeli.credit),2) AS Amount
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 68
AND YEAR(je.entry_date) = 2016
UNION ALL
-- Return & Refund
SELECT statement_section AS Account, FORMAT(SUM(jeli.credit),2) AS Amount
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 69
AND YEAR(je.entry_date) = 2016
UNION
-- COGS
SELECT statement_section AS Account, FORMAT(SUM(jeli.credit),2) AS Amount
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 74
AND YEAR(je.entry_date) = 2016
UNION
-- Revenue sum
SELECT 'Gross Profit' AS Account, FORMAT((
SELECT SUM(jeli.credit)
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 68
AND YEAR(je.entry_date) = 2016
) -
(
SELECT SUM(jeli.credit)
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 74
AND YEAR(je.entry_date) = 2016
)
,2)AS Amount
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id IN (68,69,74)
AND is_balance_sheet_section = 0
   AND cancelled = 0
   AND debit_credit_balanced = 1
AND YEAR(je.entry_date) = 2016
UNION
-- general expense
SELECT statement_section AS Account, FORMAT(SUM(jeli.credit),2) AS Amount
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 75
AND YEAR(je.entry_date) = 2016
UNION
-- selling expense
SELECT statement_section AS Account, FORMAT(SUM(jeli.credit),2) AS Amount
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 76
AND YEAR(je.entry_date) = 2016
UNION
-- Operating Expense
SELECT 'OPERATING PROFIT' AS Account, FORMAT((
SELECT SUM(jeli.credit)
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 68
AND YEAR(je.entry_date) = 2016
) -
(
SELECT SUM(jeli.credit)
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 74
AND YEAR(je.entry_date) = 2016
) -(
SELECT IFNULL(SUM(jeli.credit),0)
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 75
AND YEAR(je.entry_date) = 2016
) -
(
SELECT IFNULL(SUM(jeli.credit),0)
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 76
AND YEAR(je.entry_date) = 2016
)
,2)AS Amount
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id IN (68,69,74,75,76)
AND is_balance_sheet_section = 0
   AND cancelled = 0
   AND debit_credit_balanced = 1
AND YEAR(je.entry_date) = 2016
UNION
-- other expense
SELECT statement_section AS Account, FORMAT(SUM(jeli.credit),2) AS Amount
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 77
AND YEAR(je.entry_date) = 2016
UNION
-- other incomes
SELECT statement_section AS Account, FORMAT(SUM(jeli.credit),2) AS Amount
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 78
AND YEAR(je.entry_date) = 2016
UNION
-- profit earning tax
SELECT 'EARNING BEFORE TAX' AS Account, FORMAT((
SELECT SUM(jeli.credit)
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 68
AND YEAR(je.entry_date) = 2016
) -
(
SELECT SUM(jeli.credit)
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 74
AND YEAR(je.entry_date) = 2016
) -(
SELECT IFNULL(SUM(jeli.credit),0)
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 75
AND YEAR(je.entry_date) = 2016
) -
(
SELECT IFNULL(SUM(jeli.credit),0)
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 76
AND YEAR(je.entry_date) = 2016
)-
(
SELECT IFNULL(SUM(jeli.credit),0)
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 77
AND YEAR(je.entry_date) = 2016
)
+
(
SELECT IFNULL(SUM(jeli.credit),0)
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 78
AND YEAR(je.entry_date) = 2016
)
,2)AS Amount
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id IN (68,69,74,75,76,77,78)
AND is_balance_sheet_section = 0
   AND cancelled = 0
   AND debit_credit_balanced = 1
AND YEAR(je.entry_date) = 2016
UNION
-- income tax
SELECT statement_section AS Account, FORMAT(SUM(jeli.credit),2) AS Amount
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 79
AND YEAR(je.entry_date) = 2016
UNION
-- other tax
SELECT statement_section AS Account, FORMAT(SUM(jeli.credit),2) AS Amount
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 80
AND YEAR(je.entry_date) = 2016
UNION
SELECT 'NET INCOME' AS Account, FORMAT((
SELECT SUM(jeli.credit)
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 68
AND YEAR(je.entry_date) = 2016
) -
(
SELECT SUM(jeli.credit)
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 74
AND YEAR(je.entry_date) = 2016
) -(
SELECT IFNULL(SUM(jeli.credit),0)
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 75
AND YEAR(je.entry_date) = 2016
) -
(
SELECT IFNULL(SUM(jeli.credit),0)
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 76
AND YEAR(je.entry_date) = 2016
)-
(
SELECT IFNULL(SUM(jeli.credit),0)
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 77
AND YEAR(je.entry_date) = 2016
)
+
(
SELECT IFNULL(SUM(jeli.credit),0)
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 78
AND YEAR(je.entry_date) = 2016
)-
(
SELECT IFNULL(SUM(jeli.credit),0)
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id = 79
AND YEAR(je.entry_date) = 2016
)
,2)AS Amount
FROM account AS acc
INNER JOIN statement_section AS ss
ON acc.profit_loss_section_id = ss.statement_section_id
INNER JOIN journal_entry_line_item AS jeli
USING(account_id)
INNER JOIN journal_entry AS je
USING(journal_entry_id)
WHERE acc.profit_loss_section_id IN (68,69,74,75,76,77,78,79)
AND is_balance_sheet_section = 0
   AND cancelled = 0
   AND debit_credit_balanced = 1
AND YEAR(je.entry_date) = 2016;