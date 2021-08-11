# Setup

- create a Rails app on Desktop
- created db
- add remote from GHCR
- created branch main
- initial commit
- checkout index branch

- create model Blog

# Switching driver/navigator
- rails db:create
- rails db:migrate
# create blogs x3
-  Blog.create title:'Top 5 taco restaurants in San Dieg
o', content: 'Puesto, Kikos, Panchitas, Salud, Blanco Tacos'

# controller index
```
def index
    @blog = Blog.all
end
```
# route
```
  get '/blogs' => 'blog#index'
```
# view
```
<h1> My Food Blog  </h1>
<ul>
    <% @blogs.each do |blog|%>
        <li><%= blog.title %></li>
    <% end %>
</ul>
```