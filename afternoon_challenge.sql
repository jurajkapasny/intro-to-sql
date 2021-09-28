-- We are going to work with financial data in this challenge.

-- EXPLORATION
select * from twm_customer limit 10;

select * from twm_transactions limit 100;

select * from twm_checking_tran limit 10;



/* PROBLEM: Write query that will return following data for each client and every month:
- total tran_amt for 1 month
- total tran_amt for 3 months
- total principal_amt for 1 month
- total principal_amt for 3 months
- total tran_count for 1 month
- total tran_count for 3 months
- avg tran_value for 1 month
- avg tran_value for 3 months


- STRETCH
- total checking_tran_amt for 1 Month
- total checking_tran_amt for 3 Months
- total incoming_tran_amt for 1 Month
- total outgoing_tran_amt for 1 Month
- total incoming_tran_amt for 3 Months
- total outgoing_tran_amt for 3 Months
- total checking_tran_count for 1 Month
- total checking_tran_count for 3 Months
- total savings_tran_amt for 1 Month
- total savings_tran_amt for 3 Months
- total savings_tran_count for 1 Month
- total savings_tran_count for 3 Months
- total checking_tran_amt for 1 Month and channel A
- total checking_tran_amt for 1 Month and channel V
- total checking_tran_amt for 1 Month and channel P