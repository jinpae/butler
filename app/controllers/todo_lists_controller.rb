class TodoListsController < ApplicationController
	before_action :authenticate_user!
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy, :toggle_completed_items]

  # GET /todo_lists
  # GET /todo_lists.json
  def index
    @todo_lists = current_user.todo_lists.all
  end

  # GET /todo_lists/1
  # GET /todo_lists/1.json
  def show
		@todo_item = TodoItem.new

		if request.path != todo_list_path(@todo_list)
			redirect_to @todo_list, status: :moved_permanently
		end
  end

  # GET /todo_lists/new
  def new
		@todo_list = current_user.todo_lists.new
  end

  # GET /todo_lists/1/edit
  def edit
  end

  # POST /todo_lists
  # POST /todo_lists.json
  def create
    @todo_list = current_user.todo_lists.new(todo_list_params)

    respond_to do |format|
      if @todo_list.save
        format.html { redirect_to @todo_list }
        format.json { render :show, status: :created, location: @todo_list }
      else
        format.html { render :new }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo_lists/1
  # PATCH/PUT /todo_lists/1.json
  def update
    respond_to do |format|
      if @todo_list.update(todo_list_params)
        format.html { redirect_to @todo_list }
        format.json { render :show, status: :ok, location: @todo_list }
      else
        format.html { render :edit }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_lists/1
  # DELETE /todo_lists/1.json
  def destroy
    @todo_list.destroy
    respond_to do |format|
      format.html { redirect_to todo_lists_url }
      format.json { head :no_content }
    end
  end

	def toggle_completed_items
		@todo_list.toggle_hide_completed_items

		respond_to do |format|
			format.html { redirect_to @todo_list }
			format.js
		end
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todo_list = current_user.todo_lists.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_list_params
      params.require(:todo_list).permit(:title, :description, :hide_completed_items)
    end
end
