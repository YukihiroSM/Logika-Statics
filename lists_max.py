products = ["Bread", "Milk", "Water"]

# We can get elements by it's numbers(index)
print(products[0])
print(products[1])
print(products)

# We can add some items to the list
products.append("Cookies")
print(products)

products.remove("Water")

# Create an empty list
a = list()
a = []

# Find some data in the list
if "Eggs" in products:
    print("Eggs are already in products")
else:
    print("Eggs are not in products. Add them there.")

for product in products:
    print(product)

print(len(products))



