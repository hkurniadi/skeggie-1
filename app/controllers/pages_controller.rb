class PagesController < ApplicationController

	def index
		
	end
  
	def search
		if params.has_key?(:sort)
			case params[:sort]
				when "1"
					@search = Course.where("department = ? AND coursenum = ?", params[:subject], params[:coursenum]).order('coursenum')
				when "2"
					@search = Course.where("department = ? AND coursenum < ?", params[:subject], params[:coursenum]).order('coursenum')
				when "3"
					@search = Course.where("department = ? AND coursenum > ?", params[:subject], params[:coursenum]).order('coursenum')
			end
		else
			@search = Course.where("department = ?", params[:subject]).order('coursenum')
		end
		if params.has_key?(:wqb)
			if params[:wqb].include?("Writing")
				@course = @search.select { |val| val.wqb.include?('Writing') }
			end
			if params[:wqb].include?("Quantitative")
				if @course.blank?		
					@course = @search.select { |val| val.wqb.include?('Quantitative')}
				else
					@course = @course | @search.select { |val| val.wqb.include?('Quantitative')}
				end
			end
			if params[:wqb].include?('Breadth-Humanities')
				if @course.blank?
					@course = @search.select { |val| val.wqb.include?('Breadth-Humanities')}
				else
					@course = @course | @search.select { |val| val.wqb.include?('Breadth-Humanities')}
				end
			end
			if params[:wqb].include?("Breadth-Science")
				if @course.blank?
					@course = @search.select { |val| val.wqb.include?('Breadth-Science') || val.wqb.include?('/Science')}
				else
					@course = @course | @search.select { |val| val.wqb.include?('Breadth-Science') || val.wqb.include?('/Science')}
				end
			end
			if params[:wqb].include?('Breadth-Social_Sciences')
				if @course.blank?
					@course = @search.select { |val| val.wqb.include?('Breadth-Social_Sciences') || val.wqb.include?('/Social Sciences')}
				else
					@course = @course | @search.select { |val| val.wqb.include?('Breadth-Social_Sciences') || val.wqb.include?('/Social Sciences')}
				end
			end
		else
			@course = @search
		end
			
	end

  def course
  end
end
