Dado('o endereço da API') do
    $uri_base = "https://gorest.co.in/public/v2/users"
end
  
Quando('realizar a inclusao de um usuário') do
    @nome = Faker::Name.name
    @email = Faker::Internet.email
    $response = HTTParty.post($uri_base, :headers => {'Authorization': 'Bearer 4b99a4e898a3012fc5b14b85074fc94d9d90f7a1ba4fabbe6493a07c099ce5c1'}, :body => {"name": @nome, "email": @email, "gender": "male", "status": "active"})
end
  
Então('irá retornar os dados cadastrados e código {int}') do |int|
    @codigo = $response.code
    puts "response body #{$response.body}"
    expect(@codigo).to eql 201
end
  
