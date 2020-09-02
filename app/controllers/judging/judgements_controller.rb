class Judging::JudgementsController < ApplicationController
  before_action :get_topic
  before_action :set_judgement, only: [:show, :edit, :update, :destroy]

  def new
      @judgement = @topic.judgements.new
  end

  def create
    @judgement = @topic.judgements.new(judgement_params)
    @judgement.owner = current_user

    @judgement.determineWinner

    respond_to do |format|
      if @judgement.save
        format.html { redirect_to judging_topic_path(@topic), notice: 'Judgment was successfully created.' }
        format.json { render :show, status: :created, location: @judgement }
      else
        format.html { render :new }
        format.json { render json: @judgement.errors, status: :unprocessable_entity }
      end
    end
  #  if params[:winner_selection].eql?('creator')
  #    self.winner = self.topic.owner
  #    self.loser = self.topic.challenger
  #  else
  #    self.winner = self.topic.challenger
  #    self.loser = self.topic.owner
    #end
    #self.save    @judgement.save
  end

  def show

  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    @judgements = @topic.judgements.all
  end

  private
    def get_topic
      @topic = Topic.find(params[:topic_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_judgement
      @judgement = @topic.judgements.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def judgement_params

      params.require(:judgement).permit(:opinion,:owner_id,:topic_id,:winner_id,:loser_id,:winner_selection)
    end
end
