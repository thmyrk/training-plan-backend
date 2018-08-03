require "rails_helper"

RSpec.describe "Exercises API" do
  include_context "model response keys"

  let(:parsed_response) do
    JSON.parse(response.body)
  end

  RSpec.shared_examples "exercises invalid parameter format" do |parameter_name, incorrect_value|
    let(:request_params) { super().merge({ parameter_name => incorrect_value }) }
    it do
      subject
      expect(response).to have_http_status(400)
    end
    it { expect { subject }.to change { Exercise.count }.by(0) }
    it do
      subject
      expect(parsed_response).to include("errors")
    end
  end

  context "POST #create" do
    let(:name) { "Breakfast" }
    let(:request_params) do
      {
        name: name
      }
    end
    subject { post "/api/v1/exercises", params: request_params }

    describe "param validation" do
      it_behaves_like "exercises invalid parameter format", :name, ""
      it_behaves_like "exercises invalid parameter format", :name, nil
    end

    describe "response" do
      before { subject }
      it { expect(response).to have_http_status(201) }
      it { expect(parsed_response).to be_empty }
    end

    it do
      subject
      expect(response).to have_http_status(201)
    end
    it { expect { subject }.to change { Exercise.count }.by(1) }
  end
end
