class Owner
  attr_reader :name, :species #owner's name and species cannot be changed 
  

  
  @@all = [] #all owners 
  
  
  def initialize(name, species = "human") 
    #owner has a name upon initialization, and species is set to human 
    @name = name
    @species = species 
   
    save #everytime an owner is created, it's saved. 
 
  end 
  
  def say_species
    return"I am a #{@species}." #owner can say its species 
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.all
    @@all #returns all intances of Owner that have been created. 
  end 
  
  def self.count
    self.all.count #returns the number of owners that have been created 
  end 
  
  def self.reset_all 
    self.all.clear.count #resets the owners that have been created 
  end 
  
  def cats
    Cat.all.select {|cat| cat.owner == self} #recall that select returns a new array for all the elements that make the block of code true 
    #returns a collection of all the cats that belong to the owner. We can call the owner method on every instance of cat. 
  end 
  
  def dogs 
    Dog.all.select {|dog| dog.owner == self} #returns a collection of all the dogs that belong to the owner 
  end 
  
  def buy_cat(the_cats_name)
    Cat.new(the_cats_name, self)
  end 
  
  def buy_dog(the_dogs_name)
    Dog.new(the_dogs_name, self) 
  end 
  
  def walk_dogs
    Dog.all.each do |dog|
      dog.mood = "happy"
    end 
  end 
    
  
  def feed_cats 
    Cat.all.each do |cat|
      cat.mood = "happy"
    end
  end 
  
  def sell_pets
    Cat.all.each do |cat, owner|
      cat.mood = "nervous"
      cat.owner = nil 
    end 
    Dog.all.each do |dog, owner|
      dog.mood = "nervous" 
      dog.owner = nil
    end 
  end 
  
  def list_pets
    puts "I have #{Dog.all.count} dogs, and #{Cat.all.count} cats."
  end 

  
end