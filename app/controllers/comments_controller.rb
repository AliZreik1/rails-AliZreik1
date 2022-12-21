# class CommentsController < ApplicationController
#   before_action :set_comment, only: %i[ show edit update destroy ]

#   # GET /comments or /comments.json
#   def index
#     @comments = Comment.all
#   end

#   # GET /comments/1 or /comments/1.json
#   def show
#   end

#   # GET /comments/new
#   def new
#     klaz_name = params[:commentable_type]
#     thing_id = params[:commentable_id]
#     @thing = klaz_name.constantize.find(thing_id) #suche eine KLasse die so heisst 
#     @comment = Comment.new
#   end

#   # GET /comments/1/edit
#   def edit
#   end

#   # POST /comments or /comments.json
#   def create
#     if params[:employee_id] then  @thing = Employee.find(params[:employee_id])
#     elsif params[:office_id] then @thing = Office.find(params[:office_id])
#     else
#       raise "Dunno what to comment on!"
#     end
#     @comment = Comment.new(comment_params.merge(commentable: @thing))

#     if @comment.save
#       redirect_to(@thing,
#         notice: "Comment was successfully created."
#       )
#     else
#       flash[:danger] = "Comment could not be created."
#       redirect_to(@thing)
#     end
#   end

#   # PATCH/PUT /comments/1 or /comments/1.json
#   def update
#     respond_to do |format|
#       if @comment.update(comment_params)
#         format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
#         format.json { render :show, status: :ok, location: @comment }
#       else
#         format.html { render :edit, status: :unprocessable_entity }
#         format.json { render json: @comment.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /comments/1 or /comments/1.json
#   def destroy
#     @comment.destroy

#     respond_to do |format|
#       format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_comment
#       @comment = Comment.find(params[:id])
#     end

#     # Only allow a list of trusted parameters through.
#     def comment_params
#       params.require(:comment).permit(:text)
#     end
# end
class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # POST /comments or /comments.json
  def create
    if params[:employee_id] then  @thing = Employee.find(params[:employee_id])
    elsif params[:office_id] then @thing = Office.find(params[:office_id])
    else
      raise "Dunno what to comment on!"
    end
    @comment = Comment.new(comment_params.merge(commentable: @thing))

    if @comment.save
      redirect_to(@thing,
        notice: "Comment was successfully created."
      )
    else
      flash[:danger] = "Comment could not be created."
      redirect_to(@thing)
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end