require 'rails_helper'

describe UsertablesController do
  describe 'Get #index' do
    before do
      @user = create(:user)
    end
    it 'unauthen' do
      get :index
      expect(response).to redirect_to '/users/sign_in'
    end

    it "authen" do
      sign_in @user
      get :index
      expect(response).to have_http_status "200"
    end
  end

  context "as an authenticated user " do
    before do
      @user = create(:user)
      sign_in @user
    end


    describe 'Get #new' do
      it "assigns a new user to @usertable" do
        get :new
        expect(assigns(:usertable)).to be_a_new(Usertable)
      end
      
      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'Get #show' do
        it "assigns the requsted user to @usertable" do
          usertable = create(:usertable)
          get :show, params: { id: usertable.id }
          expect(assigns(:usertable)).to eq usertable
        end
        it "renders the :show template" do
          usertable = create(:usertable)
          get :show, params: { id: usertable.id }
          expect(response).to render_template :show
        end
    end
    
    describe 'Get #edit' do
      it "assigns the requsted user to @usertable" do
        usertable = create(:usertable)
        get :edit, params: { id: usertable.id }
        expect(assigns(:usertable)).to eq usertable
      end
      it "renders the :edit template" do
        usertable = create(:usertable)
        get :edit, params: { id: usertable.id }
        expect(response).to render_template :edit
      end
    end

    describe 'Patch #update' do
      it "update the user in the database" do
        @usertable = create(:usertable)
        usertable_params = attributes_for(:usertable, fname: 'foo')
        patch :update, params: {id: @usertable.id, usertable: usertable_params}
        expect(@usertable.reload.fname).to eq('foo')
      end

      context "invalid attributes" do
        it "does not update the user" do
          @usertable = create(:usertable)
          usertable_params = attributes_for(:usertable, fname: '')
          patch :update, params: {id: @usertable.id, usertable: usertable_params}
          expect(response).to render_template :edit
        end
      end
    end

    # describe 'Patch #update' do
    #   context "valid attributes" do
    #     it "update the user in the database"
    #     it "redirect to the usertables_url"
    #   end
    #   context "invalid attributes" do
    #     it "does not update the user"
    #     it "render the :edit template"
    #   end
    # end
    # describe 'Post #create' do
    #     context "valid attributes" do

    #       params = {
    #           name: "mysad",
    #           sad:123
    #       }
    #       #post url, params: params
    #         it "save the new user in the database" do
                
    #           expect{
    #               usertable = create(:usertable)
    #               post :create, params: { post: usertable}
    #           }.to change(Usertable, :count).by(1)
    #         end

    #         #it "redirect to the @usertable"
    #     end
    #     context "invalid attributes" do
    #         it "does not save the new user"
    #         it "render the :new template"
    #     end
    # end
    
    # describe 'Delete #index' do
    #     it "deletes the user from database"
    #     it "redirect to usertables_url"
    # end
  end
end