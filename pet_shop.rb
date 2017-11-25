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
  for pet in pet_shop[:pets]
    if pet[:name]== name
      pet.delete(:name)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet_to_add)
  pet_shop[:pets].push(new_pet_to_add)
end

def customer_pet_count(customer)
  return customer[:pets].size()
end
