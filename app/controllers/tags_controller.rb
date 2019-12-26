class TagsController < ApplicationController
    
    before_action :require_login, only: [:destroy]

    def show
        @tag = Tag.find(params[:id])
    end

    def index
        @tags = Tag.all
    end

    def destroy
        @tag = Tag.find(params[:id])
        @tag.destroy

        flash.notice = "Tag '#{@tag.name}' Deleted! "

        redirect_to tags_path(@tags)
    end
    
    private

    def require_login
        unless logged_in?
            flash.notice = "You must be logged in to access this section"
            redirect_to tags_path(@tags)
        end
    end

end
