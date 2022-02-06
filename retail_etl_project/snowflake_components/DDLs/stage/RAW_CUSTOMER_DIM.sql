/*###################################################
#  Table Name DBS_ANALYTICS.STAGE.RAW_CUSTOMER_DIM  #
#  Description: RAW Customer Dimension table holding# 
#               customer data                       #
#                                                   #
#   Author: Veera       Version: 1.0                #
###################################################*/

CREATE TABLE DBS_ANALYTICS.STAGE.RAW_CUSTOMER_DIM
( 
  USER_ID         VARCHAR(200) PRIMARY KEY,
  USER_EMAIL      VARCHAR(200),
  USER_NAME       VARCHAR(200),
  SOURCE          VARCHAR(200),
  IS_PRIME        VARCHAR(10),
  SIGNUP_TIME     TIMESTAMP
)COMMENT = 'Customer details raw table who signsup to our retail site';