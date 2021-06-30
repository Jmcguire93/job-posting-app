class PostingsController < ApplicationController
  def create
    if current_user && current_user.admin
      posting = Posting.new(
        position: params[:position],
        salary: params[:salary],
        description: params[:description],
        company: params[:company]
      )

      if posting.save
        render json: posting.as_json
      else
        render json: { errors: posting.error.full_messages },
        status: :unprocessable_entity
      end 
    else 
      render json: {}, status: :unauthorized
    end
  end

  def update
    posting_id = params["id"]
    posting = Posting.find_by(id: posting_id)

    posting.position = params["position"] || posting.position
    posting.salary = params["salary"] || posting.salary
    posting.description = params["description"] || posting.description
    posting.company = params["company"] || posting.company
    
    if posting.save 
      render json: posting.as_json #
    else
      render json: { errors: posting.error.full_messages },
      status: :unprocessable_entity
    end
  end
end
