users = [
  ['w.bruntrager@gmail.com','hello'],
  ['fernando@codea.mx', 'qwerty']
]

for user in users do
  User.create(email:user[0],password:user[1])
end
