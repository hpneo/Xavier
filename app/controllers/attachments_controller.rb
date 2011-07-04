class AttachmentsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create

  def manage
    @attachments = "#{params[:media]}".classify.constantize.all.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 10
    render :update do |page|
      page.replace_html :dynamic_images_list, :partial => 'show_attachment_list'
    end
  end
  


  def create
    @attachment = "#{params[:media]}".classify.constantize.new params[params[:media]]
    
    if @attachment.save
      GC.start
      responds_to_parent do
        render :update do |page|
          page << "upload_callback();"
        end
      end
    else
      responds_to_parent do
        render :update do |page|
          page.alert('Sorry, there was an error uploading the photo.')
        end
      end
    end
  end
end
=begin
class AttachmentsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create
 respond_to :js
  def manage
    @attachments = "#{params[:media]}".classify.constantize.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 10
    respond_with @attachments
  end
  


  def create
    @attachment = "#{params[:media]}".classify.constantize.new(params[params[:media]])
    
    if @attachment.save
      GC.start
    end
      responds_to_parent do
        respond_with @attachment
      end
  end
end
=end