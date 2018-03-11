require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe "GET /projects" do
    context "when there are no projects" do
      before { get :index }

      it { should respond_with(200) }

      it "returns an empty array" do
        json = JSON.parse(response.body)
        expect(json["projects"].length).to eq(0)
      end
    end

    context "when there are projects" do
      let!(:project) { FactoryBot.create(:project) }
      before { get :index }

      it { should respond_with(200) }

      it "returns a list of projects" do
        json = JSON.parse(response.body)
        expect(json["projects"].length).to eq(1)
      end
    end
  end
end
