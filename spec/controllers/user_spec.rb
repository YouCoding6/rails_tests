describe "GET index" do
    # it "assigns @users" do
    #   # création d'une instance
    #   user = User.create
  
    #   # on va sur index
    #   get :index
  
    #   # @users doit être une array qui contient user
    #   expect(assigns(:users)).to eq([user])
    # end
  
    # it "renders the index template" do
    #   # va sur index
    #   get :index
  
    #   # on doit rediriger vers index
    #   expect(response).to render_template("index")
    # end

    describe "GET show" do
        it "assigns @users" do
          # création d'une instance
          user = User.create(first_name: "Jean-Michel", last_name: "Durant", username: "joe")
      
          # on va sur show
          get :show, id: user.id
      
          # @user doit être user
          expect(assigns(:user)).to eq(user)
        end
      
        it "renders the show template" do
          # va sur show
          get :show
      
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
  end