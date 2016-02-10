urls = [{
  'long_url' => 'https://www.reddit.com/',
  'short_url' => 'wwVeWYa',
  'creator' =>'w.bruntrager@gmail.com'
  },
{
  'long_url' => 'http://www.amazon.com/',
  'short_url' => 'd5GPE1t',
  'creator' => 'Anonymous'
}
]

users = [
  { 'name' =>  'William Bruntrager',
    'username' => 'wbruntra',
    'email' => 'w.bruntrager@gmail.com',
    'password' => 'hello'},
  { 'name' =>  'Fernando',
    'username' => 'fernando',
    'email' => 'fernando@codea.mx',
    'password' => 'qwerty'}
]

for user in users do
  User.create(user)
end

for url in urls do
  Url.create(url)
end
