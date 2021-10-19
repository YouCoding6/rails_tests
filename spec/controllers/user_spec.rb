require 'rails_helper'
RSpec.describe UsersController, type: :controller do

    describe "GET index" do
        it "assigns @users" do
            # création d'une instance
            user = User.create(first_name: "Jean-Michel", last_name: "Durant", username: "joe")

            # on va sur index
            get :index
        
            # @users doit être une array qui contient user
            expect(assigns(:users)).to eq([user])
        end
    
        it "renders the index template" do
        # va sur index
            get :index
        
            # on doit rediriger vers index
            expect(response).to render_template("index")
        end
    end
    describe "GET show" do
        it "assigns @users" do
            # création d'une instance
            user = User.create(first_name: "Jean", last_name: "Durantt", username: "joe1")
        
            # on va sur show
            get :show, params: { id: user.id }
        
            # @user doit être user
            expect(assigns(:user)).to eq(user)
        end
      
        it "renders the show template" do
            # ***va sur show
            user = User.create(first_name: "Jean", last_name: "Durantt", username: "joe1")
            get :show, params: { id: user.id }
        
            # on doit rediriger vers show
            expect(response).to render_template("show")
        end
    end

    describe "GET new" do
        it "renders the new template" do
            # va sur new
            get :new
        
            # on doit rediriger vers new
            expect(response).to render_template("new")
        end
    end

    describe "GET edit" do
        it "assigns @users" do
            # création d'une instance
            user = User.create(first_name: "Jean", last_name: "Durantt", username: "joe1")
        
            # on va sur edit
            get :edit, params: { id: user.id }
        
            # @user doit être user
            expect(assigns(:user)).to eq(user)
        end
      
        it "renders the edit template" do
            # va sur edit
            user = User.create(first_name: "Jean", last_name: "Durantt", username: "joe1")
            get :edit, params: { id: user.id }

            # on doit rediriger vers edit
            expect(response).to render_template("edit")
        end
    end

    describe "POST create" do
        context "with valid attributes" do
            it "creates a new user" do
                expect { 
                post :create, params: { "user" => { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.username(specifier: 5..8)} }
                }.to change(User,:count).by(1)
            end
            
            it "redirects to the new user" do
                post :create, params: { "user" => { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.username(specifier: 5..8)} }
        
                # en général tu rediriges vers le show de ce que tu viens de créer
                response.should redirect_to User.last
            end
        end
        context "with invalid attributes" do
            it "doest not create a new user" do
              expect { 
                post :create, params: { "user" => { first_name: Faker::Name.first_name } }
              }.to_not change(User, :count)
            end
            
            it "re-renders the new method" do
              post :create, params: { "user" => { first_name: Faker::Name.first_name } }
              response.should render_template :new
            end
        end 
    end

    describe "PUT update" do
        before :each do
          @user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.username(specifier: 5..8))
        end
    
        context "with valid attributes" do
          it "located the requested @user" do
            put :update, params: { id: @user.id },  params: { "user" => { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.username(specifier: 5..8) }} 
            expect(assigns(:user)).to eq(@user)     
          end
        
        #   it "changes @user's attributes" do
        #     email = Faker::Internet.email
        #     password = Faker::Internet.password
        #     put :update, id: @user, params: { "user" => { email: email, password: password } }
        #     @user.reload
        #     @user.firstname.should eq(email)
        #     @user.lastname.should eq(password)
        #   end
        
        #   it "redirects to the updated contact" do
        #     put :update, id: @user, params: { "user" => { email: Faker::Internet.email, password: Faker::Internet.password } }
      
        #     # redirige où tu veux
        #     response.should redirect_to @user
        #   end
        # end
        
        # context "with invalid attributes" do
        #   it "locates the requested @user" do
        #     put :update, id: @user, params: { "user" => { invalide_magueule } }
        #     assigns(:user).should eq(@user)      
        #   end
          
        #   it "does not change @user's attributes" do
        #     put :update, id: @user, params: { "user" => { invalide_magueule } }
        #     @user.reload
        #     @user.firstname.should_not eq("Jean")
        #     @user.lastname.should eq("Bon")
        #   end
          
        #   it "re-renders the edit method" do
        #     put :update, id: @user, params: { "user" => { invalide_magueule } }
        #     response.should render_template :edit
        #   end
        end
    end
end
