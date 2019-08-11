# frozen_string_literal: true

class AttachmentsController < AdminController

  def destroy
    ActiveStorage::Attachment.find(params[:id]).purge
  end

end
