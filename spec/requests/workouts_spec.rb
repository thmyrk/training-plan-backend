require "rails_helper"

RSpec.describe "Workouts API" do
  include_context "model response keys"

  let(:parsed_response) do
    JSON.parse(response.body)
  end

  RSpec.shared_examples "workouts invalid parameter format" do |parameter_name, incorrect_value|
    let(:request_params) { super().merge({ parameter_name => incorrect_value }) }
    it do
      subject
      expect(response).to have_http_status(400)
    end
    it do
      subject
      expect(parsed_response).to include("errors")
    end
  end

  context "GET #show" do
    let(:workout) { create(:workout) }
    let(:workout_id) { workout.id }
    let(:workout_name) { workout.name }
    subject { get "/api/v1/workouts/#{workout_id}" }

    describe "response" do
      before { subject }

      it { expect(response).to have_http_status(200) }
      it { expect(parsed_response.keys).to match_array(workout_response_keys) }
      it { expect(parsed_response["id"]).to eq(workout_id) }
      it { expect(parsed_response["name"]).to eq(workout_name) }
    end

    it do
      subject
      expect(response).to have_http_status(200)
    end

    context "when workout with given id doesn't exist" do
      let(:workout_id) { "9318343c-0374-4d26-b6cd-f63b18e7cde4" }
      before { subject }

      it { expect(response).to have_http_status(404) }
      it { expect(parsed_response.keys).to eq(["errors"]) }
    end

    context "when workout has workout exercises" do
      let(:workout) { create(:workout, :with_exercises_with_tags) }

      before { subject }
      it { expect(response).to have_http_status(200) }
      it { expect(parsed_response.keys).to match_array(workout_response_keys) }
      it { expect(parsed_response["id"]).to eq(workout_id) }
      it { expect(parsed_response["name"]).to eq(workout_name) }
      it { expect(parsed_response["workout_exercises"].first.keys).to match_array(workout_exercise_response_keys) }
      it { expect(parsed_response["workout_exercises"].first["exercise"].keys).to match_array(exercise_response_keys) }
      it { expect(parsed_response["workout_exercises"].first["exercise"]["tags"].first.keys).to match_array(tag_response_keys) }
    end
  end
end
