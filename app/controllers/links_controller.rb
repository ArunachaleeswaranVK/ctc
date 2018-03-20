class LinksController < ApplicationController
    
    before_action :set_link ,only: [:show , :edit, :update, :destroy]
    before_action :authenticate_user! , except: [:index,:show]
    
    
    def index
       @links = Link.search(params[:search])
    end
    
    def show
       @comments = Comment.where(link_id: @link).order(cached_votes_score: :desc)
       @starred = @comments.first
    end
    
    def new
       @link = current_user.links.new
    end
    
    def create
       
            # params[:links].each do |link_params|
            # @links = Link.new(link_params)
            #     if @links.save
            #         redirect_to root_path
            #     else
            #         render "new"
            #     end    
            # end
            
            params[:links].each do |my_params|
                current_user.links.create(link_params(my_params))
               
            end
            
            
            redirect_to root_path
            
            # if params.has_key?("puppy")
            #     Puppy.create(puppy_params(params["puppy"]))
            # else
            #     params["puppies"].each do |puppy|
            # if puppy["name"] != "" || puppy["breed"] != ""
            #     Puppy.create(puppy_params(puppy))
            # end
            # end
            # end
    end
    
    def edit
        
    end
    
    def update
        if @link.update(link_params)
            redirect_to root_path
        else
            render "edit"
        end    
            
    end
    
    def destroy
        @link.destroy
        redirect_to root_path
    end    
       
    private
    
    def set_link
       @link =  Link.find(params[:id]) 
    end  
    
    def link_params(my_params)
        my_params.permit(:url)
    end
    
end
