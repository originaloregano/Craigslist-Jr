get '/categories/:cat_id/articles/new' do
  @category = Category.find(params[:cat_id])
  erb :'articles/new'
end

post '/categories/:cat_id/articles' do
  @category = Category.find_by(id: params[:cat_id])
  @new_article = @category.articles.new(params[:article])

  if @new_article.save
    redirect "/categories/#{@new_article.id}"
    #conventional to go back to specific article
  else
    @errors = @new_article.errors.full_messages
    erb :'articles/new'
  end
end

# before '/categories/:cat_id/articles/:art_id/*' do
#   @article = Article.find(params[:art_id])
# end

get '/categories/:cat_id/articles/:art_id' do
  @article = Article.find(params[:art_id])

  erb :'articles/show'
end

get '/categories/:cat_id/articles/:art_id/edit' do
  @article = Article.find(params[:art_id])

  erb :'articles/edit'
end

put '/categories/:cat_id/articles/:art_id' do
  @article = Article.find(params[:art_id])
  @article.update_attributes(params[:article])

  if @article.save
    redirect "/categories/#{@article.category_id}/articles/#{@article.id}"
  else
    @errors = ["Unable to edit this article."]
    erb :'articles/edit'
  end
end

delete '/categories/:cat_id/articles/:art_id' do
  @article = Article.find(params[:art_id])
  @article.destroy

  redirect "/categories/#{@article.category_id}"
end



