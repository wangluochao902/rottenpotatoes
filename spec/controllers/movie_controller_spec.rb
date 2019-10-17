require 'rails_helper'

describe MoviesController, type: :controller do
  describe "#find_same_director"do
    before :each do
        @movie_id = '123'
        @movie = double(:title => 'test_title', :director => 'George Lucas')
    end
    context "When the movie has a director" do
      it "should find all movies with the same director" do
        Movie.should_receive(:find).with(@movie_id).and_return(@movie)
        get :find_same_director, :id => @movie_id
        response.should render_template('find_same_director')
      end
    end

    context "When the movie has no director" do
      it "should redirect to the movies page" do
        @movie = double(:title => 'test_movie').as_null_object
        Movie.should_receive(:find).with(@movie_id).and_return(@movie)
        get :find_same_director, :id => @movie_id
        expect(response).to redirect_to(movies_path)
      end
    end
  end
end 