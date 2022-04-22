class BoardUsersController < ApplicationController
  before_action :set_board_user, only: %i[ show edit update destroy ]

  # GET /board_users or /board_users.json
  def index
    @board_users = BoardUser.all
  end

  # GET /board_users/1 or /board_users/1.json
  def show
  end

  # GET /board_users/new
  def new
    @board_user = BoardUser.new
  end

  # GET /board_users/1/edit
  def edit
  end

  # POST /board_users or /board_users.json
  def create
    @board_user = BoardUser.new(board_user_params)

    respond_to do |format|
      if @board_user.save
        format.html { redirect_to board_user_url(@board_user), notice: "Board user was successfully created." }
        format.json { render :show, status: :created, location: @board_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @board_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /board_users/1 or /board_users/1.json
  def update
    respond_to do |format|
      if @board_user.update(board_user_params)
        format.html { redirect_to board_user_url(@board_user), notice: "Board user was successfully updated." }
        format.json { render :show, status: :ok, location: @board_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @board_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /board_users/1 or /board_users/1.json
  def destroy
    @board_user.destroy

    respond_to do |format|
      format.html { redirect_to board_users_url, notice: "Board user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board_user
      @board_user = BoardUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def board_user_params
      params.require(:board_user).permit(:nickname, :account_id, :memo)
    end
end
