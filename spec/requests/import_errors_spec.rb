 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/import_errors", type: :request do
  
  # ImportError. As you add validations to ImportError, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      ImportError.create! valid_attributes
      get import_errors_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      import_error = ImportError.create! valid_attributes
      get import_error_url(import_error)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_import_error_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      import_error = ImportError.create! valid_attributes
      get edit_import_error_url(import_error)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ImportError" do
        expect {
          post import_errors_url, params: { import_error: valid_attributes }
        }.to change(ImportError, :count).by(1)
      end

      it "redirects to the created import_error" do
        post import_errors_url, params: { import_error: valid_attributes }
        expect(response).to redirect_to(import_error_url(ImportError.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ImportError" do
        expect {
          post import_errors_url, params: { import_error: invalid_attributes }
        }.to change(ImportError, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post import_errors_url, params: { import_error: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested import_error" do
        import_error = ImportError.create! valid_attributes
        patch import_error_url(import_error), params: { import_error: new_attributes }
        import_error.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the import_error" do
        import_error = ImportError.create! valid_attributes
        patch import_error_url(import_error), params: { import_error: new_attributes }
        import_error.reload
        expect(response).to redirect_to(import_error_url(import_error))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        import_error = ImportError.create! valid_attributes
        patch import_error_url(import_error), params: { import_error: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested import_error" do
      import_error = ImportError.create! valid_attributes
      expect {
        delete import_error_url(import_error)
      }.to change(ImportError, :count).by(-1)
    end

    it "redirects to the import_errors list" do
      import_error = ImportError.create! valid_attributes
      delete import_error_url(import_error)
      expect(response).to redirect_to(import_errors_url)
    end
  end
end