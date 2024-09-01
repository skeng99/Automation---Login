from faker import Faker
from robot.api.deco import keyword
import random

fake = Faker()

@keyword
def generate_random_first_name():
    return fake.first_name()

@keyword
def generate_random_last_name():
    return fake.last_name()

@keyword
def generate_random_email():
    return fake.email()

@keyword
def generate_random_age():
    return random.randint(0, 100)

@keyword
def generate_random_number():
    return random.randint(0, 1000)

@keyword
def generate_random_choice():
    options = [1, 2, 3]
    return random.choice(options)

@keyword
def generate_random_username():
    first_name = generate_random_first_name()
    last_name = generate_random_last_name()
    return f"{first_name}_{last_name}"

@keyword
def generate_random_text():
    return fake.text()

@keyword
def generate_random_url():
    return fake.url()

@keyword
def generate_random_phone_number():
    return fake.phone_number()

@keyword
def generate_random_address():
    return fake.address()

@keyword
def generate_random_city():
    return fake.city()

@keyword
def generate_random_password():
    return fake.password()

@keyword
def generate_random_zipcode():
    return fake.zipcode()

@keyword
def generate_random_state():
    return fake.state()

@keyword
def generate_random_ssn():
    return fake.ssn()