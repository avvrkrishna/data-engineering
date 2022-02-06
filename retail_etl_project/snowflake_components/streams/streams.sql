/*########################################
#   Snowflake Stream created for CDC     #
########################################*/

--Customer Dim Stream
CREATE STREAM DBS_ANALYTICS.CUSTOMER.RAW_CUSTOMER_DIM_STREAM ON TABLE DBS_ANALYTICS.STAGE.RAW_CUSTOMER_DIM
APPEND_ONLY = TRUE
COMMENT = 'Insert only stream to ingest Customer signup information';

--Sales Transaction Stream
CREATE STREAM DBS_ANALYTICS.SALES.RAW_SALES_TRANSACTION_FACT_STREAM ON TABLE DBS_ANALYTICS.STAGE.RAW_SALES_TRANSACTION_FACT
APPEND_ONLY = TRUE
COMMENT = 'Insert only stream to ingest Sales Transaction information';