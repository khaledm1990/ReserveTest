json.owner_name @article.owner.name
json.partial! 'api/v1/shared/article', article: @article
