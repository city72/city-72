project.service 'restService', ['$resource', ($resource) ->
    stories: $resource '/stories/:id', id: '@id', { update: { method: 'PUT'} }
]