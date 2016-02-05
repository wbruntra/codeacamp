def valid?(s)
  p s
  return (s.start_with?('http:') || s.start_with?('https:'))
end
