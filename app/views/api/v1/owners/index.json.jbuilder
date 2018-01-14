json.owners do
    json.array! @owners do |owner|
        json.partial! 'api/v1/shared/owner', owner: owner
    end 
end 