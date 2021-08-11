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

## As a user, I can click a button that will submit my blog post to the database.
# in controller, define create method that takes in blog_params
# define blog_params method under PRIVATE to create another level of security

```
def create
        @blog = Blog.create(blog_params)
        if @blog.valid?
            redirect_to blogs_path
        else
            redirect_to new_path
        end
end

    private
    def blog_params
        params.require(:blog).permit(:title, :content)
    end
```

## As a user, I when I submit my post, I am redirected to the home page.

# implemented conditional statement to check for the presence of data in the input forms. Use helper method "redirect_to" to respond accordingly and redirect appropriate page.
```
def create
        @blog = Blog.create(blog_params)
        if @blog.valid?
            redirect_to blogs_path
        else
            redirect_to new_path
        end
end
```

## As a user, I can delete my blog post.
# In controller, define destroy method
# create instance variable and assign value of the ID to the specific instance
# use conditionals to check if blog was destroyed and redirect accordingly
```
def destroy
    @blog = Blog.find(params[:id])
    if @blog.destroy
        redirect_to blogs_path
    else
        redirect_to blog_path(@blog)
    end
end
```
# create delete route
```
delete '/blogs/:id' => 'blog#destroy'
```
# create delete button inside of show.html.erb
# Added method: :delete option, and data: option
```
<h4> <%= link_to 'Delete Blog', delete_path(@blog), method: :delete, data: {confirm: 'Are you sure you want to delete this blog?'} %> </h4>
```

## As a user, I can update my blog post.

# created the edit method inside the controller
```
def edit
    @blog = Blog.find(params[:id])
end
```

# created a get edit route in the route file
```
  get '/blogs/:id/edit' => 'blog#edit', as: 'edit'

```

# created our edit view file, edit.html.erb
```
<h2> Update the Blog </h2>
<%= form_with model: @blog, method: :patch, local: true do |form|%>
    <%= form.label :title %>
    <%= form.text_field :title %>
    <br>
    <br>
    <%= form.label :content %>
    <%= form.text_field :content %>
    <br>
    <br>
    <%= form.submit 'Edit Blog' %>
<% end %>
```
# added link to edit form in show.html.erb file
```
<h4> <%= link_to 'Edit Blog', edit_path %> </h4>
```

# defined the controller update method
```
def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)
        if @blog.valid?
            redirect_to blog_path(@blog)
        else
            redirect_to edit_path(@blog)
        end
end
```

# created the route with the patch request
```
  patch '/blogs/:id' => 'blog#update'

```

## As a developer, I can ensure that all blog posts have titles and content for each post.





