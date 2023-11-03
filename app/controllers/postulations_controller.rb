class PostulationsController < ApplicationController
    def create
        @publication = Publication.find(params[:postulation][:publication_id])
        @postulation = Postulation.new(postulation_params)
        @postulation.user = current_user
        respond_to do |format|
            if @postulation.save
            format.html { redirect_to publication_path(@publication.id), notice:
            'Postulation was successfully created.' }
            else
            format.html { redirect_to publication_path(@publication.id), notice:
            'Postulation was not created.' }
            end
        end
    end

    private
    def postulation_params
        params.require(:postulation).permit(:content, :publication_id)
    end
end
