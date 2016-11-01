class Admin::CategoriesController < ApplicationController
	before_action :signed_in_user
	before_action :check_role

	def index
		@categories = Category.get_all_categories
		@category = Category.new
	end

	def edit
		category_id = params['id']
		@category = Category.get_category(category_id)
	end

	def update
		category_id = params['id']

		data_update = {}
		data_update['slug'] = params['slug']
		data_update['category'] = params['category']
		
		@category = Category.update_category(category_id,data_update)
		if !@category.errors.any?
			flash['notice'] = "Category updated successfully"
			redirect_to edit_admin_category_path
		else
			render 'edit'
		end
	end

	def create
		data_create = {}
		data_create['slug'] = params['slug']
		data_create['category'] = params['category']
		
		@category = Category.create_category(data_create)

		if !@category.errors.any?
			flash['notice'] = "Category created successfully"
			redirect_to admin_categories_path
		else
			@categories = Category.get_all_categories
			render 'index'
		end
	end

	def destroy
		category_id = params['id']
	  	Category.destroy_category(category_id)
	 
	  	redirect_to admin_categories_path
	end

end
