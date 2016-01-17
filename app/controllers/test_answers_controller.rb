class TestAnswersController < ApplicationController
  layout "dashboard"
  before_action :set_test_answer, only: [:show, :edit, :update, :destroy]

  # GET /test_answers
  # GET /test_answers.json
  def index
    @test_answers = TestAnswer.all

    @test_answer=@test_answers.first

    @metric_totals_group=[]
    @test_answers.each do |test_answer|
      @metric_totals=[]
      test_answer.test.metrics.each do |metric|
        metric_value = 0
        test_answer.answers.each do |answer|
          if answer.question.metric == metric
            if answer.question.inverted_value
              metric_value-=answer.value
            else
              metric_value+=answer.value
            end
          end
        end
        @metric_totals.push([metric,metric_value])
      end
      @metric_totals_group.push(@metric_totals)
    end
  end

  # GET /test_answers/1
  # GET /test_answers/1.json
  def show
    @metric_totals=[]
    @test_answer.test.metrics.each do |metric|
      metric_value = 0
      @test_answer.answers.each do |answer|
        if answer.question.metric == metric
          if answer.question.inverted_value
            metric_value-=answer.value
          else
            metric_value+=answer.value
          end
        end
      end
      @metric_totals.push([metric,metric_value])
    end
  end

  # GET /test_answers/new
  def new
    @test_answer = TestAnswer.new
    @test = Test.find_by_id(params[:test_id])
  end

  # GET /test_answers/1/edit
  def edit
  end

  # POST /test_answers
  # POST /test_answers.json
  def create
    @test_answer = TestAnswer.new(test_answer_params)

    respond_to do |format|
      if @test_answer.save
        params[:questions].each do |question|
          answer = Answer.new
          answer.test_answer_id = @test_answer.id
          answer.question_id = question.first
          answer.value = question.second.to_i
          answer.save
        end
        format.html { redirect_to @test_answer, notice: 'Test answer was successfully created.' }
        format.json { render :show, status: :created, location: @test_answer }
      else
        format.html { render :new }
        format.json { render json: @test_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_answers/1
  # PATCH/PUT /test_answers/1.json
  def update
    respond_to do |format|
      if @test_answer.update(test_answer_params)
        format.html { redirect_to @test_answer, notice: 'Test answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_answer }
      else
        format.html { render :edit }
        format.json { render json: @test_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_answers/1
  # DELETE /test_answers/1.json
  def destroy
    @test_answer.destroy
    respond_to do |format|
      format.html { redirect_to test_answers_url, notice: 'Test answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_answer
      @test_answer = TestAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_answer_params
      params.require(:test_answer).permit(:username,:test_id)
    end
end
