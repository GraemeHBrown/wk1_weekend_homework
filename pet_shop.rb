def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, increase)
  pet_shop[:admin][:pets_sold] += increase
end

def stock_count(pet_shop)
  return pet_shop[:pets].count()
end

def pets_by_breed(pet_shop, breed_name)
  selected_pets = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed_name
      selected_pets.push(pet)
    end
  end
  return selected_pets
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
  pet_to_remove = find_pet_by_name(pet_shop, name)
  pet_shop[:pets].delete(pet_to_remove)
end

def add_pet_to_stock(pet_shop, new_pet_to_add)
  pet_shop[:pets].push(new_pet_to_add)
end

def customer_pet_count(customer)
  return customer[:pets].size()
end

def customer_cash_total(customer)
  return customer[:cash]
end

def add_or_remove_customer_cash(customer, amount)
  customer[:cash]+=amount
end

def add_pet_to_customer(customer, pet_to_add)
  customer[:pets].push(pet_to_add)
end

def customer_can_afford_pet(customer, pet_to_buy)
  customer_funds = customer[:cash]
  price_of_pet = pet_to_buy[:price]
  if customer_funds < price_of_pet
    return false
  else
    return true
  end
end

def sell_pet_to_customer(pet_shop, pet_to_sell, customer)
  if pet_to_sell!=nil
    #add pet to customer using function
    add_pet_to_customer(customer, pet_to_sell)
    #increase pets sold using function
    increase_pets_sold(pet_shop, 1)
    #add cash to pet shop using add or remove cash
    price_of_pet = pet_to_sell[:price]
    add_or_remove_cash(pet_shop, price_of_pet)
    #remove pet from stock using remove pet by name.
    #Note the code below isn't needed to pass the test but is included to complete function.
    name_of_pet_sold = pet_to_sell[:name]
    remove_pet_by_name(pet_shop, name_of_pet_sold)
    #should also reduce customers cash by price of pet
    add_or_remove_customer_cash(customer, -price_of_pet)
  else
    return "Warning:  Pet not in stock."
  end
end
