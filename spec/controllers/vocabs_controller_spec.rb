require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe VocabsController do

  def mock_vocab(stubs={})
    @mock_vocab ||= mock_model(Vocab, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all vocabs as @vocabs" do
      Vocab.stub(:all) { [mock_vocab] }
      get :index
      assigns(:vocabs).should eq([mock_vocab])
    end
  end

  describe "GET show" do
    it "assigns the requested vocab as @vocab" do
      Vocab.stub(:find).with("37") { mock_vocab }
      get :show, :id => "37"
      assigns(:vocab).should be(mock_vocab)
    end
  end

  describe "GET new" do
    it "assigns a new vocab as @vocab" do
      Vocab.stub(:new) { mock_vocab }
      get :new
      assigns(:vocab).should be(mock_vocab)
    end
  end

  describe "GET edit" do
    it "assigns the requested vocab as @vocab" do
      Vocab.stub(:find).with("37") { mock_vocab }
      get :edit, :id => "37"
      assigns(:vocab).should be(mock_vocab)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created vocab as @vocab" do
        Vocab.stub(:new).with({'these' => 'params'}) { mock_vocab(:save => true) }
        post :create, :vocab => {'these' => 'params'}
        assigns(:vocab).should be(mock_vocab)
      end

      it "redirects to the created vocab" do
        Vocab.stub(:new) { mock_vocab(:save => true) }
        post :create, :vocab => {}
        response.should redirect_to(vocab_url(mock_vocab))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vocab as @vocab" do
        Vocab.stub(:new).with({'these' => 'params'}) { mock_vocab(:save => false) }
        post :create, :vocab => {'these' => 'params'}
        assigns(:vocab).should be(mock_vocab)
      end

      it "re-renders the 'new' template" do
        Vocab.stub(:new) { mock_vocab(:save => false) }
        post :create, :vocab => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested vocab" do
        Vocab.stub(:find).with("37") { mock_vocab }
        mock_vocab.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :vocab => {'these' => 'params'}
      end

      it "assigns the requested vocab as @vocab" do
        Vocab.stub(:find) { mock_vocab(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:vocab).should be(mock_vocab)
      end

      it "redirects to the vocab" do
        Vocab.stub(:find) { mock_vocab(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(vocab_url(mock_vocab))
      end
    end

    describe "with invalid params" do
      it "assigns the vocab as @vocab" do
        Vocab.stub(:find) { mock_vocab(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:vocab).should be(mock_vocab)
      end

      it "re-renders the 'edit' template" do
        Vocab.stub(:find) { mock_vocab(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vocab" do
      Vocab.stub(:find).with("37") { mock_vocab }
      mock_vocab.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the vocabs list" do
      Vocab.stub(:find) { mock_vocab }
      delete :destroy, :id => "1"
      response.should redirect_to(vocabs_url)
    end
  end

end