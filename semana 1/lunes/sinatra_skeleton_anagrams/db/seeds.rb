# Este archivo sirve para correr código que te permita
# rellenar tu base de datos con información.

# animal_list = [ "Rat",
#     "Dog",
#     "Pig",
#     "Goat"]
#
# animal_list.each do |name|
#   Model.create( name: name )
# end

def load_words
  words = []
  File.open('wordlist10k.txt') do |f|
    while line = f.gets
      words.push(line.chomp)
    end
  end
  return words
end

def get_canonical(word)
  w = word.downcase.split('')
  w.sort!
  canon = w.join
  return canon
end

words = load_words

for word in words do
  canon = get_canonical(word)
  Word.create(name:word, canonical:canon)
end
