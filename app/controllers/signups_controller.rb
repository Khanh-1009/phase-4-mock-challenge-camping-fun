class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create
        post = Signup.create!(post_params)
        render json: post, status: :created
    end

    private

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def post_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
