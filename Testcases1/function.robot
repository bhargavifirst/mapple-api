**** settings ****
Library  RequestsLibrary
Library    String
Library   Collections
Library    DateTime
Library    Dialogs
Library    XML

***** Variables ***

${base_url}  https://qapiv1.maplerecord.com/api
**** Test Cases ***
list_request
      Create Session      mysession   ${base_url}
      ${body} =  create dictionary
       ${header} =  create dictionary  Content-Type=application/json
       ${response} =  post request  mysession   /function/list     data=${body}  headers=${header}
    Log To Console   ${response.status_code}
    Log To Console    ${response.content}
      #validation
   ${status_code}=  convert to string   ${response.status_code}
    should be equal  ${status_code}    200
add_request
    Create Session      mysession   ${base_url}
     ${body} =  create dictionary      functionName=agency schools
    ${header} =  create dictionary  Content-Type=application/json
     ${response} =  post request  mysession   /function/add  data=${body}  headers=${header}
    Log To Console   ${response.status_code}
    Log To Console    ${response.content}

     #validation
   ${status_code}=  convert to string   ${response.status_code}
    should be equal  ${status_code}    200

delete_request
   Create Session      mysession   ${base_url}
    ${response} =  post request  mysession   function/delete?Id=11

      Log To Console   ${response.status_code}
    Log To Console    ${response.content}

    #validation
   ${status_code}=  convert to string   ${response.status_code}
    should be equal  ${status_code}    200
update_request
    Create Session      mysession   ${base_url}
    ${body} =  create dictionary   id=8  functionName=residential schools
       ${header} =  create dictionary  Content-Type=application/json
       ${response} =  post request  mysession    /function/update    data=${body}  headers=${header}


      Log To Console   ${response.status_code}
      Log To Console    ${response.content}

     #validation
   ${status_code}=  convert to string   ${response.status_code}
    should be equal  ${status_code}    200


