import library
import requests

url = "https://school.cloud24.com.ua:22443/SCHOOL/ru_RU/hs/1cData/B2C/?from=20220901&till=20220925&businessDirection=Школы Программирования&firstPayment=true"

response = requests.get(url, headers=library.payments_headers, verify=False)
print(response.json())
print()

