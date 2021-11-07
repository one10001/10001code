# arabe name generator
import random
import os
import string

db_femal_name="arab_femal_name.db"
db_mal_names="arab_male_name.db"

def mal_fn_gen():
    db=os.path.expanduser('~')+'/'+db_mal_names
    with open(db) as file:
        lines = file.readlines()
        lines = [line.rstrip() for line in lines]
    return lines[random.randrange(len(lines)-1)]

def femal_fn_gen():
    db=os.path.expanduser('~')+'/'+db_femal_name
    with open(db) as file:
        lines = file.readlines()
        lines = [line.rstrip() for line in lines]
    return lines[random.randrange(len(lines)-1)]

def get_random_string(length):
    # choose from all lowercase letter
    letters = string.ascii_lowercase
    result_str = ''.join(random.choice(letters) for i in range(length))
    print("Random string of length", length, "is:", result_str)

def rand_ln_gen():
    midel=''.join(str(random.choice('zrtsdfghjkylmwbn'))+str(random.choice(['a','o','i','ou',]))for i in range(2,5))
    #return str(random.choice(["el"+midel,'al'+midel,'e'+midel[0]+midel,'a'+midel[0]+midel]))
    return str(random.choice(["el"+midel,'al'+midel]))



def genarate_arabe_profile():
    G_profile={
    "fn":"amine",
    "ln":"ettayibi",
    "b_day":15,
    "b_month":1,
    "b_year":1995,
    "sex":2,
    "increment":10001

    }
    sex=random.randrange(2)+1
    while True:
        if sex==1:
            G_profile["fn"]=arname.femal_fn_gen().lower()
        else:
            G_profile["fn"]=arname.mal_fn_gen().lower()
        G_profile["ln"]=arname.rand_ln_gen()
        with open(listerror, 'r') as file:
            data = file.read()
        with open(listsuccess, 'r') as file:
            data2 = file.read()    
        data=data+data2
        if data.find(G_profile["fn"]+G_profile["ln"]) == -1:
                break
    G_profile["b_day"]=random.randrange(28)+1
    G_profile["b_month"]=random.randrange(28)+1
    G_profile["b_year"]=random.randrange(53)+1950
    G_profile["sex"]=sex
    r=random.randrange(1,9)
    G_profile["increment"]=r*10000+r
    return G_profile