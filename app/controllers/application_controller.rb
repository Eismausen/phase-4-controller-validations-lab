class ApplicationController < ActionController::API

    rescue_from ActiveRecord::RecordInvalid, with: :rescue_record_invalid

    private

    def rescue_record_invalid(exception)
        error_hash = {}
        exception.record.errors.each do |error|
            error_hash[error.attribute] = error.full_message
        end
        render json: { errors: error_hash }, status: :unprocessable_entity
    end
end
