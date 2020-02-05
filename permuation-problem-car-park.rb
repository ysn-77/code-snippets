 
@cars = [:asad, :fizzah, :sara, :anum, :sadiq, :waheeda, :your].shuffle.permutation

def left_of?(set_a, val_a, set_b, val_b)
  (0...set_a.length-1).any? do |i|
    set_a[i]   == val_a &&
    set_b[i+1] == val_b
  end
end

def n_between?(set_a, val_a, set_b, val_b, n)
  n = n+1
  (0...set_a.length-n).any? do |i|
    (set_a[i] == val_a && set_b[i+n] == val_b) ||
    (set_a[i] == val_b && set_b[i+n] == val_a)
  end
end

def x_between?(set_a, val_a, set_b, val_b, x)
  index_x = set_a.find_index(x)
  index_a = set_a.find_index(val_a)
  index_b = set_a.find_index(val_b)

  (index_x < index_a && index_x > index_b ) ||
  (index_x < index_b && index_x > index_a )
end

def next_to?(set_a, val_a, set_b, val_b)
  left_of?(set_a, val_a, set_b, val_b) ||
  left_of?(set_b, val_b, set_a, val_a)
end


def solve
  i = 0
  solutions=[]
  @cars.each do |cars|
    i += 1
    next unless (cars[0] == :asad || cars[cars.length-1] == :asad)
    next unless x_between?(cars, :sara, cars, :anum, :fizzah)
    next unless n_between?(cars, :sadiq, cars, :waheeda, 1)
    next unless n_between?(cars, :asad, cars, :anum, 2)
    next unless next_to?(cars, :waheeda, cars, :anum)
    print cars
    print "\n"
  end
  solutions
end

solve
