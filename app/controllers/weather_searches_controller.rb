class WeatherSearchesController < ApplicationController
  before_action :set_weather_search, only: %i[ show edit update destroy ]

  # GET /weather_searches or /weather_searches.json
  def index
    @weather_searches = WeatherSearch.all
  end

  # GET /weather_searches/1 or /weather_searches/1.json
  def show
  end

  # GET /weather_searches/new
  def new
    @weather_search = WeatherSearch.new
  end

  # GET /weather_searches/1/edit
  def edit
  end

  # POST /weather_searches or /weather_searches.json
  def create
    @weather_search = if weather_search_params[:zip].present?
                        WeatherSearch.find_by(zip: weather_search_params[:zip],
                                              country: weather_search_params[:country] || 'US')
                      elsif weather_search_params[:city].present? && weather_search_params[:state].present?
                        WeatherSearch.find_by(city: weather_search_params[:city],
                                              state: weather_search_params[:state],
                                              country: weather_search_params[:country] || 'US')
                      end

    if @weather_search.present? && (@weather_search.updated_at? + 30.min) > DateTime.now
      @cached_weather = true
    else
      ows_params = weather_search_params.slice(:city, :state, :country, :zip).to_h.symbolize_keys
      result = OpenWeatherService.call(**ows_params)
      @weather_search = WeatherSearch.new(weather_search_params.to_h.merge({temp_f: result.main.temp_f,
                                                                            temp_max_f: result.main.temp_max_f,
                                                                            temp_min_f: result.main.temp_min_f}))
    end

    respond_to do |format|
      if @weather_search.save
        format.html { redirect_to weather_search_url(@weather_search), notice: "Weather search was successfully created." }
        format.json { render :show, status: :created, location: @weather_search }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @weather_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weather_searches/1 or /weather_searches/1.json
  def update
    respond_to do |format|
      if @weather_search.update(weather_search_params)
        format.html { redirect_to weather_search_url(@weather_search), notice: "Weather search was successfully updated." }
        format.json { render :show, status: :ok, location: @weather_search }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @weather_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weather_searches/1 or /weather_searches/1.json
  def destroy
    @weather_search.destroy!

    respond_to do |format|
      format.html { redirect_to weather_searches_url, notice: "Weather search was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weather_search
      @weather_search = WeatherSearch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def weather_search_params
      params.require(:weather_search).permit(:city, :state, :country, :zip)
    end
end
