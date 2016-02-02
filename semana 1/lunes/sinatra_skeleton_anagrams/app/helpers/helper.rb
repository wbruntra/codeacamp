def get_canonical(word)
  w = word.downcase.split('')
  w.sort!
  canon = w.join
  return canon
end
