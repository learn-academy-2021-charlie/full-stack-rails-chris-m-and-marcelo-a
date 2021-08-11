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
- yarn
# create blogs x3
-  Blog.create title:'Top 5 taco restaurants in San Dieg
o', content: 'Puesto, Kikos, Panchitas, Salud, Blanco Tacos'
-  Blog.create title:'Top 5 SD Burgers', content:'The Balboa, Rockys, in-n-out, Crazee Burg
er, Smash Burger'
-  Blog.create title:'Top 5 Favorite Foods', content:'Spaghetti, Tacos, Pizza, Nachos, Chee
se'

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
# create show method
```
def show
    @blog = Blog.find(params[:id])
end
```
# create route 
```
get '/blogs/:id' => 'blog#show'
```
# create view for each blog post
```
<h1> Today's Blogs  </h1>

<h2> <%= @blog.title %> </h2>
<p> <%= @blog.content %> </p>
```
# link each blog on homepage to show
```
get '/blogs/:id' => 'blog#show', as: 'blog'
```
# create homepage root when going to localhost:3000
```
root 'blog#index'
```
## As a user, I see a form where I can create a new blog post.

# define new method in the controller file
```
def new
    @blog = Blog.new
end
```

# defined our route
    - remember! the more specific routes should move to the top.
```
  get '/blogs/new' => 'blog#new'
```

# create the new.html.erb view file

```
<h2> Add a Blog Post </h2>
    <%= form_with model: @blog, local: true do |form|%>
        <%= form.label :title %>
        <%= form.text_field :title %>
        <br>
        <br>
        <%= form.label :content %>
        <%= form.text_field :content %>
        <br>
        <br>
        <%= form.submit 'Add Blog' %>
    <% end %>
```

## As a user, I can click a button that will take me from the home page to a page where I can create a blog post.

# added alias to the new route in route file
```
  get '/blogs/new' => 'blog#new', as: 'new'

```

# added p tag with link inside the index.html.erb file 
```
<p> <%= link_to 'Add Blog', new_path %> </p>
```

## As a user, I can navigate from the form back to the home page.

# added a h4 tag with link_to home in the new.html.erb
```
<h4> <%= link_to 'Back Home', blogs_path %> </h4>
```

