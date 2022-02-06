import time
import random
import uuid
import pandas as pd
import datetime

products_table = pd.read_csv('product_dim.csv')

# define the function generate_new_row
def generate_new_row():
    '''
    Python generator function which will generate random data using random module
    '''
    user = []
    # random user id
    user_id = str(uuid.uuid4())
    user.append(user_id)
    
    # random email id
    user_email = str(''.join(random.choices('abcireubgurgbe',k=5))) + str(random.randint(1000,99999)) + "@gmail.com"

    # random user name
    user_name  = str(''.join(random.choices("ABC",k=1))) + str(''.join(random.choices("ibruegbieiurgeriuger", k = 4)))

    # random source
    source     = random.choice(['LinkedIn', 'Email', 'Instagram', 'Facebook', 'Organic', "Not Available"])

    # random prime customers with a probability of 2/7
    is_prime   = random.choice([1, 1, 0, 0, 0, 0, 0])

    # current time as random time
    signup_time = str(datetime.datetime.now())

    # return the user details
    return user_id, user_email, user_name,  source, is_prime, signup_time


# function to generate new transactions
# this function will use a list of existing users as a parameter
def generate_new_transaction(users):
    '''
    Python Generator function to generate sales transaction using random module
    '''
    
    # generate random transaction id
    transaction_id = "TI-"+str(uuid.uuid4())
    
    # select a random user id 
    user_id = users[random.randint(0,len(users)-1)]
    
    # select a random product_id using the CSV file
    random_product = random.randint(0, products_table.shape[0]-1)
    product_id = products_table.iloc[random_product]['product_id']
    
    # current time will be transaction time
    transaction_time = str(datetime.datetime.now())
    
    # transaction type
    transaction_type = random.choice(['Online','POS'])
    
    # price of the product using the CSV file
    price = products_table.iloc[random_product]['product_price']

    #Sales quantity of the purchase
    sales_quantity = random.randint(20,70)

    #picking random geog id of transaction
    geog_id = random.choice(['Hyde:500090','Mumb:400004','Delh:110001','Kolk:700012','Indo:451010','Myso:570001'])

    # return the values
    return transaction_id, user_id, product_id, transaction_time,transaction_type, price, sales_quantity,geog_id

def generate_output_files():
    '''
    Python generator function to generate output files to the respective directories with timestamps
    '''
    
    no_of_records = random.randint(25,50)
    user_df = []
    for i in range(no_of_records):
      user_df.append(list(generate_new_row()))

    user_edf = pd.DataFrame(user_df,columns=['user_id','user_email','user_name','source','is_prime','signup_time'])
    user_edf.to_csv('user/user_details_{}.csv'.format(datetime.datetime.today().strftime('%y%m%d-%H%M%S')),index=False)

    transaction_df = []
    i = 0
    for i in range(len(user_df)):
      transaction_df.append(list(generate_new_transaction(user_edf['user_id'])))

    trans_edf = []
    trans_edf = pd.DataFrame(transaction_df,columns=['transaction_id','user_id','product_id','transaction_time','transaction_type','price','sales_quantity','geog_id'])

    trans_edf.to_csv('transactions/transaction_details_{}.csv'.format(datetime.datetime.today().strftime('%y%m%d-%H%M%S')),index=False)

#for loop to generate 10 files on a single execution
for i in range(10):
    generate_output_files()
    time.sleep(2)
