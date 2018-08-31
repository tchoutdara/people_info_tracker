class PeopleController < ApplicationController
  def index
    @people = Person.order(created_at: :asc)
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(people_params)

    if @person.save
      redirect_to people_path
    else
      render :new
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(people_params)
      redirect_to person_path(@person.id)
    else
      render :edit
    end
  end

  def destroy
    Person.find(params[:id]).destroy
    redirect_to people_path
  end

  private

    def people_params
      params.require(:person).permit(:name, :age, :hair_color, :eye_color, :gender, :alive)
    end

end
