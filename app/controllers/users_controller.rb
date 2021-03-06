class UsersController < ApplicationController
  before_action :set_user, only: %i[ win draw lose ]

  # GET /users or /users.json
  def index
    @users = User.order(points: :desc).all
    render json: @users, only: [:id, :name, :wins, :draws, :losses, :points]
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
    render json: @user, only: [:id, :name, :wins, :draws, :losses, :points]
  end

  def win
    @user.wins += 1
    @user.points += 2
    @user.save

    render json: @user
  end

  def draw
    @user.draws += 1
    @user.points += 1
    @user.save

    render json: @user
  end

  def lose
    @user.losses += 1
    @user.save

    render json: @user
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user = User.find(params[:id])

    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.where(name: user_params[:name]).first_or_create
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :wins, :draws, :losses, :points)
    end
end
