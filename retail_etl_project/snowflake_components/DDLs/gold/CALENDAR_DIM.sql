/*###################################################
#  Table Name DBS_ANALYTICS.CALENDARS.CALENDAR_DIM  #
#  Description: Calendar Dimension table holding    # 
#               calendar data                       #
#                                                   #
#   Author: Veera       Version: 1.0                #
###################################################*/

CREATE TABLE DBS_ANALYTICS.CALENDARS.CALENDAR_DIM
(
   CAL_DT                       DATE         NOT NULL
  ,FISCAL_YEAR                  NUMBER(4,0)  NOT NULL
  ,FISCAL_MONTH_NUM             NUMBER(5)    NOT NULL
  ,FISCAL_MONTH_FULL_NAME       VARCHAR(20)  NOT NULL
  ,DAY_OF_MONTH                 NUMBER(5)    NOT NULL
  ,DAY_OF_WEEK                  VARCHAR(9)   NOT NULL
  ,FISCAL_WEEK_NUM_OF_YEAR      NUMBER(5)    NOT NULL
  ,FISCAL_QUARTER               NUMBER(5)    NOT NULL
  ,FISCAL_YEAR_WEEK             VARCHAR(10)  NOT NULL
)COMMENT='Calendar Dimension table containing the calendar data';