 
@colors        = [:white, :yellow, :blue, :red, :green].shuffle.permutation
@cigars        = [:blends, :pall_mall, :prince, :bluemasters, :dunhill].shuffle.permutation
@nationalities = [:german, :spanish, :british, :mexican, :russian].shuffle.permutation
@drinks        = [:dr_pepper, :water, :tea, :milk, :coffee].shuffle.permutation
@pets          = [:birds, :cats, :horses, :fish, :dogs].shuffle.permutation

def left_of?(set_a, val_a, set_b, val_b)
  (0..4).any? do |i|
    set_a[i]   == val_a &&
    set_b[i+1] == val_b
  end
end

def next_to?(set_a, val_a, set_b, val_b)
  left_of?(set_a, val_a, set_b, val_b) ||
  left_of?(set_b, val_b, set_a, val_a)
end

def implies?(set_a, val_a, set_b, val_b)
  (0..4).any? do |i|
    set_a[i] == val_a &&
    set_b[i] == val_b
  end
end

def solve
  i = 0
  @colors.each do |colors|
    i += 1
    next unless left_of?(colors, :green, colors, :white)
    @nationalities.each do |nationalities|
      i += 1
      next unless implies?(nationalities, :british, colors, :red)
      next unless nationalities[0] == :german
      next unless next_to?(nationalities, :german, colors, :blue)
      @pets.each do |pets|
        i += 1
        next unless implies?(nationalities, :spanish, pets, :dogs) 
        @drinks.each do |drinks|
          i += 1
          next unless drinks[2] == :milk
          next unless implies?(colors, :green, drinks, :coffee)
          next unless implies?(nationalities, :russian, drinks, :tea)
          @cigars.each do |cigars|
            i += 1
            next unless next_to?(pets, :horses, cigars, :dunhill)
            next unless implies?(cigars, :pall_mall, pets, :birds)
            next unless next_to?(cigars, :blends, drinks, :water)
            next unless next_to?(cigars, :blends, pets, :cats)
            next unless implies?(nationalities, :mexican, cigars, :prince)
            next unless implies?(colors, :yellow, cigars, :dunhill)
            next unless implies?(cigars, :bluemasters,  drinks, :dr_pepper)
            return [colors, nationalities, pets, drinks, cigars], i
          end
        end
      end
    end
  end
end

puts solve.inspect
