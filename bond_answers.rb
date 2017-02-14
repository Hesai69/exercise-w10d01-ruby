# requiring a local file
require './bond_data.rb'
# accessing the array inside the module
# movie = Bond::MOVIE_DATA[0][:title]

# convert string into float
def parse_gross(gross)
  gross.gsub(/[$,]/, '').to_f
end

def get_gross_for(title, movies)
  movie = movies.find {|movie| movie[:title] == title}
  movie[:gross]
end

get_gross_for('Skyfall', Bond::MOVIE_DATA)

def get_gross_total(movies)
  total = 0
  movies.each {|n|
    gross_str_arr = n[:gross].split('$')[1].split(',')
    gross_str = gross_str_arr.reduce {|a,b| a+b}
    total = total + gross_str.to_i
  }
  total
end
bond_total_gross = get_gross_total(Bond::MOVIE_DATA)

def all_actors(movies)
  list = []
  movies.each { |movie|
    list.push(movie[:actor])
  }
  list.uniq
end
bond_actors = all_actors(Bond::MOVIE_DATA)

def all_movies(movies)
  list = []
  movies.each { |movie|
    list.push(movie[:title])
  }
  list
end
bond_movies = all_movies(Bond::MOVIE_DATA)

def bond_movies_odd(movies)
  movies.select {|movie| movie[:year] % 2 != 0}
end
bond_movies_odd_years = bond_movies_odd(Bond::MOVIE_DATA)

def worst_gross(movies)
  movies.reduce {|a, b|
    gross_str_arr_a = a[:gross].split('$')[1].split(',')
    gross_str_a = gross_str_arr_a.reduce {|a,b| a+b}
    gross_str_arr_b = b[:gross].split('$')[1].split(',')
    gross_str_b = gross_str_arr_b.reduce {|a,b| a+b}
    gross_str_a.to_i < gross_str_b.to_i ? a : b
  }
end
worst_grossing_bond = worst_gross(Bond::MOVIE_DATA)

def best_gross(movies)
  movies.reduce {|a, b|
    gross_str_arr_a = a[:gross].split('$')[1].split(',')
    gross_str_a = gross_str_arr_a.reduce {|a,b| a+b}
    gross_str_arr_b = b[:gross].split('$')[1].split(',')
    gross_str_b = gross_str_arr_b.reduce {|a,b| a+b}
    gross_str_a.to_i > gross_str_b.to_i ? a : b
  }
end
highest_grossing_bond = best_gross(Bond::MOVIE_DATA)

def movies_by_actor(movies)
  list = {}
  movies.each { |movie|
    if movie.has_value?(list.)
  }
end

def movies_per_actor(movies)
  groups = movies.group_by {|movie| movie[:actor]}
  puts groups
  groups.each {|key, value| groups[key] = value.count}
end

def movies_by_release(movies)

end




