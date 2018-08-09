require "rails_helper"

RSpec.describe "WorkoutExercises API" do
  include_context "model response keys"
  include_context "rspec helpers"

  let(:parsed_response) do
    JSON.parse(response.body)
  end

  RSpec.shared_examples "workout_exercises invalid parameter format" do |parameter_name, incorrect_value|
    let(:request_params) { super().merge({ parameter_name => incorrect_value }) }
    it do
      subject
      expect(response).to have_http_status(400)
    end
    it { expect { subject }.to change { WorkoutExercise.count }.by(0) }
    it do
      subject
      expect(parsed_response).to include("errors")
    end
  end

  context "POST #create" do
    let(:workout) { create(:workout) }
    let(:workout_id) { workout.id }
    let(:exercise) { create(:exercise) }
    let(:exercise_id) { exercise.id }
    let(:reps) { 10 }
    let(:sets) { 3 }
    let(:request_params) do
      {
        workout_id: workout_id,
        exercise_id: exercise_id,
        reps: reps,
        sets: sets
      }
    end
    subject { post "/api/v1/workout_exercises", params: request_params }

    describe "param validation" do
      it_behaves_like "workout_exercises invalid parameter format", :workout_id, "string"
      it_behaves_like "workout_exercises invalid parameter format", :workout_id, nil
      it_behaves_like "workout_exercises invalid parameter format", :exercise_id, "string"
      it_behaves_like "workout_exercises invalid parameter format", :exercise_id, nil
      it_behaves_like "workout_exercises invalid parameter format", :reps, "string"
      it_behaves_like "workout_exercises invalid parameter format", :sets, "string"
    end

    describe "response" do
      before { subject }
      it { expect(response).to have_http_status(201) }
      it { expect(parsed_response.keys).to match_array(workout_exercise_response_keys) }
      it { expect(parsed_response["workout_id"]).to eq(workout_id) }
      it { expect(parsed_response["reps"]).to eq(reps) }
      it { expect(parsed_response["sets"]).to eq(sets) }
      it { expect(parsed_response["exercise"].keys).to match_array(exercise_response_keys) }
    end

    it do
      subject
      expect(response).to have_http_status(201)
    end
    it { expect { subject }.to change { WorkoutExercise.count }.by(1) }

    context "when non-existing workout_id given" do
      let(:workout_id) { random_uuid }

      before { subject }
      it { expect(response).to have_http_status(400) }
    end

    context "when non-existing exercise_id given" do
      let(:exercise_id) { random_uuid }

      before { subject }
      it { expect(response).to have_http_status(400) }
    end

    context "when reps and sets aren't passed" do
      let(:request_params) { super().except(:reps, :sets) }

      it do
        subject
        expect(response).to have_http_status(201)
      end
      it { expect { subject }.to change { WorkoutExercise.count }.by(1) }
    end

    context "when reps and sets are empty strings" do
      let(:sets) { "" }
      let(:reps) { "" }

      it do
        subject
        expect(response).to have_http_status(201)
      end
      it { expect { subject }.to change { WorkoutExercise.count }.by(1) }
    end
  end
end
