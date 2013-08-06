window.createCORSRequest = (method, url) ->
  xhr = new XMLHttpRequest()
  if "withCredentials" of xhr
    # Check if the XMLHttpRequest object has a "withCredentials" property.
    # "withCredentials" only exists on XMLHTTPRequest2 objects.
    xhr.open method, url, true
  else unless typeof XDomainRequest is "undefined"
    # Otherwise, check if XDomainRequest.
    # XDomainRequest only exists in IE, and is IE's way of making CORS requests.
    xhr = new XDomainRequest()
    xhr.open method, url
  else
    # Otherwise, CORS is not supported by the browser.
    xhr = null
  xhr

# xhr = createCORSRequest("GET", url)
# throw new Error("CORS not supported")  unless xhr

# Make the actual CORS request.
window.makeCorsRequest = (url, successCallback, jsonParams = {}, method = "POST") ->
  
  # url = "http://localhost:3000"
  xhr = createCORSRequest(method, url)
  unless xhr
    alert "CORS not supported"
    return
  
  # Response handlers.
  xhr.onload = ->
    successCallback(xhr)

  xhr.onerror = ->
    alert "Woops, there was an error making the request."

  xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

  params = ""

  _(_(jsonParams).keys()).each (k, index) ->
  	if index == _(jsonParams).keys().length-1
  		params += ("#{k}=#{jsonParams[k]}")
  	else
  		params += ("#{k}=#{jsonParams[k]}&")

  xhr.send(params)
