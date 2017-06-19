require 'pry'

class Customer

  attr_accessor :restaurant, :full_name, :add_review, :content, :full_review
  attr_reader :name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @full_name = "#{@first_name} #{@last_name}"
    @@all << @full_name
  end

  def self.all
    @@all
  end

  def add_review(restaurant, content)
    @restaurant = restaurant
    @content = content
    add_to_review
    add_to_restaurant
  end

  def add_to_review
    review = Review.new
    review.customer = self
    review.class.all << self.content
  end

  def add_to_restaurant
    restaurant = Restaurant.new(self.restaurant)
    restaurant.customers = self.full_name
    restaurant.reviews = self.content
  end

end

class Review

  @@all = []

  attr_accessor :customer, :restaurant, :all, :content

  # def initialize(restaurant, customer, review)
  #   @customer = customer
  #   @restaurant = restaurant
  #   @review = review
  # end

  def self.all
    @@all
  end

  def review
    self.content
  end

  def reviews

  end


end



class Restaurant

  attr_accessor :name, :customers, :reviews

  @@all = []

  def initialize(name)
    @name = name
    @@all << name
  end

  def reviews
    self.reviews
  end

  def customer
    self.customers
  end

  def self.all
    @@all
  end

end


Pry.start
