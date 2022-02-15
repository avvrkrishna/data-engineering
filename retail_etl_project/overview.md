### Retail ETL project with data extraction, transformation and loading:
--------------------------------------------------------
### Resources used:
- **AWS** 
  - S3 - for maintaining the data lake
  - Lambda - for event based file management to ensure security during data handling
- **Snowflake** - Data warehouse to store data
-------------------------------------------------------- 
## Architecture Diagram:
![Architecture design](https://github.com/avvrkrishna/data-engineering/blob/8916347f70d901163a78bbe09d5da90fbfea4c68/retail_etl_project/Architecture_Design.png)

-------------------------------------------------------- 
## Data Flow:
![Data Flow](https://media.giphy.com/media/JaudLsEsEKhx8cGdZv/giphy.gif)
-------------------------------------------------------- 
### Architecture creation:
### AWS Requirements:
- EC2 Instance - For running our random data generator function
- S3 Buckets
  - Stage Bucket - Create a stage bucket with a unique name as per the business requirements and aws standards
  - Archive Bucket - Create a stage bucket with a unique name as per the business requirements and aws standards
  - Inbound Bucket - Create a stage bucket with a unique name as per the business requirements and aws standards
- Lambda function to copy files from Inbound bucket to Stage bucket and archive bucket

### Process:
#### Step 1:
- Create S3 buckets as mentioned above
#### Step 2:
- a. Create an EC2 instance with the minimal possible configuration.(This is only for the random data generation as we do not have any legitimate source that generates data as per our requirement
- b. Create a separate IAM role, with full access to Inbound S3 bucket
- c. Assign the above created role to the EC2 instance created in (a)
#### Step 3:
- Create Lambda function using the lambda function code and add trigger between Lambda function and Inbound S3 bucket for the specific prefixes(this will help to use the Inbound bucket main path to move files to EC2 instance)
### Snowflake Requirements:
- Snowflake account
- Snowflake components created
-------------------------------------------------------- 
![Snowflake E-R](https://github.com/avvrkrishna/data-engineering/blob/8916347f70d901163a78bbe09d5da90fbfea4c68/retail_etl_project/ER-Diagram.png)
-------------------------------------------------------- 
-- Execute all sql code in the snowflake_components directory to create all the snowflake components with specified roles and schemas
<br> </br>
By Following the <a href = "https://docs.snowflake.com/en/sql-reference/sql/create-pipe.html" target="_blank" >Snowpipe documentation</a>, created the Snowpipes and integrated them with AWS S3 Stage bucket using SQS as event notification
<br></br>
### Random data generation:
- Create a shell script which synchronizes the aws ec2 and Inbound S3 bucket as shown below:

``` aws s3 sync /home/ec2-user/my_work/user/ s3://np-etl-inbound/user/
    aws s3 sync /home/ec2-user/my_work/transactions s3://np-etl-inbound/transactions/
```
**Note**: Restrict the use of aws sync and don't let aws sync run continuosly, it will incur aws s3 put and list operations and increases budget
 ### Data Flow Process after data is generated:
 - The above command will sync the files generated through generator python code to Inbound S3 bucket
 - Lambda function will be triggered and copies the files to Stage S3 bucket and Archive S3 bucket at the same time
 - Stage S3 bucket SQS will generate a queue message and the Snowpipe will execute and loads the data to the Raw table
 - Scheduled Snowflake Task will execute and it will check for the Table stream on the Raw table and it will load the delta records to the Target table.
