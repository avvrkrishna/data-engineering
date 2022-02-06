/*###################################################
#  Table Name DBS_ANALYTICS.CUSTOMER.CUSTOMER_DIM   #
#  Description: Customer Dimension table holding    # 
#               customer data                       #
#                                                   #
#   Author: Veera       Version: 1.0                #
###################################################*/

CREATE TABLE DBS_ANALYTICS.CUSTOMER.CUSTOMER_DIM
( 
  USER_ID         VARCHAR(200) PRIMARY KEY,
  USER_EMAIL      VARCHAR(200),
  USER_NAME       VARCHAR(200),
  SOURCE          VARCHAR(200),
  IS_PRIME        VARCHAR(10),
  SIGNUP_TIME     TIMESTAMP,
  CREATE_DATETIME TIMESTAMP,
  UPDATE_DATETIME TIMESTAMP
)COMMENT = 'Customer details who signsup to our retail site';