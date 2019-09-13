def sluggish_octopus(array)
    

end

def dominant_octopus(array)
    
    
end

def clever_octopus(array)
    largest_fish = array[0]
    longest = largest_fish.chars.length

    array[1..-1].each do |fish|
        largest_fish = fish if fish.chars.length > longest
    end

    largest_fish
end

['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']