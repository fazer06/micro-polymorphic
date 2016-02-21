# Polymorphic Associations - Example

Further investigation into Polymorphic Associations for the Odin Project

## What is it ?

With polymorphic associations, a model can belong to more than one other model, on a single association. In our example, we have an Interaction model that belongs to either (A:) Business model or (B:)  a Person model

- rails generate model Person first_name:string last_name:string
- rails generate model Business name:string
- rails generate model Interaction description:string interactive:references{polymorphic}
- bundle exec rake db:migrate

Add the following to Person and Business

- has_many :interactions, as: :interactive

Interaction already has the other side from the model generation above

- belongs_to :interactive, polymorphic: true

## In the console type

- Interaction.column_names

=> ["id", "description", "interactive_id", "interactive_type", "created_at", "updated_at"]

    The interactive_type column holds the type of the model that the interaction belongs to. The interactive_id holds the id of the model that the interaction belongs to. Together these two columns tell rails what model this interaction should be associated with

## Generate the controllers

- rails generate controller People index show new edit
- rails generate controller Businesses index show new edit
- rails generate controller Interactions new edit

## Edit routes.rb

Set up the routes for both people and businesses with a nested resource for 
interactions which allows us to easily create interactions 
for both people and businesses.

  resources :people do 
    resources :interactions, only: [:new, :create, :edit, :update]
  end

  resources :businesses do
    resources :interactions, only: [:new, :create, :edit, :update]
  end

  root to: "people#index"

### https://richonrails.com/articles/polymorphic-associations-in-rails

### http://karimbutt.github.io/blog/2015/01/03/step-by-step-guide-to-polymorphic-associations-in-rails/

### https://robots.thoughtbot.com/whats-the-deal-with-rails-polymorphic-associations