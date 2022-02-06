/*#############################################################
#  Table Name DBS_ANALYTICS.STAGE.RAW_SALES_TRANSACTION_FACT  #
#  Description: Raw ales Transaction Fact table holding       # 
#               customer transaction data                     #
#                                                             #
#   Author: Veera       Version: 1.0                          #
#############################################################*/

CREATE TABLE DBS_ANALYTICS.SALES.SALES_TRANSACTION_FACT
(
  TRANSACTION_ID    VARCHAR(200),
  USER_ID           VARCHAR(200),
  PRODUCT_ID        VARCHAR(200),
  TRANSACTION_TIME  TIMESTAMP,
  TRANSACTION_TYPE  VARCHAR(200),
  PRICE             NUMBER(30,3),
  SALES_QUANTITY    NUMBER(30,3),
  GEOG_ID           VARCHAR(200)
)COMMENT = 'Raw Sales Transaction Fact table to hold fact details';