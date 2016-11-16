require 'rails_helper'

RSpec.describe StatusesController, :type => :controller do

  let(:dog_attributes) {
    {
      name: "Fluffy",
      email: "fluffster@aol.com",
      password: "testtest",
      password_confirmation: "testtest",
      birthday: Time.now-3.years,
      city: "New York",
      state: "NY",
      newsletter: true
    }
  }

  let(:dog){ Dog.create!(dog_attributes) }

  let(:valid_attributes) {
    @valid_attributes = {
      body: "Woo I'm a dog.",
      dog_id: dog.id
    }
  }

  let(:invalid_attributes) {
    @invalid_attributes = {
      body: nil,
      dog_id: dog.id
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # StatusesController. Be sure to keep this updated too.
  let(:valid_session) { {dog_id: dog.id} }

  describe "GET index" do
    it "assigns all statuses as @statuses" do
      status = Status.create! valid_attributes
      get :index, valid_session
      expect(assigns(:statuses)).to eq([status])
    end
  end

  describe "GET show" do
    it "assigns the requested status as @status" do
      status = Status.create! valid_attributes
      get :show, {:id => status.to_param, :dog_id => dog.id}, valid_session
      expect(assigns(:status)).to eq(status)
    end
  end

  describe "GET new" do
    it "assigns a new status as @status" do
      get :new, valid_session
      expect(assigns(:status)).to be_a_new(Status)
    end
  end

  describe "GET edit" do
    it "assigns the requested status as @status" do
      status = Status.create! valid_attributes
      get :edit, {:id => status.to_param, :dog_id => dog.id}, valid_session
      expect(assigns(:status)).to eq(status)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Status" do
        expect {
          post :create, {:status => valid_attributes, :dog_id => dog.id}, valid_session
        }.to change(Status, :count).by(1)
      end

      it "assigns a newly created status as @status" do
        post :create, {:status => valid_attributes, :dog_id => dog.id}, valid_session
        expect(assigns(:status)).to be_a(Status)
        expect(assigns(:status)).to be_persisted
      end

      it "redirects to the created status" do
        post :create, {:status => valid_attributes, :dog_id => dog.id}, valid_session
        expect(response).to redirect_to(dog)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved status as @status" do
        post :create, {:status => invalid_attributes, :dog_id => dog.id}, valid_session
        expect(assigns(:status)).to be_a_new(Status)
      end

      it "re-renders the 'new' template" do
        post :create, {:status => invalid_attributes, :dog_id => dog.id}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        @valid_attributes = {
          body: "Woo I'm a dog, again.",
          dog_id: dog.id
        }
      }

      it "updates the requested status" do
        status = Status.create! valid_attributes
        put :update, {:id => status.to_param, :status => new_attributes, :dog_id => dog.id}
        status.reload
        expect(status.body).to eq("Woo I'm a dog, again.")
      end

      it "assigns the requested status as @status" do
        status = Status.create! valid_attributes
        put :update, {:id => status.to_param, :status => valid_attributes, :dog_id => dog.id}, valid_session
        expect(assigns(:status)).to eq(status)
      end

      it "redirects to the status" do
        status = Status.create! valid_attributes
        put :update, {:id => status.to_param, :status => valid_attributes, :dog_id => dog.id}, valid_session
        expect(response).to redirect_to([status.dog, status])
      end
    end

    describe "with invalid params" do
      it "assigns the status as @status" do
        status = Status.create! valid_attributes
        put :update, {:id => status.to_param, :status => invalid_attributes, :dog_id => dog.id}, valid_session
        expect(assigns(:status)).to eq(status)
      end

      it "re-renders the 'edit' template" do
        status = Status.create! valid_attributes
        put :update, {:id => status.to_param, :status => invalid_attributes, :dog_id => dog.id}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested status" do
      status = Status.create! valid_attributes
      expect {
        delete :destroy, {:id => status.to_param, :dog_id => dog.id}, valid_session
      }.to change(Status, :count).by(-1)
    end

    it "redirects to the statuses list" do
      status = Status.create! valid_attributes
      delete :destroy, {:id => status.to_param, :dog_id => dog.id}, valid_session
      expect(response).to redirect_to(dog_statuses_url)
    end
  end

end
