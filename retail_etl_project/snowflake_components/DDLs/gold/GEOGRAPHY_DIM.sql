/*###################################################
#  Table Name DBS_ANALYTICS.GEOGRAPHY.GEOGRAPHY_DIM #
#  Description: Geog Dimension table holding        # 
#               Geog data                           #
#                                                   #
#   Author: Veera       Version: 1.0                #
###################################################*/

CREATE TABLE DBS_ANALYTICS.GEOGRAPHY.GEOGRAPHY_DIM
(  
  GEOG_ID     VARCHAR(200) PRIMARY KEY,
  REGION      VARCHAR(200),
  COUNTRY     VARCHAR(200),
  STATE       VARCHAR(200),
  CITY        VARCHAR(200),
  POSTAL_CODE NUMBER(10)
) COMMENT = 'Geography dimension table to maintain the geography details';