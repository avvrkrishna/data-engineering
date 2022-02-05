/*###################################################
#  Table Name DBS_ANALYTICS.PRODUCT.PRODUCT_DIM     #
#  Description: Product Dimension table holding     # 
#               product details                     #
#                                                   #
#   Author: Veera       Version: 1.0                #
###################################################*/

CREATE TABLE DBS_ANALYTICS.PRODUCT.PRODUCT_DIM
(
  PRODUCT_ID        VARCHAR(200) PRIMARY KEY,
  PRODUCT_NAME      VARCHAR(200),
  PRODUCT_CATEGORY  VARCHAR(200),
  PRODUCT_BRAND     VARCHAR(200),
  BUSINESS_UNIT     VARCHAR(200),
  PRODUCT_PRICE     NUMBER(30,3)
)COMMENT = 'Product Dimension table holding product details';