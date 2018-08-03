RSpec.shared_context "model response keys" do
  let(:workout_response_keys) do
    %w[id name exercises updated_at created_at]
  end

  let(:exercise_response_keys) do
    %w[id name tags updated_at created_at]
  end

  let(:tag_response_keys) do
    %w[id name updated_at created_at]
  end
end
