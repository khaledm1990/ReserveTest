json.owner_name   @owner.name
json.articles do 
    json.array! @owner.articles do |article|
        json.partial! 'api/v1/shared/article', article: article
    end 
end 